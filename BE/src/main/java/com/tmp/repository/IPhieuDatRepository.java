package com.tmp.repository;

import com.tmp.entity.PhieuDat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPhieuDatRepository extends JpaRepository<PhieuDat, Integer> {
    @Query("SELECT pd.id, (pd.treEm * tr.giaTreEm + pd.nguoiLon*tr.giaNguoiLon + pd.treNho*tr.giaTreNho) as gia "
            + "FROM PhieuDat pd, ChiTietTour ct, Tour tr "
            + "WHERE pd.chiTietTour.idChiTiet = ct.idChiTiet AND ct.tour_chitiet.id = tr.id")
    List<Object[]> getPhieuDatWithGia();
}
