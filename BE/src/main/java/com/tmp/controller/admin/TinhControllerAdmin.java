package com.tmp.controller.admin;

import com.tmp.entity.Tinh;
import com.tmp.service.ITinhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/tinhs")
public class TinhControllerAdmin {
    @Autowired
    private ITinhService service;

    @GetMapping("/all")
    public ResponseEntity<?> getPageTinh(Pageable pageable){
        Page<Tinh> tinhs = service.getPageTinh(pageable);
        return new ResponseEntity<>(tinhs, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<?> addTinh(@RequestBody Tinh tinh){
        Tinh tinh1 = service.addTinh(tinh);
        return new ResponseEntity<>(tinh1,HttpStatus.OK);
    }

    // fix xong
    @PutMapping("/{id}")
    public ResponseEntity<?> updateTinh(@PathVariable int id,@RequestBody Tinh tinh){
        Tinh tinh1 = service.updateTinh(id,tinh);
        return ResponseEntity.ok("update success");
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable int id){
        service.deleteTinhById(id);
    }

}
