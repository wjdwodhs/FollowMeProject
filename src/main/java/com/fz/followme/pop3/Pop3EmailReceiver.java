package com.fz.followme.pop3;

import java.io.InputStream;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Component;

import com.fz.followme.dao.EmailDao;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


/**
 * POP3를 사용하여 Gmail에서 이메일을 수신하고, 수신된 이메일을 DB에 저장하는 클래스
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class Pop3EmailReceiver {

	private final FileUtil fileUtil;
	private final EmailDao emailDao;
	
	private String host = "pop.gmail.com"; // gmail POP3 서버 주소
	private String username = "followme180624@gmail.com";
	private String password = "q z k n b d n e q q o b w g r o";
	

	
	
	// Gmail POP3 서버에서 이메일을 수신하는 메서드
	public void receiveEmails() {
		
		try {
			
			// POP3 서버 설정(보안연결을 위해 SSL 활성화)
			Properties properties = new Properties();
			properties.put("mail.pop3.host", host);
			properties.put("mail.pop3.port", "995"); // Gmail POP3 SSL 포트
			properties.put("mail.pop3.starttls.enable", "true"); // STARTTLS 사용 설정
			properties.put("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL소켓 팩토리 클래스 지정
			properties.put("mail.pop3.socketFactory.fallback", "false"); // SSL 소켓 팩토리에서 실패시 다른 소켓 팩토리를 사용하지 않도록 설
			properties.put("mail.pop3.socketFactory.port", "995");  // SSL 소켓 팩토리가 사용할 포트번호, Gmail의 SSL포트 995
			
			
			// 메일 세션 생성
			Session emailSession = Session.getDefaultInstance(properties);
			
			// POP3 스토어 객체 생성
			Store store = emailSession.getStore("pop3s");
			
			// 스토어에 연결
			store.connect(host, username, password);
			
			
			// 받은 편지함 폴더 열기
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);
			
			// 이메일 메세지 가져오기
			Message[] messages = emailFolder.getMessages();
			for(Message message : messages) {
				
				// 각 이메일 메세지를 DB에 저장
				saveEmailToDatabase(message);
			}
			
			// 폴더와 스토어 닫기
			emailFolder.close(false);
			store.close();
		} catch (Exception  e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 메일을 DB에 저장하는 메서드
	private void saveEmailToDatabase(Message message) {
		
		try {
			// 이메일 발신자, 제목, 내용 가져오기
			String from = message.getFrom()[0].toString();
			from = decodeText(from);
			String subject = message.getSubject();
			String content = getTextFromMessage(message);
			
			// 메일정보를 DB에 저장하는 로직
			EmailDto ed =new EmailDto();
			ed.setEmailFrom(from);
			ed.setEmailTo("followme180624@gmail.com");
			ed.setSubject(subject);
			ed.setText(content);
			ed.setRegistDate(new Date().toString());
			ed.setEmailStatus("ACTIVE");
			ed.setForder("INBOX");
			ed.setIsImportant(0);
			ed.setIsRead(0);
			
			emailDao.insertReceiveEmail(ed);
			
			// 첨부파일이 있는 경우 저장 로직
			if(message.getContent() instanceof Multipart) {
				Multipart multipart = (Multipart) message.getContent();
				
				for(int i = 0; i < multipart.getCount(); i++) {
					BodyPart bodyPart = multipart.getBodyPart(i);
					
					if(Part.ATTACHMENT.equalsIgnoreCase(bodyPart.getDisposition())) {
						String fileName = bodyPart.getFileName();
						InputStream is = bodyPart.getInputStream();
						
						// InputStream을 MultipartFile로 변환
						Map<String, String> map = fileUtil.fileUpload(is, fileName, "email");
						
						// 첨부 파일 정보를 AttachmentDto 객체에 설정
						AttachmentDto at = new AttachmentDto();
						at.setFilePath(map.get("filePath"));
						at.setOriginName(fileName);
						at.setSystemName(map.get("filesystemName"));
						at.setType("E");
						at.setRefNo(ed.getEmailNo());
						
						// 첨부파일 DB에 추가
						emailDao.insertAttachment(at);
					}
				}
			}
			
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	// 이메일 시스템에서는 종종 이메일 주소나 제목등을 인토딩된 형태로 전달하기 때문에 디코딩하여 사용해야할 때가 있음
	// 이메일 발신자 정보를 디코딩하는 메소드 ex) 화면에 =?utf-8?B?6rmA66+87KCV?= 이런식으로 나옴
	private String decodeText(String text) {
		try {
			return MimeUtility.decodeText(text);  // MimeUtility 는 javax.mail.internet 패키지에 포함되어 있음, decodeText()는 MIME텍스트를 디코딩하는데 사용
		} catch(Exception e) {
			e.printStackTrace();
			return text;
		}
	}
	
	
	
	
	
	
	/* MimeMultipart : Java API 에서 MIME 멀티파트 메세지를 나타내는 클래스 
	                 이메일 메세지에서 여러파트(본문, 첨부, 파일 등)를 포함할 수 있도록 도와줌
	                 
	   - 사용목적 : 이메일 메세지에서 여러 파트를 나타내기 위해 사용 
	             예를들어, 메일 본문이 HTML 형식과 텍스트 형식 모두 제공되거나, 하나 이상의 첨부파일이 있을 때 사용
	   
	   - 구성요소 : 각 BodyPart 객체는 메세지의 한 부분을 나타냄. 텍스트, HTML 본문, 이미지, 파일 등 다양한 형식             
	*/
	
	// 메세지에서 텍스트를 추출하는 메서드 (message : 메세지 객체, return 추출된 텍스트 내용)
	private String getTextFromMessage(Message message) throws Exception{
		
		String result = "";
		if(message.getContent() instanceof String) {
			result = (String) message.getContent();
		}else if (message.getContent() instanceof MimeMultipart) {
			MimeMultipart mimeMultipart = (MimeMultipart)message.getContent();
			return getTextFromMimeMultipart(mimeMultipart);
		}
		
		result = "<p>" + result + "</p>";
		
		return result;
	}
	
	
	
	// MimeMultipart에서 텍스트를 추출하는 메서드
	private String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws Exception{
		
		StringBuilder result = new StringBuilder();
		for(int i = 0; i < mimeMultipart.getCount(); i++) {
			BodyPart bodyPart = mimeMultipart.getBodyPart(i);
			
			if(bodyPart.getContent() instanceof String) {
				result.append(bodyPart.getContent());
				
				System.out.println("Email content : " + bodyPart.getContentType());
				
			}else if(bodyPart.getContent() instanceof MimeMultipart) {
				result.append(getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent()));
			}
		}
		return result.toString();
	}
	
	
}
