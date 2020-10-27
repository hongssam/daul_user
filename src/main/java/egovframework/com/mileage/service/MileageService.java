package egovframework.com.mileage.service;

import egovframework.com.mileage.vo.MileageVo;

public interface MileageService {
	MileageVo getOnOff(MileageVo vo) throws Exception;
	
	void accumulate(MileageVo vo) throws Exception;
	
	void deleteMileage(MileageVo vo) throws Exception;
}
