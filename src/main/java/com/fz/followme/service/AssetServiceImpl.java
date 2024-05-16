package com.fz.followme.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AssetDao;
import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AssetServiceImpl implements AssetService {

	private final AssetDao assetDao;

	@Override
	public List<AssetDto> selectcarList() {
		return assetDao.selectcarList();
	}


	@Override
	public int insertCar(AssetDto ad) {
		return assetDao.insertCar(ad);
	}


	@Override
	public AssetDto selectCar(int no) {
		return assetDao.selectCar(no);
	}


	@Override
	public int updatecar(AssetDto ad) {
		return assetDao.updatecar(ad);
	}


	@Override
	public int selectCarReservationListCount() {
		return assetDao.selectCarReservationListCount();
	}


	@Override
	public List<AssetReservationDto> selectCarReservationList(PageInfoDto pi) {
		return assetDao.selectCarReservationList(pi);
	}


	@Override
	public int deleteCar(int no) {
		return assetDao.deleteCar(no);
	}


	@Override
	public int deleteRsvnList(int[] checkedRsvn) {
		return assetDao.deleteRsvnList(checkedRsvn);
	}


	@Override
	public List<AssetReservationDto> selectDateList(String rsvnDate) {
		return assetDao.selectDateList(rsvnDate);
	}


	@Override
	public int deleteRsvnListMember(int[] checkedRsvn) {
		return assetDao.deleteRsvnListMember(checkedRsvn);
	}


	

	
	
	
	
}
