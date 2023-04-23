package com.tmp.repository;

import com.tmp.entity.TinTuc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ITinTucRepository extends JpaRepository<TinTuc,Integer> {
}
