package kr.or.inair.companymember.comprofile.service;

import kr.or.inair.vo.COM_ProfileVO;

public interface ICompanyMEMComProfileService {
	/**
	 * 기업 회원 아이디를 매개변수로 전달받아 기업회원 프로필 정보를 반환하는 메서드
	 * @param com_id
	 * @return COM_ProfileVO
	 * @throws Exception
	 * @since 2020-05-21
	 * @author JSM
	 */
	COM_ProfileVO getComProfileInfo(String com_id) throws Exception;

	/**
	 * 기업회원 프로필사진 정보를 매개변수로 전달받아 insert하는 메서드 
	 * @param comProfileInfo
	 * @throws Exception
	 * @since 2020-05-21
	 * @author JSM
	 */
	void insertComProfileInfo(COM_ProfileVO comProfileInfo) throws Exception;
	
	/**
	 * 기업회원 프로필사진 정보를 매개변수로 전달받아 update하는 메서드 
	 * @param comProfileInfo
	 * @throws Exception
	 * @since 2020-05-21
	 * @author JSM
	 */
	void updateComProfileInfo(COM_ProfileVO comProfileInfo) throws Exception;
}