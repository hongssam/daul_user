package egovframework.com.mileage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import egovframework.com.mileage.service.MileageService;
import egovframework.com.mileage.vo.MileageVo;


@Component("mileageController")
@Controller
public class MileageController {
	
	@Resource(name="mileageService")
	private MileageService mileageService;
	
	public void AccumulateMileage(MileageVo vo) {
		MileageVo mileageVo = new MileageVo();
		try {
			// on-off 여부판단
			mileageVo = mileageService.getOnOff(vo);
			mileageVo.setUser_id(vo.getUser_id());
			mileageVo.setBoard_id(vo.getBoard_id());
			mileageVo.setAction_id(vo.getAction_id());
			if(mileageVo.getOn_off().equals("Y")) {
				//마일리지 적립
				mileageService.accumulate(mileageVo);
				
			}else {
				System.out.println("마일리지 적립 off");
			}
		}catch(Exception e) {
			
		}
		
	}
	
	public void deleteMileage(MileageVo vo) {
		try {
			mileageService.deleteMileage(vo);
		}catch(Exception e) {
			
		}
	}
	
	
}
