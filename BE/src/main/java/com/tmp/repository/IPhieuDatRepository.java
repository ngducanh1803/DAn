package com.tmp.repository;

import com.tmp.entity.PhieuDat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPhieuDatRepository extends JpaRepository<PhieuDat, Integer> {
}
