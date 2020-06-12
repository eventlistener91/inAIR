package kr.or.inair.individualmember.indvdlsecession.service;

import java.util.List;

import kr.or.inair.vo.INDVDL_DropVO;

public interface IINDVDLDropService {

	/**
	 * 개인 회원 탈퇴 사유 리스트를 반환하는 메서드
	 * @return 탈퇴 사유 리스트
	 * @throws Exception
	 * @author 이혜인
	 */
	public List<INDVDL_DropVO> indvdlDropOutList() throws Exception;
}
