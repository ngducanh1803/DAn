package com.tmp.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class TourDtoSearch {
    private String tenTour;
    private String xuatPhat;
    private int soNgay;
    private int soDem;
}
