package kr.or.inair.company.servie;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyVO;

public interface ICompanyService {
	
	/**
	 * 회사정보를 데이터베이스에 등록하는 메서드
	 * @param 회사정보
	 * @author 우영래
	 * @since 2020-05-13
	 */
	void insertCompany(Map<String, String> params) throws Exception;
	
	/**
	 * 회사 고유번호에 해당하는 회사정보를 반환하는 메서드
	 * @param 회사고유번호
	 * @return 회사정보
	 * @author 우영래
	 * @since 2020-05-13
	 */
	CompanyVO getCompanyInfo(String corp_code) throws Exception;
	
	/**
	 * 회사 기업정보를 update하는 메서드 
	 * @param updateCompanyVo
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-21
	 */
	void updateCompany(CompanyVO updateCompanyVo) throws Exception;
	
	/**
	 * 기업 검색시 해당하는 회사 정보 리스트 반환
	 * @param params 기업 검색할 키워드
	 * @return 회사정보
	 * @throws Exception
	 * @author 이혜인
	 */
	List<CompanyVO> companyList(Map<String, String> params) throws Exception;
}