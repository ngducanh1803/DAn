package com.tmp.controller;

import com.tmp.entity.Tintuc;
import com.tmp.service.TintucServiceIn;
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
@RequestMapping("api/v1/tintuc")
public class TinTucController {
    @Autowired
    private TintucServiceIn service;

    @GetMapping("")
    public ResponseEntity<?> getAll(Pageable pageable){
        Page<Tintuc> tinTucs = service.getAllTin(pageable);
        return new ResponseEntity<>(tinTucs, HttpStatus.OK);
    }

    @GetMapping("all")
    public ResponseEntity<?> getAllTin(){
        List<Tintuc> tinTucs = service.getAll();
        return new ResponseEntity<>(tinTucs,HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getByIdTin(@PathVariable int id){
        Tintuc tinTuc = service.getById(id);
        return new ResponseEntity<>(tinTuc,HttpStatus.OK);
    }



}
