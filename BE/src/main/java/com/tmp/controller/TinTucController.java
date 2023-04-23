package com.tmp.controller;

import com.tmp.entity.TinTuc;
import com.tmp.service.ITinTucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.PublicKey;

@RestController
@RequestMapping("api/v1/tintuc")
public class TinTucController {
    @Autowired
    private ITinTucService service;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(Pageable pageable){
        Page<TinTuc> tinTucs = service.getAllTin(pageable);
        return new ResponseEntity<>(tinTucs, HttpStatus.OK);
    }



}
