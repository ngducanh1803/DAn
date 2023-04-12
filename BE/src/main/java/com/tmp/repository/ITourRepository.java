package com.tmp.repository;

import com.tmp.entity.Tour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITourRepository extends JpaRepository<Tour, Integer> {
}
