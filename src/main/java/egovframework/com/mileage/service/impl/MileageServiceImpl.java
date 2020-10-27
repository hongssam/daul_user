package egovframework.com.mileage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mileage.mapper.MileageMapper;
import egovframework.com.mileage.service.MileageService;
import egovframework.com.mileage.vo.MileageVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mileageService")
public class MileageServiceImpl extends EgovAbstractServiceImpl  implements MileageService{

	@Resource(name="mileageMapper")
	private MileageMapper mileageMapper;
	
	@Override
	public MileageVo getOnOff(MileageVo vo) throws Exception {
		return mileageMapper.getOnOff(vo);
	}

	@Override
	public void accumulate(MileageVo vo) throws Exception {
		mileageMapper.accumulate(vo);
	}

	@Override
	public void deleteMileage(MileageVo vo) throws Exception {
		mileageMapper.deleteMileage(vo);
	}

}
