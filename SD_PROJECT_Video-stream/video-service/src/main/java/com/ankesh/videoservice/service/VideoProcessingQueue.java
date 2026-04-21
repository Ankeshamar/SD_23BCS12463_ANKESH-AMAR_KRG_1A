package com.ankesh.videoservice.service;

import org.springframework.stereotype.Component;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

@Component
public class VideoProcessingQueue {
    private final BlockingQueue<Long> queue=new LinkedBlockingQueue<>();
    public void addToQueue(Long videoId){
        queue.add(videoId);
    }
    public Long takeFromQueue() throws InterruptedException{
        return queue.take();
    }
}
