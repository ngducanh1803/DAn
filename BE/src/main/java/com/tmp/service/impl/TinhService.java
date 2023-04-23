package com.tmp.service.impl;

import com.tmp.entity.Tinh;
import com.tmp.repository.ITinhRepository;
import com.tmp.service.ITinhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TinhService implements ITinhService {
    @Autowired
    private ITinhRepository tinhRepository;



    @Override
    public Tinh updateTinh(int id, Tinh newTinh) {
        Tinh  tinh = tinhRepository.getById(id);
        tinh.setTenTinh(newTinh.getTenTinh());
        tinhRepository.save(tinh);
        return tinh;
    }



    @Override
    public void deleteTinhById(int id) {
        tinhRepository.deleteById(id);

    }

    @Override
    public Tinh addTinh(Tinh tinh) {
        Tinh tinh1 = new Tinh();
        tinh1.setTenTinh(tinh.getTenTinh());
        tinhRepository.save(tinh1);
        return tinh1;
    }

    @Override
    public Page<Tinh> getPageTinh(Pageable pageable) {
        Page<Tinh> tinhs = tinhRepository.findAll(pageable);
        return tinhs;
    }
}
