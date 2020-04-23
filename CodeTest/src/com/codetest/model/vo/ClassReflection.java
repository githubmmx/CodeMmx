package com.codetest.model.vo;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.lang.reflect.TypeVariable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ClassReflection {
	public static <E> List<E> selectList(E object) {
		try {
			System.out.println(object.getClass().getName());
			E dd = (E) object.getClass().forName(object.getClass().getName());
			
			System.out.println(dd.getClass().getName());
			if(dd instanceof Board) {
				System.out.println("dd instanceof Board");
			}
			
//			E e = (E) object.getClass().getConstructor(object.getClass());
			Constructor[] constructors = object.getClass().getDeclaredConstructors();
			E e = null;
//			for (Constructor constructor : constructors) {
//				System.out.println(constructor.getName());
//				e = (E) constructor.newInstance(object);
//			}
//			System.out.println(e.toString());
			
			
			
			System.out.println("ㅇㅎㅇㅎ" +  object.getClass().getDeclaredConstructor());
			System.out.println(object.getClass().getName());
			System.out.println("ㅎㅇ : " + object.getClass().getDeclaredConstructor(object.getClass().getClasses()));
			e =  (E) object.getClass().getDeclaredConstructor(object.getClass().getClasses()).newInstance();
			System.out.println("ㅎㅇㅎㅇ : "+e.toString());
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String[] querys = {"Date","OriginalFileName","No","Content","RenamedFileName","Title","Writer","ReadCount"};
		Map<String,Object> map = new HashMap();
		map.put("Date", new Date(System.currentTimeMillis()));
		map.put("OriginalFileName", "oriName");
		map.put("No", 11);
		map.put("Content", "호이호이");
		map.put("RenamedFileName", "reName");
		map.put("Title", "아기공룡");
		map.put("Writer", "둘리");
		map.put("ReadCount", 33);
		List<E> list= new ArrayList<E>();
		Method[] methods = object.getClass().getDeclaredMethods();
		for (Method method : methods) {
			System.out.println(method.getName());
			if(method.getName().contains("set")) {
				Iterator<String> iter = map.keySet().iterator();
				while(iter.hasNext()) {
					String key = iter.next();
					if(method.getName().equals("set"+key)) {
						 Parameter[] parameters = method.getParameters();
                    	 System.out.println("parameters : " + parameters[0].getType().getSimpleName());
//                    	 if(parameters[0].getName()) {
//                    		 
//                    	 }
						try {
							method.invoke(object, map.get(key));
						} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							return null;
						}
					}
				}
			}
		}
		return list;
	}
}
