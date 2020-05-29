package com.example.demo;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.google.gson.JsonObject;
 

@Component
public class SnapShotScheduler {
 
    //@Scheduled(cron = "*/30 * * * * *")
	@Scheduled(cron = "0 0 2 * * *")
    public void run() {
    	Client client = new Client("2","", "", "", "");
		JsonObject result = client.getResult();
		String recom = result.get("list").toString();
		System.out.println(recom);
    }
 
}