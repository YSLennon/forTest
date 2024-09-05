package com.example.test1.dao;

import java.util.HashMap;

public interface TestService {
	HashMap<String, Object> searchBbsList(HashMap<String, Object> map);
	HashMap<String, Object> modify(HashMap<String, Object> map);
	HashMap<String, Object> remove(HashMap<String, Object> map);
	HashMap<String, Object> insert(HashMap<String, Object> map);
}
