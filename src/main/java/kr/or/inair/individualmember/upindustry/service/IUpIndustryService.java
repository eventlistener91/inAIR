package kr.or.inair.individualmember.upindustry.service;

import java.util.List;

import kr.or.inair.vo.UpIndustryVO;

public interface IUpIndustryService {
	/**
	 * 상위 업종 리스트를 반환하는 메서드 
	 * @return List<UpIndustry>
	 * @throws Exception
	 * @author JSM
	 */
	List<UpIndustryVO> getUpIndustryList() throws Exception;
	
	
}
