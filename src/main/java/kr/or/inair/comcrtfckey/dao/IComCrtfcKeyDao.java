package kr.or.inair.comcrtfckey.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Com_CrtfcKeyVO;

public interface IComCrtfcKeyDao {
	
	/**
	 * 회사명에 해당하는 회사 고유번호와 회사명을 반환하는 메서드
	 * @param 회사명
	 * @return 회사명에 해당하는 회사 고유번호와 회사명
	 * @author 우영래
	 * @since 2020-05-13
	 */
	List<Com_CrtfcKeyVO> getComCrtfcKey(Map<String, String> params) throws Exception; 
	
	/**
	 * 회사 고유번호를 삭제하는 메서드
	 * @param 회사 고유번호
	 * @author 우영래
	 * @since 2020-05-13
	 */
	void deleteCrtfcKey(String corp_code) throws Exception;
	
	List<Com_CrtfcKeyVO> getComNameList(String corp_name) throws Exception;
	
}
