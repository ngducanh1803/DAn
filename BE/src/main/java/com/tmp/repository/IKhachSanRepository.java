package com.tmp.repository;

import com.tmp.entity.KhachSan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IKhachSanRepository extends JpaRepository<KhachSan,Integer> {
}
