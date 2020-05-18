package com.jonjazzy.jenkinsdocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@SpringBootApplication
public class JenkinsdockerApplication {

    public static void main(String[] args) throws InterruptedException {
        SpringApplication.run(JenkinsdockerApplication.class, args);

        while(true)
        {
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss SSS");
            dateFormat.setTimeZone(TimeZone.getTimeZone("Europe/London"));
            System.out.println(dateFormat.format(date));
            Thread.sleep(500);
        }
    }

}
