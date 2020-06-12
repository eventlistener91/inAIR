package kr.or.inair.resboardfile.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Resboard_FileVO;

public interface IRESBoardFileService {
	/**
	 * 자료실파일 첨부번호를 params로 받아서 Resboard_FileVO를 반환하는 매서드
	 * @date 2020-05-21
	 * @author 한유경
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public Resboard_FileVO resboardfileItemInfo(Map<String, String> param) throws Exception;
	/**
	 * 자료실 첨부번호를 params로 받아서 update 시켜주는 매서드 
	 * @date 2020-05-22
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public void updateFileitem(Resboard_FileVO resFileInfo) throws Exception;

}
