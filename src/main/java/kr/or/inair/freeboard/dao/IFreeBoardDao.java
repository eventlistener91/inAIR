package kr.or.inair.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.FreeboardVO;

public interface IFreeBoardDao {
	/**
	 * 시작게시물와 끝게시물을 params로 받아서 list를 반환하는 매서드 
	 * @date 2020-05-04
	 * @author 한유경
	 * @param params
	 * @return startCount와 endCount를 params로 받아서 list를 반환
	 * @throws Exception
	 */
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception;	
	/**
	 * freeboard_group를 params로 받아서 list를 반환해주는 메서드
	 * @date 2020-05-08
	 * @author 한유경
	 * @param params
	 * @return freeboard_group를 params로 받아서 list를 반환
	 * @throws Exception
	 */
	public List<FreeboardVO> freeboardComment(Map<String, String> commentparams) throws Exception;
	/**
	 * 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환하는 매서드
	 * @date 2020-05-04
	 * @author 한유경
	 * @param params
	 * @return 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환
	 * @throws Exception
	 */
	public String totalCount(Map<String, String> params) throws Exception;
	/**
	 * 자유게시판 번호를 params로 받아서 해당하는 freeboardVO를 반환하는 매서드 
	 * @date 2020-05-06
	 * @author 한유경
	 * @param params
	 * @return 자유게시판 번호를 params로 받아서 해당하는 freeboardVO
	 * @throws Exception
	 */
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception;
	/**
	 * FreeboardVO를 받아서 update시켜주는 매서드 
	 * @date 2020-05-06
	 * @author 한유경
	 * @param freeboardUpdateInfo
	 * @throws Exception
	 */
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	/**
	 * FreeboardVO를 받아서 comment를 update시켜주는 매서드 
	 * @date 2020-05-09
	 * @author 한유경
	 * @param freeboardInfo
	 * @throws Exception
	 */
	public void updateComment(FreeboardVO freeboardInfo) throws Exception;
	/**
	 * freeboard_num를 받아서 FREEBOARD_DELETE의 값을 update하는 매서드 
	 * @date 2020-05-06
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteFreeboardInfo(Map<String, String> params) throws Exception;
	/**
	 * vo를 받아서 추가 시키는 매서드 
	 * @date 2020-05-07
	 * @author 한유경
	 * @param freeboardInfo
	 * @return
	 * @throws Exception
	 */
	public String insertFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	/**
	 * vo를 받아서 데이터베이스에 추가시키는 매서드 
	 * @date 2020-05-07
	 * @author 한유경
	 * @param freeboardInfo
	 * @throws Exception
	 */
	public void insertFreeboardReply(FreeboardVO freeboardInfo) throws Exception;
	

	

}
