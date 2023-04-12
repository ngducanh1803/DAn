package com.tmp.controller.admin;

import com.tmp.entity.HoaDon;
import com.tmp.service.IHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/hoaDons")
public class HoaDonControllerAdmin {
    @Autowired
    private IHoaDonService service;

    @GetMapping("/all")
    public ResponseEntity<?> getAllHoaDon(){
        List<HoaDon> hoaDons = service.getAllHoaDon();
        return new ResponseEntity<>(hoaDons, HttpStatus.OK);
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable int id){
        HoaDon hoaDon = service.getById(id);
        return new ResponseEntity<>(hoaDon,HttpStatus.OK);
    }


}
