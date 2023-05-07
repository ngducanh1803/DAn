package com.tmp.service;

import com.tmp.entity.KhachDat;
import com.tmp.entity.KhachSan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IKhachSanService {

    List<KhachSan> getAll();

    Page<KhachSan> getAllKS(Pageable pageable);

    KhachSan getByIdKS(int id);

    KhachSan createKs(KhachSan ks);

    KhachSan updateKS(int id,KhachSan ks);

    void deteleKS(int id);
}
