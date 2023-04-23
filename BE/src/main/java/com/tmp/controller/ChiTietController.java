package com.tmp.controller;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.service.IChiTietTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/chitiet")
public class ChiTietController {

    @Autowired
    private IChiTietTourService service;


    @GetMapping("/{id}")
    public ResponseEntity<?> getChiTietById(@PathVariable int id){
        ChiTietTourDto dto = service.getById(id);
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }


}
