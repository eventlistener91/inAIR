package kr.or.inair.admin.companymember.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CompanyMemVO;

public interface IAdminCompanyMEMDao {
	/**
	 * (검색하는 또는 전체)기업 회원 count를 반환하는 메서드 
	 * @param params
	 * @return String 기업회원 count 
	 * @throws Exception
	 */
	String getTotalCount(Map<String, String> params) throws Exception;

	/**
	 * (검색하는 또는 전체)기업 회원 리스트를 반환하는 메서드 
	 * @param params
	 * @return List<CompanyMemVO>
	 * @throws Exception
	 * @since 2020-05-21
	 * @author JSM
	 */
	List<CompanyMemVO> getCompanyMemList(Map<String, String> params) throws Exception;
	
	/**
	 * 탈퇴한 기업회원 전체 수를 반환하는 메서드  
	 * @param params
	 * @return String total count
	 * @throws Exception
	 * @since 2020-05-23
	 * @author JSM
	 */
	String getDeleteCompanyMemberTotalCount(Map<String, String> params) throws Exception;
	
	/**
	 * 전체 (또는 검색)탈퇴한 기업회원 리스트를 반환하는 메서드 
	 * @param params
	 * @return List<CompanyMemVO> 
	 * @throws Exception
	 * @since 2020-05-23
	 * @author JSM
	 */
	List<CompanyMemVO> getDeleteCompanyMemList(Map<String, String> params) throws Exception;
	
	/**
	 * 기업회원 아이디를 매개변수로 전달받아 기업회원 정보를 반환하는 메서드 
	 * @param com_id
	 * @return CompanyMemVO
	 * @throws Exception
	 * @since 2020-05-23
	 * @author JSM
	 */
	CompanyMemVO getCompanyMemberInfo(String com_id) throws Exception;
}