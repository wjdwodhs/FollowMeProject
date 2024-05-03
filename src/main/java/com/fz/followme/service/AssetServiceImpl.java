package com.fz.followme.service;

import org.springframework.stereotype.Service;

import com.fz.followme.dao.AssetDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AssetServiceImpl implements AssetService {

	private final AssetDao assetDao;
	
	
}
