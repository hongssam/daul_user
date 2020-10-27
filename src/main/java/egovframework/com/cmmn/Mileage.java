package egovframework.com.cmmn;

import javax.annotation.Resource;


import egovframework.com.main.service.MainService;

public class Mileage {
	
	@Resource(name="mainService")
	private MainService mainService;
	
	public void AccumulateMileage(String action_id) {
		
		try {
			// on-off 여부판단
			String on_off = mainService.getOnOff(action_id);
			System.out.println("on_off = " + on_off);
			
			if(on_off.equals("Y")) {
				
			}else {
				System.out.println("마일리지 적립 off");
			}
		}catch(Exception e) {
			
		}
		
	}
}
