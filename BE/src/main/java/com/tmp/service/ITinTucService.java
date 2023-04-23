package com.tmp.service;

import com.tmp.entity.TinTuc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ITinTucService {
    Page<TinTuc> getAllTin(Pageable pageable);

    TinTuc getById(int id);
}
