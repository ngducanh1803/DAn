package com.tmp.service.impl;

import com.tmp.entity.Tintuc;
import com.tmp.repository.ITinTucRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TinTucService implements com.tmp.service.TintucServiceIn {

    @Autowired
    private ITinTucRepository repository;

    @Override
    public Page<Tintuc> getAllTin(Pageable pageable) {
        Page<Tintuc> getAll = repository.findAll(pageable);
        return getAll;
    }

    @Override
    public Tintuc getById(int id) {
        Tintuc tinTuc = repository.findById(id).get();
        return tinTuc;
    }

    @Override
    public List<Tintuc> getAll() {
        List<Tintuc> tinTucs = repository.findAll();
        return tinTucs;

    }

    @Override
    public Tintuc createTin(Tintuc tintuc) {
        Tintuc tintuc1 = new Tintuc();
        tintuc1.setTieuDe(tintuc.getTieuDe());
        tintuc1.setNoiDung(tintuc.getNoiDung());
        tintuc1.setAnhMot(tintuc.getAnhMot());
        tintuc1.setAnhHai(tintuc.getAnhHai());
        repository.save(tintuc1);
        return tintuc1;
    }

    @Override
    public Tintuc UpdateTin(int id, Tintuc tintuc) {
        Tintuc tt = repository.findById(id).get();
        tt.setTieuDe(tintuc.getTieuDe());
        tt.setNoiDung(tintuc.getNoiDung());
        tt.setAnhMot(tintuc.getAnhMot());
        tt.setAnhHai(tintuc.getAnhHai());
        repository.save(tt);
        return tt;
    }

    @Override
    public void deleteTin(int id) {
        repository.deleteById(id);
    }
}
