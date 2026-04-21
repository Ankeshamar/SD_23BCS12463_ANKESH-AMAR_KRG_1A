package com.ankesh.videoservice.service;

import com.ankesh.videoservice.model.Comment;
import com.ankesh.videoservice.model.ReactionType;
import com.ankesh.videoservice.model.Video;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface VideoService {
    Page<Video> getVideos(int page, int size);
    Video createVideo(Video video);
    void incrementViews(Long videoId);
    Video getVideoById(Long id);
    List<Video> getAllVideos();
    Video uploadVideo(MultipartFile file, String title, String description, Long userId);
    Optional<Video> findByFileName(String fileName);
    void reactToVideo(Long videoId, Long userId, ReactionType type);
    Comment addComment(Long videoId, Long userId, String content, Long parentId);
    Page<Comment> getComments(Long videoId, int page, int size);
    List<Comment> getReplies(Long parentId);
    Page<Video> getTrendingVideos(int page, int size);
    Page<Video> getLatestVideos(int page, int size);
    Page<Video> getPopularVideos(int page, int size);
    Page<Video> searchVideos(String keyword, int page, int size);
}