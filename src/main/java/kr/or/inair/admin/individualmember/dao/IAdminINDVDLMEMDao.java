package kr.or.inair.admin.individualmember.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.INDVDLMEMVO;

public interface IAdminINDVDLMEMDao {
	/**
	 * 개인회원 리스트를 반환하는 메서드 
	 * @param params
	 * @return List<INDVDLMEMVO>
	 * @throws Exception
	 */
	List<INDVDLMEMVO> getINDVDLMemList(Map<String, String> params) throws Exception;
	
	/**
	 * 개인회원 리스트를 반환하는 메서드 
	 * @param params
	 * @return List<INDVDLMEMVO>
	 * @throws Exception
	 */
	List<INDVDLMEMVO> getDelteINDVDLMemList(Map<String, String> params) throws Exception;
	
	/**
	 * 회원리스트의 전체 카운트 수를 반환하는 메서드 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	String getTotalCount(Map<String, String> params) throws Exception;
	
	/**
	 * 탈퇴한 회원리스트의 전체 카운트 수를 반환하는 메서드 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	String getDeleteINDVDLMEMTotalCount(Map<String, String> params) throws Exception;
	
	/**
	 * 개인회원 아이디를 매개변수로 전달받아 개인회원 정보를 가져오는 메서드 
	 * @param indvdl_id
	 * @return 개인회원 정보
	 */
	INDVDLMEMVO getINDVDLMEMInfo(String indvdl_id) throws Exception;

}
