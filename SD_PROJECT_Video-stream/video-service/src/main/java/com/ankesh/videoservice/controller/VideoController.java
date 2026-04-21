package com.ankesh.videoservice.controller;

import com.ankesh.videoservice.dto.ApiResponse;
import com.ankesh.videoservice.model.Comment;
import com.ankesh.videoservice.model.ReactionType;
import com.ankesh.videoservice.model.Video;
import com.ankesh.videoservice.service.VideoService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping("/videos")
@RequiredArgsConstructor
public class VideoController {
    private final VideoService videoService;
    @PostMapping
    public ApiResponse<Video> createVideo(@RequestBody Video video) {
        Video saved = videoService.createVideo(video);
        return new ApiResponse<>("Video created", saved);
    }
    @PostMapping("/upload")
    public ApiResponse<Video> uploadVideo(
            @RequestParam("file") MultipartFile file,
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("userId") Long userId
    ) {
        Video video = videoService.uploadVideo(file, title, description, userId);
        return new ApiResponse<>("Video uploaded", video);
    }
    @GetMapping("/stream/{fileName}")
    public ResponseEntity<InputStreamResource> streamVideo(
            @PathVariable String fileName,
            @RequestHeader(value = "Range", required = false) String rangeHeader
    ) throws IOException {

        String path = System.getProperty("user.dir") + File.separator + "uploads" + File.separator + fileName;
        File file = new File(path);

        if (!file.exists()) {
            throw new RuntimeException("File not found");
        }

        Video video = videoService.findByFileName(fileName)
                .orElse(null);

        if (video != null && rangeHeader == null) {
            videoService.incrementViews(video.getId());
        }

        long fileLength = file.length();
        long start = 0;
        long end = fileLength - 1;

        if (rangeHeader != null && rangeHeader.startsWith("bytes=")) {
            String[] ranges = rangeHeader.substring(6).split("-");
            start = Long.parseLong(ranges[0]);
            if (ranges.length > 1) {
                end = Long.parseLong(ranges[1]);
            }
        }

        long contentLength = end - start + 1;

        InputStream inputStream = new FileInputStream(file);
        inputStream.skip(start);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "video/mp4");
        headers.add("Accept-Ranges", "bytes");
        headers.add("Content-Length", String.valueOf(contentLength));
        headers.add("Content-Range", "bytes " + start + "-" + end + "/" + fileLength);

        return ResponseEntity.status(HttpStatus.PARTIAL_CONTENT)
                .headers(headers)
                .body(new InputStreamResource(inputStream));
    }
    @GetMapping("/{id}")
    public ApiResponse<Video> getVideo(@PathVariable Long id) {
        Video video = videoService.getVideoById(id);
        return new ApiResponse<>("Video fetched successfully", video);
    }
    @GetMapping
    public ApiResponse<Page<Video>> getAllVideos(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        Page<Video> videos = videoService.getVideos(page, size);
        return new ApiResponse<>("Videos fetched", videos);
    }
    @PostMapping("/{id}/react")
    public ResponseEntity<String> react(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestParam ReactionType type
    ) {
        videoService.reactToVideo(id, userId, type);
        return ResponseEntity.ok("Reaction updated");
    }
    @PostMapping("/{id}/comment")
    public ResponseEntity<Comment> addComment(
            @PathVariable Long id,
            @RequestParam Long userId,
            @RequestParam String content,
            @RequestParam(required = false) Long parentId
    ) {
        return ResponseEntity.ok(
                videoService.addComment(id, userId, content, parentId)
        );
    }
    @GetMapping("/{id}/comments")
    public ApiResponse<Page<Comment>> getComments(
            @PathVariable Long id,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        return new ApiResponse<>("Comments fetched",
                videoService.getComments(id, page, size));
    }
    @GetMapping("/comments/{commentId}/replies")
    public List<Comment> getReplies(@PathVariable Long commentId) {
        return videoService.getReplies(commentId);
    }

    @GetMapping("/trending")
    public ApiResponse<Page<Video>> trending(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        return new ApiResponse<>("Trending videos",
                videoService.getTrendingVideos(page, size));
    }

    @GetMapping("/latest")
    public ApiResponse<Page<Video>> latest(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        return new ApiResponse<>("Latest videos",
                videoService.getLatestVideos(page, size));
    }

    @GetMapping("/popular")
    public ApiResponse<Page<Video>> popular(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        return new ApiResponse<>("Popular videos",
                videoService.getPopularVideos(page, size));
    }

    @GetMapping("/search")
    public ApiResponse<Page<Video>> searchVideos(
            @RequestParam String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size
    ) {
        Page<Video> result = videoService.searchVideos(keyword, page, size);
        return new ApiResponse<>("Search results", result);
    }
}
