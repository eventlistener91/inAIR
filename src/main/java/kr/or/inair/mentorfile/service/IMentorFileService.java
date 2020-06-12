package kr.or.inair.mentorfile.service;

import java.util.Map;

import kr.or.inair.vo.Mentor_FileVO;

public interface IMentorFileService {
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
