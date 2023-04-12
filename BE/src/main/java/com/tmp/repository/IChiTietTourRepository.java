package com.tmp.repository;

import com.tmp.entity.ChiTietTour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface IChiTietTourRepository extends JpaRepository<ChiTietTour, Integer> {

}
