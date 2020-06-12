package kr.or.inair.recentjo.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Recent_JoVO;

public interface IRecentJOService {

	/**
	 * 개인회원이 본 공고를 insert하는 메서드
	 * @param params 개인회원 아이디, 조회한 공고 번호
	 * @throws Exception
	 * @author 이혜인
	 */
	public void insertRecentJo(Map<String, String> params) throws Exception;
	
	/**
	 * 개인회원이 본 최근 공고 리스트를 반환하는 메서드
	 * @param indvdl_id
	 * @return 개인회원이 본 공고 리스트
	 * @throws Exception
	 * @author 이혜인
	 */
	public List<Recent_JoVO> recentJoList(String indvdl_id) throws Exception;
}
