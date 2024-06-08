package com.fz.followme.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.fz.followme.dao.EmailDao;
import com.fz.followme.dto.AttachmentDto;
import com.fz.followme.dto.EmailDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender2;
	private final EmailDao emailDao;
	
	
	
	public List<EmailDto> selectMemberList(){
		return emailDao.selectMemberList();
	}
	
	
	// 메일보내기
	public void sendEmail(EmailDto ed, List<AttachmentDto> atList) {
		
		try {
			MimeMessage message = mailSender2.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom(ed.getEmailFrom());
			helper.setTo(ed.getEmailTo().split(",")); // ,로 메일주소 구분
			helper.setSubject(ed.getSubject());
			helper.setText(ed.getText(), true); // HTML 내용을 지정하려면 isHtml 파라미터를 true로 설정

			for(AttachmentDto at : atList) {
				File file = new File(at.getFilePath(), at.getSystemName());
				helper.addAttachment(at.getOriginName(), file);
			}
			
			mailSender2.send(message);
			
			
			// 이메일 정보 저장
			EmailDto email = new EmailDto();
			email.setEmailFrom(ed.getEmailFrom());
			email.setEmailTo(ed.getEmailTo());
			email.setSubject(ed.getSubject());
			email.setText(ed.getText());
			email.setRegistDate(ed.getRegistDate());
			email.setEmailStatus("ACTIVE");
			email.setForder("SENT");
			email.setIsImportant(0);
			email.setIsRead(0);
			
			emailDao.insertEmail(ed); // 이메일 전송 후 DB에 저장
			
			// 첨부파일 다중 or 하나
			if(atList != null && !atList.isEmpty()) {
				for(AttachmentDto at : atList) {
					at.setRefNo(ed.getEmailNo());
					emailDao.insertAttachment(at);
				}
			}
			
		} catch (MailException | MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	// 보낸메일함 페이징
	public int selectOutBoxListCount() {
		return emailDao.selectOutBoxListCount();
	}
	
	// 보낸메일함 조회
	public List<EmailDto> selectOutBoxList(PageInfoDto pi){
		return emailDao.selectOutBoxList(pi);
	}
	
	
}
