package com.codetest.model.vo;

public class Duck {
	private FlyInterface flyImpl = null;
	private QuackInterface quackImpl = null;
	
	public void performFly() {
		flyImpl.fly();
	}
	
	public void performQuack() {
		quackImpl.quack();
	}
	
	public void setFlyBehavior(FlyInterface flyImpl) {
		this.flyImpl = flyImpl;
	}
	public void setQuackBehavior(QuackInterface quackImpl) {
		this.quackImpl = quackImpl;
	}
	
}
