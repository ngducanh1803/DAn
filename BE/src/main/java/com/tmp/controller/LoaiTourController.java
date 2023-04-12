package com.tmp.controller;

import com.tmp.entity.LoaiTour;
import com.tmp.service.ILoaiTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "api/v1/loaitours")
@CrossOrigin("*")
public class LoaiTourController {

    @Autowired
    private ILoaiTourService loaiTourService;

//    @GetMapping()
//    public ResponseEntity<?> getAllLoaiTourPaging(Pageable pageable) {
//        Page<LoaiTour> entities = loaiTourService.getLoaiTourPaging(pageable);
//        return new ResponseEntity<>(entities, HttpStatus.OK);
//    }
}
