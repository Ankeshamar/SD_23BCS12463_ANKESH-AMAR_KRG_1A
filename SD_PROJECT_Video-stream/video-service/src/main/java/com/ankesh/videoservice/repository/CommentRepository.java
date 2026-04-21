package com.ankesh.videoservice.repository;

import com.ankesh.videoservice.model.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    Page<Comment> findByVideoIdAndParentIdIsNull(Long videoId, Pageable pageable);

    List<Comment> findByParentId(Long parentId);
}