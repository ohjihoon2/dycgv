package com.dycgv.vo;

/**
 * dao���� �α��ο� �����ϸ� ���
 * @author sist
 *
 */
public class SessionVO {
	boolean result;
	String name;
	
	//boolean get�޼ҵ带 ������� �ʰ� �ڵ����� isResult�������� ����� �ش�. 
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
