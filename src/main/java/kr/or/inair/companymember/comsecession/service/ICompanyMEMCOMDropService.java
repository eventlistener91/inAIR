package kr.or.inair.companymember.comsecession.service;

import java.util.List;

import kr.or.inair.vo.COM_DropVO;

public interface ICompanyMEMCOMDropService {

	/**
	 * 기업회원 탈퇴사유 리스트를 반환하는 메서드 
	 * @return List<COM_DropVO> 
	 * @throws Exception
	 * @author JSM
	 * @since 2020-06-03
	 */
	List<COM_DropVO> getDropOutList() throws Exception;
}
