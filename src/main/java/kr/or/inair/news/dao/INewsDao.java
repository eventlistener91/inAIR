package kr.or.inair.news.dao;

import java.util.List;

import kr.or.inair.vo.NewsVO;

public interface INewsDao {
	
	/**
	 * 오늘 날짜에 뉴스 리스트를 반환하는 메서드
	 * @param 취득하고자 하는 뉴스리스트의 뉴스키워드
	 * @return 뉴스리스트 반환
	 * @author 우영래
	 * @since 2020-05-01
	 */
	List<NewsVO> getNewsList(String clickKeyWord) throws Exception;
	
	/**
	 * 뉴스를 등록하는 메서드
	 * @param 등록할 뉴스 리스트
	 * @return 등록에 성공하면 true, 실패하면 false 반환
	 * @author 우영래
	 * @since 2020-05-01
	 */
	Object insertNews(List<NewsVO> newsList) throws Exception;
	
}
