package com.tmp.controller.admin;

import com.tmp.entity.Tintuc;
import com.tmp.service.TintucServiceIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/tintucAdmin")
public class TinTucControllerAdmin {
    @Autowired
    private TintucServiceIn service;

    @GetMapping("")
    public ResponseEntity<?> getAll(Pageable pageable) {
        Page<Tintuc> tinTucs = service.getAllTin(pageable);
        return new ResponseEntity<>(tinTucs, HttpStatus.OK);
    }

    @GetMapping("all")
    public ResponseEntity<?> getAllTin() {
        List<Tintuc> tinTucs = service.getAll();
        return new ResponseEntity<>(tinTucs, HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity<?> postTintuc(@RequestBody Tintuc tintuc){
        Tintuc tt = service.createTin(tintuc);
        return new ResponseEntity<>(tt,HttpStatus.OK);
    }

    @PutMapping ("/{id}")
    public ResponseEntity<?> updateTintuc(@PathVariable int id,@RequestBody Tintuc tintuc){
        Tintuc tt = service.UpdateTin(id,tintuc);
        return new ResponseEntity<>(tt,HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTin(@PathVariable int id){
        service.deleteTin(id);
        return ResponseEntity.ok("Success");
    }


}