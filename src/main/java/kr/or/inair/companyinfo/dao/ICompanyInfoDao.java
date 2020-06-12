package kr.or.inair.companyinfo.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyInfoVO;

public interface ICompanyInfoDao {
	
	/**
	 * 회사정보 등록 메서드
	 * @param 회사정보
	 * @author 우영래
	 * @since 2020-05-13
	 */
	void insertCompanyInfo(Map<String, String> params) throws Exception;

	/**
	 * 기업 고유번호에 해당하는 기업정보를 반환하는 메서드
	 * @param 고유번호
	 * @return 기업정보
	 * @author 우영래
	 * @since 2020-05-13
	 */
	List<CompanyInfoVO> getCompanyInfo(String corp_code) throws Exception;
	
	/**
	 * 회사정보 등록 메서드(회원이 입력)
	 * @param 회사정보
	 * @author 우영래
	 * @since 2020-05-18
	 */
	void insertCompanyInfoByVO(CompanyInfoVO comInfo) throws Exception;
	
	/**
	 * 기업 추가정보를 매개변수로 입력받아 update하는 메서드 
	 * @param updateCompanyInfoList
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-21
	 */
	void updateCompanyInfoList(List<CompanyInfoVO> updateCompanyInfoList) throws Exception;	
}
