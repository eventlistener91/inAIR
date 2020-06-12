package kr.or.inair.selfintroduction.dao;

import java.util.List;

import kr.or.inair.vo.SelfIntroductionVO;

public interface ISelfIntroductionDao {
	/**
	 * 자기소개서 리스트를 insert하는 메서드 
	 * @param insertSelfIntroductionList
	 * @throws Exception
	 */
	void insertSelfIntroductionList(List<SelfIntroductionVO> insertSelfIntroductionList) throws Exception;
	
	/**
	 * 자기소개서 리스트를 update하는 메서드 
	 * @param updateSelfIntroductionList
	 * @throws Exception
	 */
	void updateSelfIntroductionList(List<SelfIntroductionVO> updateSelfIntroductionList) throws Exception;
}
