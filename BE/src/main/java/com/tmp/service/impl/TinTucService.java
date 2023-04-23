package com.tmp.service.impl;

import com.tmp.entity.TinTuc;
import com.tmp.repository.ITinTucRepository;
import com.tmp.service.ITinTucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TinTucService implements ITinTucService {

    @Autowired
    private ITinTucRepository repository;

    @Override
    public Page<TinTuc> getAllTin(Pageable pageable) {
        Page<TinTuc> getAll = repository.findAll(pageable);
        return getAll;
    }

    @Override
    public TinTuc getById(int id) {
        TinTuc tinTuc = repository.getById(id);
        return tinTuc;
    }
}
