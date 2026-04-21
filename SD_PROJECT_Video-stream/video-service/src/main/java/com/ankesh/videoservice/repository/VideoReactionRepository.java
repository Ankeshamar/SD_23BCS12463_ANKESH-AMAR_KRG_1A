package com.ankesh.videoservice.repository;

import com.ankesh.videoservice.model.VideoReaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VideoReactionRepository extends JpaRepository<VideoReaction, Long> {
    Optional<VideoReaction> findByUserIdAndVideoId(Long userId, Long videoId);
}
