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

// fix
    @GetMapping("")
    public Page<PhieuDat> getAllPhieuDat(Pageable pageable){
        Page<PhieuDat> phieuDatPage = phieuDatService.getPagePhieudat(pageable);
        return phieuDatPage;
    }

    @GetMapping("/all")
    public ResponseEntity<?> getAll(){
        List<PhieuDat> phieuDatPage = phieuDatService.getAll();
        return new ResponseEntity<>(phieuDatPage,HttpStatus.OK);
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

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePhieuDatById(@PathVariable int id){
        phieuDatService.deletePhieuDatById(id);
        return new ResponseEntity<>(null,HttpStatus.OK);
    }


}
