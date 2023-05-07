package com.tmp.service.impl;

import com.tmp.entity.KhachSan;
import com.tmp.repository.IKhachSanRepository;
import com.tmp.service.IKhachSanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachSanService implements IKhachSanService {

    @Autowired
    private IKhachSanRepository repository;

    @Override
    public List<KhachSan> getAll() {
        List<KhachSan> list = repository.findAll();
        return list;
    }

    @Override
    public Page<KhachSan> getAllKS(Pageable pageable) {
        Page<KhachSan> page = repository.findAll(pageable);
        return page;
    }

    @Override
    public KhachSan getByIdKS(int id) {
        KhachSan ks = repository.findById(id).get();
        return ks;
    }

    @Override
    public KhachSan createKs(KhachSan ks) {
        KhachSan khachSan = new KhachSan();
        khachSan.setTenKS(ks.getTenKS());
        khachSan.setDiaChi(ks.getDiaChi());
        khachSan.setEmail(ks.getEmail());
        khachSan.setSdt1(ks.getSdt1());
        khachSan.setSdt2(ks.getSdt2());
        khachSan.setGia(ks.getGia());
        khachSan.setHinhAnh(ks.getHinhAnh());
        khachSan.setNoiDung(ks.getNoiDung());
        repository.save(khachSan);

        return khachSan;
    }

    @Override
    public KhachSan updateKS(int id, KhachSan ks) {
        KhachSan khachSan = repository.findById(id).get();
        khachSan.setTenKS(ks.getTenKS());
        khachSan.setDiaChi(ks.getDiaChi());
        khachSan.setEmail(ks.getEmail());
        khachSan.setSdt1(ks.getSdt1());
        khachSan.setSdt2(ks.getSdt2());
        khachSan.setGia(ks.getGia());
        khachSan.setHinhAnh(ks.getHinhAnh());
        khachSan.setNoiDung(ks.getNoiDung());
        repository.save(khachSan);
        return khachSan;
    }

    @Override
    public void deteleKS(int id) {
        repository.deleteById(id);
    }
}
