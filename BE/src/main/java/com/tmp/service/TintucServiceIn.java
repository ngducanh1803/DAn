package com.tmp.service;

import com.tmp.entity.Tintuc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import java.util.List;


public interface TintucServiceIn {
    Page<Tintuc> getAllTin(Pageable pageable);

    Tintuc getById(int id);

    List<Tintuc> getAll();

    Tintuc createTin(Tintuc tintuc);

    Tintuc UpdateTin(int id,Tintuc tintuc);

    void deleteTin(int id);
}
