package com.fz.followme.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.fz.followme.handler.AlarmEchoHandler;

@RestController
public class NotificationService {

	@Autowired
    private AlarmEchoHandler alarmEchoHandler;

    public void sendAlarmMessage(String message) throws IOException {
        alarmEchoHandler.send(message);
    }
	
}
