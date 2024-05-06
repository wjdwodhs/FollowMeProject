package com.fz.followme.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fz.followme.dto.AssetDto;

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
	
	
}
