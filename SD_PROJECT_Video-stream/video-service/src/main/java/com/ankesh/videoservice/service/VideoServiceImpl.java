package com.ankesh.videoservice.service;

import com.ankesh.videoservice.exception.ResourceNotFoundException;
import com.ankesh.videoservice.model.*;
import com.ankesh.videoservice.repository.CommentRepository;
import com.ankesh.videoservice.repository.VideoReactionRepository;
import com.ankesh.videoservice.repository.VideoRepository;
import jakarta.annotation.PostConstruct;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;

@Service
@RequiredArgsConstructor
public class VideoServiceImpl implements VideoService {
    private final VideoRepository videoRepository;
    private final VideoProcessingQueue queue;
    private final VideoReactionRepository videoReactionRepository;
    private final CommentRepository commentRepository;

    @Override
    public Video createVideo(Video video) {
        video.setUploadTime(LocalDateTime.now());
        return videoRepository.save(video);
    }
    @PostConstruct
    public void init() {
        CompletableFuture.runAsync(this::startQueueProcessor);
    }
    @Override
    public List<Video> getAllVideos() {
        return videoRepository.findAll();
    }
    @Override
    public Video uploadVideo(MultipartFile file, String title, String description, Long userId) {
        try {
            if (file.isEmpty()) {
                throw new RuntimeException("File is empty");
            }
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

            // create folder if not exists
            String uploadPath = System.getProperty("user.dir") + File.separator + "uploads";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = uploadPath + File.separator + fileName;
            File dest = new File(filePath);
            file.transferTo(dest);

            // save metadata
            Video video = Video.builder()
                    .title(title)
                    .description(description)
                    .thumbnailUrl("default.jpg")
                    .duration(0L)
                    .userId(userId)
                    .views(0L)
                    .likes(0L)
                    .dislikes(0L)
                    .uploadTime(LocalDateTime.now())
                    .videoUrl("/videos/stream/" + fileName)
                    .status(VideoStatus.UPLOADED)
                    .build();

            Video savedVideo = videoRepository.save(video);

            queue.addToQueue(savedVideo.getId());

            return savedVideo;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Upload failed", e);
        }
    }

    public void startQueueProcessor() {
        while (true) {
            try {
                Long videoId = queue.takeFromQueue();

                System.out.println("Processing video: " + videoId);

                Video video = videoRepository.findById(videoId).orElseThrow();

                video.setStatus(VideoStatus.PROCESSING);
                videoRepository.save(video);

                Thread.sleep(5000);

                video.setStatus(VideoStatus.READY);
                videoRepository.save(video);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    @Override
    public Video getVideoById(Long id) {
        return videoRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Video not found"));
    }
    @Override
    public Page<Video> getVideos(int page, int size) {
        return videoRepository.findAll(PageRequest.of(page, size));
    }
    @Override
    @Transactional
    public void incrementViews(Long videoId) {
        videoRepository.incrementViewsFast(videoId);
    }
    @Override
    public Optional<Video> findByFileName(String fileName) {
        return videoRepository.findByVideoUrlContaining(fileName);
    }

    public void reactToVideo(Long videoId, Long userId, ReactionType type) {

        Video video = videoRepository.findById(videoId)
                .orElseThrow(() -> new RuntimeException("Video not found"));

        if (video.getLikes() == null) video.setLikes(0L);
        if (video.getDislikes() == null) video.setDislikes(0L);

        Optional<VideoReaction> existing =
                videoReactionRepository.findByUserIdAndVideoId(userId, videoId);

        if (existing.isPresent()) {

            VideoReaction reaction = existing.get();

            if (reaction.getType() == type) return;

            if (reaction.getType() == ReactionType.LIKE) {
                video.setLikes(video.getLikes() - 1);
            } else {
                video.setDislikes(video.getDislikes() - 1);
            }

            reaction.setType(type);
            videoReactionRepository.save(reaction);

        } else {
            VideoReaction reaction = new VideoReaction(null, userId, videoId, type);
            videoReactionRepository.save(reaction);
        }

        // add new reaction
        if (type == ReactionType.LIKE) {
            video.setLikes(video.getLikes() + 1);
        } else {
            video.setDislikes(video.getDislikes() + 1);
        }

        videoRepository.save(video);
    }

    @Override
    public Comment addComment(Long videoId, Long userId, String content, Long parentId) {

        Comment comment = Comment.builder()
                .videoId(videoId)
                .userId(userId)
                .content(content)
                .parentId(parentId)
                .createdAt(LocalDateTime.now())
                .build();

        return commentRepository.save(comment);
    }
    @Override
    public Page<Comment> getComments(Long videoId, int page, int size) {
        return commentRepository.findByVideoIdAndParentIdIsNull(
                videoId,
                PageRequest.of(page, size)
        );
    }
    @Override
    public List<Comment> getReplies(Long parentId) {
        return commentRepository.findByParentId(parentId);
    }

    @Override
    public Page<Video> getTrendingVideos(int page, int size) {
        return videoRepository.findTrendingVideos(PageRequest.of(page, size));
    }

    @Override
    public Page<Video> getLatestVideos(int page, int size) {
        return videoRepository.findAllByOrderByUploadTimeDesc(PageRequest.of(page, size));
    }

    @Override
    public Page<Video> getPopularVideos(int page, int size) {
        return videoRepository.findAllByOrderByLikesDesc(PageRequest.of(page, size));
    }

    @Override
    public Page<Video> searchVideos(String keyword, int page, int size) {
        return videoRepository.searchVideosAdvanced(keyword, PageRequest.of(page, size));
    }
}
