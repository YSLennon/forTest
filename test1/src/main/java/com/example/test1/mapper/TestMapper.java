package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Test;

@Mapper
public interface TestMapper {
	Test searchBbsList(HashMap<String, Object> map);
	void modify(HashMap<String, Object> map);
	void remove(HashMap<String, Object> map);
	void insert(HashMap<String, Object> map);
}
