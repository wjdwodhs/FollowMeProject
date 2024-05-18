package com.fz.followme.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AssetDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<AssetDto> selectcarList() {
		return sqlSessionTemplate.selectList("assetMapper.selectcarList");
	}
	
	
	public int insertCar(AssetDto ad) {
		return sqlSessionTemplate.insert("assetMapper.insertCar", ad);
	}
	
	
	public AssetDto selectCar(int no) {
		return sqlSessionTemplate.selectOne("assetMapper.selectCar", no);
	}
	
	public int updatecar(AssetDto ad) {
		return sqlSessionTemplate.update("assetMapper.updatecar", ad);
	}
	
	public int selectCarReservationListCount() {
		return sqlSessionTemplate.selectOne("assetMapper.selectCarReservationListCount");
	}
	
	
	public List<AssetReservationDto> selectCarReservationList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("assetMapper.selectCarReservationList", null, rowBounds);
	}
	
	
	public int deleteCar(int no) {
		return sqlSessionTemplate.delete("assetMapper.deleteCar", no);
	}
	
	
	public int deleteRsvnList(int[] checkedRsvn) {
		return sqlSessionTemplate.delete("assetMapper.deleteRsvnList", checkedRsvn);
	}
	
	public int insertRsvnCar(AssetReservationDto ard) {
		return sqlSessionTemplate.insert("assetMapper.insertRsvnCar", ard);
	}
	
	
	public int doublecheckReservation(AssetReservationDto ard) {
		return sqlSessionTemplate.selectOne("assetMapper.doublecheckReservation", ard);
	}
	
	public int updateAssetstartDateStatus() {
		return sqlSessionTemplate.update("assetMapper.updateAssetstartDateStatus");
	}
	
	public int updateAssetendDateStatus() {
		return sqlSessionTemplate.update("assetMapper.updateAssetendDateStatus");
	}
	
	
	public List<AssetReservationDto> selectDateList(String rsvnDate){
		return sqlSessionTemplate.selectList("assetMapper.selectDateList", rsvnDate);
	}
	
	
	public int deleteRsvnListMember(int[] checkedRsvn) {
		return sqlSessionTemplate.update("assetMapper.deleteRsvnListMember",checkedRsvn);
	}
	
	public List<AssetReservationDto> selectSeatList(String rsvnDate){
		return sqlSessionTemplate.selectList("assetMapper.selectSeatList", rsvnDate);
	}
	
	public int updateStatusSeat(AssetDto ad) {
		return sqlSessionTemplate.update("assetMapper.updateStatusSeat", ad);
	}
	
	
}
