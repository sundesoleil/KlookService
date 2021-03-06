package com.klook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.ImageMapper;

@Service
public class ImageService {
	@Autowired
	ImageMapper mapper;
	
	public String selectRealImageName(String uri) {
		return mapper.selectRealImageName(uri);
	}
}
