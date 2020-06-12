package kr.or.inair.mentorfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.MentorVO;
import kr.or.inair.vo.Mentor_FileVO;

public interface IMentorFileDao {
	/**
	 * list를 받아서 데이터베이스에 추가시키는 매서드 
	 * @date 2020-05-14
	 * @author 한유경
	 * @param mentorFileList
	 * @throws Exception
	 */
	public void insertFileItem(List<Mentor_FileVO> mentorFileList) throws Exception;
	/**
	 * 첨부번호를 params로 받아서 해당하는 mentor_fileVO를 반환하는 매서드 
	 * @date 2020-05-14
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public Mentor_FileVO mentorfileItemInfo(Map<String, String> params) throws Exception;
	
	

}
