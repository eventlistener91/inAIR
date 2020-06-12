package kr.or.inair.resboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Resboard_FileVO;

public interface IRESBoardFileDao {
	/**
	 * vo를 받아서 데이터베이스에 추가시키는 매서드
	 * @date 2020-05-21
	 * @author 한유경
	 * @param resfileItemList
	 * @throws Exception
	 */
	public void insertFileItem(List<Resboard_FileVO> resfileItemList) throws Exception;
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
