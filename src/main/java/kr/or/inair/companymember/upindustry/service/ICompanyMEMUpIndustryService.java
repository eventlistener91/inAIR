package kr.or.inair.companymember.upindustry.service;

import java.util.List;

import kr.or.inair.vo.UpIndustryVO;

public interface ICompanyMEMUpIndustryService {
	
	/**
	 * 상위 직종 리스트를 반환하는 메서드 
	 * @return 상위 직종 리스트
	 * @author 우영래
	 * @since 2020-05-18
	 */
	List<UpIndustryVO> getUpIndutyList() throws Exception;
	
}
