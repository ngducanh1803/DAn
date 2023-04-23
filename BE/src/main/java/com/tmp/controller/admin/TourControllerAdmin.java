package com.tmp.controller.admin;

import com.tmp.dto.TourDto;
import com.tmp.entity.Tour;
import com.tmp.service.ITourService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "api/v1/toursAdmin")
@CrossOrigin("*")
public class TourControllerAdmin {
    @Autowired
    private ITourService service;

    @Autowired
    private ModelMapper modelMapper;

    @GetMapping("Getall")
    public ResponseEntity<?> getAllTours(Pageable pageable) {
        Page<Tour> entities = service.getTourPaging(pageable);
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity<?> getAllTours() {
        List<Tour> entities = service.getAllTour();
        return new ResponseEntity<>(entities, HttpStatus.OK);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<?> getTourById(@PathVariable(name = "id") int id) {
        Tour tour = service.getTourById(id);
        TourDto tourDto = modelMapper.map(tour , TourDto.class);
//        tourDto.setIdTinh(tour.getTinh().getId());
//        tourDto.setDiaDiem(tour.getDiaDiem().getDiemDen());
        return new ResponseEntity<>(tourDto, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<?> addTour(@RequestBody TourDto dto){
        TourDto tourDto = service.addTour(dto);
        return new ResponseEntity<>(tourDto,HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateTour(@PathVariable int id,@RequestBody TourDto tourDto){
        TourDto dto = service.updateTour(id,tourDto);
        return new ResponseEntity<>(dto,HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deteleById(@PathVariable int id){
        service.deleteById(id);
        return ResponseEntity.ok("Detele Success");
    }



}