package kr.or.inair.companymember.recruitmentfield.dao;

import java.util.List;

import kr.or.inair.vo.Recruitment_FieldVO;

public interface IRecruitmentFieldDao {

	/**
	 * 모집분야 리스트를 insert하는 메서드 
	 * @param insertRecruitmentFieldList
	 * @throws Exception
	 */
	void insertRecruitmentFieldList(List<Recruitment_FieldVO> insertRecruitmentFieldList) throws Exception;
}
