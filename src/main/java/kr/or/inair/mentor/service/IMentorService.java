package kr.or.inair.mentor.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.inair.vo.MentorLowproVO;
import kr.or.inair.vo.MentorVO;

public interface IMentorService {
	/**
	 * params로 받아서 list로 반환하는 매서드 
	 * @date 2020-05-13
	 * @author 한유경
	 * @param params 
	 * @return params를 받아서 list로 반환
	 * @throws Exception
	 */
	public List<MentorVO> mentorList(Map<String, String> params) throws Exception;
	/**
	 * 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환하는 매서드 
	 * @date 2020-05-13
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 게시글 갯수를 반환
	 * @throws Exception
	 */
	
	public String totalCount(Map<String, String> params) throws Exception;
	/**
	 * 해당 게시물의 댓글의 갯수를 반환해주는 매서드 
	 * @param 2020-05-14
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 해당 게시물의 댓글의 갯수 반환
	 * @throws Exception
	 */
	public String totalComment(Map<String, String> params) throws Exception;
	/**
	 * membervo를 반환하여 해당 게시물 자세히보기 매서드 
	 * @date 2020-05-14
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 membervo반환
	 * @throws Exception
	 */
	public MentorVO mentorboardInfo(Map<String, String> params) throws Exception;
	/**
	 * mentor_num를 받아서 update시켜주는 매서드 
	 * @date 2020-05-14
	 * @author 한유경
	 * @param mentorboardInfo
	 * @throws Exception
	 */
	public void updateMentorboard(MentorVO mentorboardInfo) throws Exception;
	/**
	 * mentor_num을 받아서 mentor_delete의 값을 update하는 매서드 
	 * @date 2020-05-14
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteMentorboard(Map<String, String> params) throws Exception;
	/**
	 * vo를 받아서 추가시키는 매서드
	 * @date 2020-05-14
	 * @author 한유경
	 * @param mentorboardInfo
	 * @return
	 * @throws Exception
	 */
	public void insertMentorboard(MentorVO mentorboardInfo,MultipartFile[] items) throws Exception;
	/**
	 * mentor_group을 params로 받아서 list를 반환해주는 매서드 
	 * @date 2020-05-15
	 * @author 한유경
	 * @param commentParams
	 * @return mentor_group을 params로 받아서 list를 반환
	 * @throws Exception
	 */
	public List<MentorVO> mentorComment(Map<String, String> commentParams) throws Exception; 
	/**
	 * vo를 받아서 댓글로 데이터베이스에 추가시켜주는 매서드 
	 * @date 2020-05-15
	 * @author 한유경
	 * @param mentorboardInfo
	 * @throws Exception
	 */
	public void insertMentorReply(MentorVO mentorboardInfo) throws Exception;
	/**
	 * params로 받아서 list로 반환하는 매서드 
	 * @date 2020-05-15
	 * @author 한유경
	 * @param params
	 * @return params로 받아서 list로 반환
	 * @throws Exception
	 */
	public List<MentorLowproVO> mentorLowproList(Map<String, String > params) throws Exception;
	/**
	 * 댓글을 수정시켜주는 매서드 
	 * @date 2020-05-15
	 * @author 한유경
	 * @param mentorboardInfo
	 * @throws Exception
	 */
	public void updateComment(MentorVO mentorboardInfo) throws Exception;
	/**
	 * 조회수가 높은 인기글 5를 출력해주는 매서드 
	 * @date 2020-05-16
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
	public List<MentorVO> mentorPopularity() throws Exception;
	
	
	
	
}
