package com.tmp.repository;

import com.tmp.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IHoaDonRepository extends JpaRepository<HoaDon, Integer> {
}
