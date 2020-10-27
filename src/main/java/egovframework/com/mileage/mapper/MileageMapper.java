package egovframework.com.mileage.mapper;

import egovframework.com.mileage.vo.MileageVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mileageMapper")
public interface MileageMapper {
	MileageVo getOnOff(MileageVo vo) throws Exception;
	
	void accumulate(MileageVo vo) throws Exception;
	
	void deleteMileage(MileageVo vo) throws Exception;
}
