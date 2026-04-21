package com.ankesh.videoservice.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Video {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    @Column(length = 1000)
    private String description;
    private String videoUrl;
    private String thumbnailUrl;
    private Long duration;
    private Long views = 0L;
    private Long likes = 0L;
    private Long dislikes = 0L;
    private Long userId;
    private LocalDateTime uploadTime;
    @Enumerated(EnumType.STRING)
    private VideoStatus status;
}
