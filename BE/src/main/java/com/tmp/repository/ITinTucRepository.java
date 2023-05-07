package com.tmp.repository;

import com.tmp.entity.Tintuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITinTucRepository extends JpaRepository<Tintuc,Integer> {
}
