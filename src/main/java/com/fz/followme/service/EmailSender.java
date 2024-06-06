package com.fz.followme.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.fz.followme.dto.EmailDto;

@Service
public class EmailSender {
	
	@Autowired
    private JavaMailSender mailSender;
    //can not autowired라고 뜬다면 root-context.xml에 등록을 안 한 것

    public String sendMail(EmailDto email) {
        System.out.println("email = " + email);
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setTo(email.getToEmail());
            messageHelper.setText(email.getText());
            messageHelper.setFrom(email.getFromEmail());
            messageHelper.setSubject(email.getSubject());	// 메일제목은 생략 가능

            mailSender.send(message);

        } catch(Exception e){
            System.out.println(e);
            return "Error";
        }
        return "Success";
    }

}
