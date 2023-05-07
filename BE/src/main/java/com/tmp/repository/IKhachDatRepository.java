package com.tmp.repository;

import com.tmp.entity.KhachDat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IKhachDatRepository extends JpaRepository<KhachDat,Integer> {
}
