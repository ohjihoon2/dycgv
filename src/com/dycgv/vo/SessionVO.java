package com.dycgv.vo;

/**
 * dao에서 로그인에 성공하면 사용
 * @author sist
 *
 */
public class SessionVO {
	boolean result;
	String name;
	
	//boolean get메소드를 사용하지 않고 자동으로 isResult형식으로 만들어 준다. 
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
