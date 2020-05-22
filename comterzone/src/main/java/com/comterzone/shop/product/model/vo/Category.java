package com.comterzone.shop.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class Category {
	
	// 레벨
	private int level;
	
    // 넘버 
    private int no;

    // 카테고리 이름 
    private String category_name;

    // 부모 카테고리 넘버 
    private int parent_category_no;

    // 상태 
    private String state;

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getParent_category_no() {
		return parent_category_no;
	}

	public void setParent_category_no(int parent_category_no) {
		this.parent_category_no = parent_category_no;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Category [level=" + level + ", no=" + no + ", category_name=" + category_name + ", parent_category_no="
				+ parent_category_no + ", state=" + state + "]";
	}

    
    
   
	
	
}