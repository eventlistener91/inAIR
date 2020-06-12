package kr.or.inair.freeboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Freeboard_FileVO;

public interface IFreeBoardFileDao {
	/**
	 * vo를 받아서 데이터베이스에 추가시키는 매서드 
	 * @date 2020-05-07
	 * @author 한유경
	 * @param freefileItemList
	 * @throws Exception
	 */
	public void insertFileItem(List<Freeboard_FileVO> freefileItemList) throws Exception;
	/**
	 * 자유게시판 첨부번호를 params로 받아서 해당하는 Freeboard_FileVO를 반환하는 매서드
	 * @date 2020-05-07
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public Freeboard_FileVO freefileItemInfo(Map<String, String> params) throws Exception;


}
