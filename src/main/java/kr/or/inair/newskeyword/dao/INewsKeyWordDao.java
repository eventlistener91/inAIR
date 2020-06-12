package kr.or.inair.newskeyword.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.inair.vo.NewsKeyWordVO;

public interface INewsKeyWordDao {
	
	/**
	 * 뉴스 키워드 리스트를 반환하는 메서드
	 * @return 뉴스 키워드 리스트 반환
	 * @author 우영래
	 * @since 2020-04-29
	 */
	List<NewsKeyWordVO> getNewsKeyWordList() throws Exception;
	
	/**
	 * 뉴스 키워드를 등록하는 메서드
	 * @return 등록에 성공하면 true, 실패하면 false 반환
	 * @param 등록할 뉴스 키워드 리스트
	 * @author 우영래
	 * @since 2020-04-29
	 */
	Object insertNewsKeyWord(List<NewsKeyWordVO> newsKeyWordList) throws Exception;
}
