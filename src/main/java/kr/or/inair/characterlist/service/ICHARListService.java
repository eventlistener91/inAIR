package kr.or.inair.characterlist.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_ListVO;

public interface ICHARListService {

	/**
	 * 인성역량검사내역 insert하는 메서드
	 * @param char_num 인성검사 시퀀스 번호
	 * @throws Exception
	 * @author 이혜인
	 */
	public String insertCharList (Map<String, String> params) throws Exception;
	
	/**
	 * 인성역량검사 내역 리스트를 반환하는 메서드
	 * @return 인성검사 내역 리스트
	 * @throws Exception
	 * @author 이혜인
	 */
	public List<CHAR_ListVO> char_List() throws Exception;
}
