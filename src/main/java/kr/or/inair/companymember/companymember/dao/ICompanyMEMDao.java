package kr.or.inair.companymember.companymember.dao;

import java.util.Map;

import kr.or.inair.vo.CompanyMemVO;

public interface ICompanyMEMDao {
	
	/**
	 * 아이디와 비밀번호가 일치하는 기업회원 정보를 반환하는 메서드
	 * @param 아이디와 비밀번호
	 * @return 기업회원정보
	 * @author 우영래
	 * @since 2020-05-12
	 */
	CompanyMemVO getComMemInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 아이디나 이메일이나 기업고유번호 중복체크 메서드
	 * @param 아이디나 이메일이나 기업고유번호
	 * @return 기업회원정보
	 * @author 우영래
	 * @since 2020-05-15
	 */
	CompanyMemVO duplCheck(Map<String, String> params) throws Exception;
	
	/**
	 * 기업회원 등록 메서드
	 * @param 등록할 기업회원 정보
	 * @author 우영래
	 * @since 2020-05-18
	 */
	void insertCompanyMember(CompanyMemVO comMemberInfo) throws Exception;
	
	/**
	 * 기업회원 아이디를 받아 기업회원의 기본정보 기업정보 추가정보를 반환하는 매서드
	 * @param com_id
	 * @return CompanyMemVO
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-21
	 */
	CompanyMemVO getMyPageCompanyMemberInfo(String com_id) throws Exception;
	
	/**
	 * 기업회원의 기본정보를 update하는 메서드
	 * @param updateCompanyMemVo
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-21
	 */
	void updatecompanyMEMInfo(CompanyMemVO updateCompanyMemVo) throws Exception;
	
	/**
	 * 기업회원의 수정할 비밀번호를 매개변수로 전달받아 비밀번호를 update하는 메서드 
	 * @param params
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-29
	 */
	void passwordChange(Map<String, String> params) throws Exception;

	/**
	 * 탈퇴할 기업회원의 아이디와 탈퇴사유를 입력받아 탈퇴시키는 메서드
	 * @param params
	 * @throws Exception
	 * @author JSM
	 * @since 2020-06-03
	 */
	void deleteComMem(Map<String, String> params) throws Exception;
}