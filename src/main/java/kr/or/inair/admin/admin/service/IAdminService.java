package kr.or.inair.admin.admin.service;

import kr.or.inair.vo.AdminVO;

public interface IAdminService {

	/**
	 * 관리자 아이디와 비밀번호를 매개변수로 전달받아 존재하는지 확인하는 메서드 
	 * @param adminInfo
	 * @return
	 * @throws Exception
	 */
	boolean getAdminInfo(AdminVO adminInfo) throws Exception;
}
