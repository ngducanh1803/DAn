package com.tmp.controller;

import com.tmp.dto.KhachDatDto;
import com.tmp.service.IKhachDatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/khachdat")
public class KhachDatController {

    @Autowired
    private IKhachDatService service;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(){
        List<KhachDatDto> list = service.getKDAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable int id){
        KhachDatDto dto = service.getByIdKD(id);
        return new ResponseEntity<>(dto,HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> createKD(@RequestBody KhachDatDto dto){
        KhachDatDto khachDatDto = service.createKD(dto);
        return new ResponseEntity<>(khachDatDto,HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> createKD(@PathVariable int id,@RequestBody KhachDatDto dto){
        KhachDatDto khachDatDto = service.updateKD(id,dto);
        return new ResponseEntity<>(khachDatDto,HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> xoaKD(@PathVariable int id){
        service.deteleKD(id);
        return ResponseEntity.ok("xoa thanh cong");
    }
}
