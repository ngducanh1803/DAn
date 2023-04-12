package com.tmp.controller;

import com.tmp.dto.PhieuDatDto;
import com.tmp.service.IPhieuDatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/hangs")
public class PhieuDatController {
    @Autowired
    private IPhieuDatService service;


    @PostMapping("")
    public ResponseEntity<?> addUser(@RequestBody PhieuDatDto phieuDatDto){
        PhieuDatDto user = service.addKhach(phieuDatDto);
        System.out.println(phieuDatDto);
//        return new ResponseEntity<>(user, HttpStatus.OK);
        return ResponseEntity.ok("Success");
    }



}
