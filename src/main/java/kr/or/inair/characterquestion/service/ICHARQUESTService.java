package kr.or.inair.characterquestion.service;

import java.util.List;

import kr.or.inair.vo.CHAR_QuestVO;

public interface ICHARQUESTService {

	/**
	 * 인성역량검사의 질문지 리스트를 반환하는 메서드
	 * @return 인성검사 질문지 리스트
	 * @author 이혜인
	 */
	public List<CHAR_QuestVO> char_QuestList() throws Exception;
	
}
