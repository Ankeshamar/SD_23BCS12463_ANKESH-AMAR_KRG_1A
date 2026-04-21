package com.ankesh.videoservice.repository;

import com.ankesh.videoservice.model.Video;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface VideoRepository extends JpaRepository<Video, Long> {

    Optional<Video> findByVideoUrlContaining(String fileName);

    @Query("""
        SELECT v FROM Video v
        ORDER BY (v.views * 0.7 + v.likes * 1.5) DESC
    """)
    Page<Video> findTrendingVideos(Pageable pageable);

    Page<Video> findAllByOrderByUploadTimeDesc(Pageable pageable);

    Page<Video> findAllByOrderByLikesDesc(Pageable pageable);

    @Query("""
    SELECT v FROM Video v
    WHERE LOWER(v.title) LIKE LOWER(CONCAT('%', :keyword, '%'))
       OR LOWER(v.description) LIKE LOWER(CONCAT('%', :keyword, '%'))
    ORDER BY 
        (COALESCE(v.views,0) * 0.6 + COALESCE(v.likes,0) * 0.4) DESC
""")
    Page<Video> searchVideos(@Param("keyword") String keyword, Pageable pageable);

    @Query("""
    SELECT v FROM Video v
    WHERE LOWER(v.title) LIKE LOWER(CONCAT('%', :keyword, '%'))
       OR LOWER(v.description) LIKE LOWER(CONCAT('%', :keyword, '%'))
    ORDER BY 
        CASE 
            WHEN LOWER(v.title) LIKE LOWER(CONCAT(:keyword, '%')) THEN 1
            ELSE 2
        END,
        v.views DESC
""")
    Page<Video> searchVideosAdvanced(@Param("keyword") String keyword, Pageable pageable);

    @Modifying
    @Transactional
    @Query("""
    UPDATE Video v 
    SET v.views = COALESCE(v.views,0) + 1 
    WHERE v.id = :videoId
""")
    void incrementViewsFast(@Param("videoId") Long videoId);
}
