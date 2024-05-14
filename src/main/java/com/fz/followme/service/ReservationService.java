package com.fz.followme.service;

import org.springframework.dao.DataAccessException;

import com.fz.followme.dto.AssetReservationDto;

public interface ReservationService {
    
	int addReservation(AssetReservationDto reservationDto) throws DataAccessException;
}