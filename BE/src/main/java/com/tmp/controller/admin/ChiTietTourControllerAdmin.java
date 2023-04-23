package com.tmp.controller.admin;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.service.IChiTietTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/chiTietToursAdmin")
public class ChiTietTourControllerAdmin {

    @Autowired
    private IChiTietTourService service;

    @GetMapping("/all")
    public ResponseEntity<?> getAll(Pageable pageable){
        Page<ChiTietTour> page = service.getAllChiTiet(pageable);
        return new ResponseEntity<>(page,HttpStatus.OK);
    }

    @GetMapping("/getAll")
    public ResponseEntity<?> getAll(){
        List<ChiTietTour> lists = service.getAll();
        return new ResponseEntity<>(lists,HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<?> addChiTietTour(@RequestBody ChiTietTourDto dto){
        ChiTietTourDto chiTietTourDto = service.addChiTietTour(dto);
        return new ResponseEntity<>(chiTietTourDto, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable int id){
        ChiTietTourDto chiTietTourDto = service.getById(id);
        return new ResponseEntity<>(chiTietTourDto,HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateById(@PathVariable int id, @RequestBody ChiTietTourDto dto){
        ChiTietTourDto chiTietTourDto = service.updateChiTietTour(id,dto);
        return new ResponseEntity<>(chiTietTourDto,HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public void deleteByid(@PathVariable int id){
        service.deleteById(id);
    }


}
