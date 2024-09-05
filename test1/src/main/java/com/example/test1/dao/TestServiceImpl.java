package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;
import com.example.test1.model.Test;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;

	@Override
	public HashMap<String, Object> searchBbsList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			Test test = testMapper.searchBbsList(map);
			resultMap.put("test", test);			
			resultMap.put("result", true);
			resultMap.put("message", "과일을 찾았습니다");
			
		} catch(Exception e) {		
			resultMap.put("reuslt", false);
			resultMap.put("message", "Exception e : " + e);
	
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> modify(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			testMapper.modify(map);
			resultMap.put("result", true);
			resultMap.put("message", "가격이 변경되었습니다");
			
		} catch(Exception e) {		
			resultMap.put("reuslt", false);
			resultMap.put("message", "Exception e : " + e);
			
		}
		return resultMap;
		
	}
	@Override
	public HashMap<String, Object> remove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			testMapper.remove(map);
			resultMap.put("result", true);
			resultMap.put("message", "삭제되었습니다");
			
		} catch(Exception e) {		
			resultMap.put("reuslt", false);
			resultMap.put("message", "Exception e : " + e);
			
		}
		return resultMap;
		
	}
	@Override
	public HashMap<String, Object> insert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap();
		try {
			testMapper.insert(map);
			resultMap.put("result", true);
			resultMap.put("message", "생성되었습니다");
			
		} catch(Exception e) {		
			resultMap.put("reuslt", false);
			resultMap.put("message", "Exception e : " + e);
			
		}
		return resultMap;
		
	}

}
