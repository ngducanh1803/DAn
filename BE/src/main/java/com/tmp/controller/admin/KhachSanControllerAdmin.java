package com.tmp.controller.admin;

import com.tmp.entity.KhachSan;
import com.tmp.service.IKhachSanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("api/v1/khachsanAdmin")
public class KhachSanControllerAdmin {
    @Autowired
    private IKhachSanService service;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(){
        List<KhachSan> list = service.getAll();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getByIdKs(@PathVariable int id){
        KhachSan ks = service.getByIdKS(id);
        return new ResponseEntity<>(ks,HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> createKS(@RequestBody KhachSan khachSan){
        KhachSan ks = service.createKs(khachSan);
        return new ResponseEntity<>(ks,HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateKS(@PathVariable int id,@RequestBody KhachSan khachSan){
        KhachSan ks = service.updateKS(id,khachSan);
        return new ResponseEntity<>(ks,HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteId(@PathVariable int id){
        service.deteleKS(id);
        return ResponseEntity.ok("Success");
    }
}
