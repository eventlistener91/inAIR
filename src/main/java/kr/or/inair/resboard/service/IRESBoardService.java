package kr.or.inair.resboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.inair.vo.ResboardVO;

public interface IRESBoardService {
	/**
	 * 시작게시물과 끝게시물을 params로 받아서 list로 반환하는 매서드
	 * @date 2020-05-20
	 * @author 한유경
	 * @param params
	 * @return startCount와 endCount를 params로 받아서 list를 반환
	 * @throws Exception
	 */
	public List<ResboardVO> resboardList(Map<String, String> params) throws Exception;
	/**
	 * 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환하는 매서드 
	 * @date 2020-05-20
	 * @author 한유경
	 * @param params
	 * @return 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환
	 * @throws Exception
	 */
	public String totalCount(Map<String, String> params) throws Exception;
	/**
	 * res_num을 params로 받아서 해당하는 게시글 vo를 반환하는 매서드 
	 * @date 2020-05-20
	 * @author 한유경
	 * @param params
	 * @return res_num을 params로 받아서 해당하는 게시글 vo를 반환
	 * @throws Exception
	 */
	public ResboardVO resboardInfo(Map<String, String> params) throws Exception;
	/**
	 * ResboardVO를 받아서 update시켜주는 매서드 
	 * @date 2020-05-21
	 * @author 한유경
	 * @param resboardInfo
	 * @throws Exception
	 */
	public void updateResboard(ResboardVO resboardInfo) throws Exception;
	/**
	 * res_num을 받아서 res_delete를 Y로 UPDATE시켜주는 매서드 
	 * @date 2020-05-21
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteResboard(Map<String, String> params) throws Exception;
	/**
	 * vo를 받아서 자료실 자료실파일을 데이터베이스에 추가 시켜주는 매서드
	 * @date 2020-05-21
	 * @author 한유경
	 * @param resboardInfo
	 * @return
	 * @throws Exception
	 */
	public void insertResboardInfo(ResboardVO resboardInfo,MultipartFile[] items) throws Exception;
	/**
	 * res_group 을 받아서 list를 출력하는 매서드 
	 * @date 2020-05-21
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<ResboardVO> resCommentList(Map<String, String> params) throws Exception;
	/**
	 * vo를 받아서 데이터베이스에 추가시키는 매서드 (댓글추가)
	 * @date 2020-05-21
	 * @author 한유경
	 * @param resboardInfo
	 * @throws Exception
	 */
	public void insertResboardReply(ResboardVO resboardInfo) throws Exception;
	/**
	 * vo를 받아서 update시켜주는 매서드 
	 * @date 2020-05-21
	 * @author 한유경
	 * @param resboardInfo
	 * @throws Exception
	 */
	public void updateCommentResboard(ResboardVO resboardInfo) throws Exception;
}
