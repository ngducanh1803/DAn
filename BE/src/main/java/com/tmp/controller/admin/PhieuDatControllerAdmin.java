package com.tmp.controller.admin;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.PhieuDat;
import com.tmp.service.IPhieuDatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/phieuAdmins")
public class PhieuDatControllerAdmin {
    @Autowired
    private IPhieuDatService phieuDatService;

// fix xong
    @GetMapping("/all")
    public ResponseEntity<?> getAllPhieuDat(Pageable pageable){
        Page<PhieuDat> phieuDatPage = phieuDatService.getPagePhieudat(pageable);
        return new ResponseEntity<>(phieuDatPage, HttpStatus.OK);
    }

    @GetMapping("/getAll")
    public ResponseEntity<?> getAllPhieu(){
        List<PhieuDatDto> phieuDats = phieuDatService.getAllPhieu();
        return new ResponseEntity<>(phieuDats, HttpStatus.OK);
    }


    @PostMapping("/add")
    public ResponseEntity<?> addUserAdmin(@RequestBody PhieuDatDto phieuDatDto){
        PhieuDatDto user = phieuDatService.addKhach(phieuDatDto);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updatePdat(@PathVariable int id,@RequestBody PhieuDatDto phieuDatDto){
        PhieuDatDto update = phieuDatService.Update(id,phieuDatDto);
        return new ResponseEntity<>(update, HttpStatus.OK);
    }

    @PutMapping("/updateTrang/{idTrang}")
    public ResponseEntity<?> updateTrangThai(@PathVariable int idTrang,@RequestBody PhieuDatDto dto){
        PhieuDatDto update = phieuDatService.UpdateTrangThai(idTrang,dto);
        return new ResponseEntity<>(update, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePhieuDatById(@PathVariable int id){
        phieuDatService.deletePhieuDatById(id);
        return new ResponseEntity<>(null,HttpStatus.OK);
    }


}
