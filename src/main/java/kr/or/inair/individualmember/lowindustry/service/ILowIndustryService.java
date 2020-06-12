package kr.or.inair.individualmember.lowindustry.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.LowIndustryVO;

public interface ILowIndustryService {

	/**
	 * 상위 업종 번호를 전달받아 해당 하위 업종 리스트를 반환하는 메서드
	 * @param params
	 * @return List<LowIndustryVO>
	 * @throws Exception
	 * @author JSM
	 */
	List<LowIndustryVO> getLowIndustryList(Map<String, String>params) throws Exception;
	
	/**
	 * 하위 업종 번호를 매개변수로 전달받아 상위업종명과 하위업종명을 반환하는메서드 
	 * @param lwinduty_num
	 * @return
	 * @throws Exception
	 */
	LowIndustryVO getIndustryInfo(String lwinduty_num) throws Exception;
	
	/**
	 * 하위 업종 리스트를 반환하는 메서드
	 * @return List<LowIndustryVO> 
	 * @throws Exception
	 * @author 이혜인
	 */
	List<LowIndustryVO> getLowIndustry() throws Exception;
}
