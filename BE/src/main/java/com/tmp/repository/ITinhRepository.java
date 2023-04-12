package com.tmp.repository;

import com.tmp.entity.Tinh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITinhRepository extends JpaRepository<Tinh, Integer> {
}
