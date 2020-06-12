package kr.or.inair.individualmember.joboffer.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Job_OfferVO;

public interface IJobOfferService {

	/**
	 * 구인게시판에 등록된 글수를 반환하는 메서드
	 * @return 구인게시판 글수
	 * @author 우영래
	 * @since 2020-05-09
	 */
	int getJobListCount() throws Exception ;
	
	/**
	 * 구인공고글을 insert 하고 구인공고 번호(jo_num)를 반환하는 메서드 
	 * @param insertJobOffer
	 * @return
	 * @throws Exception
	 */
	String insertjobOffer(Job_OfferVO insertJobOffer) throws Exception;
	
	/**
	 * 기업회원 아이디를 매개변수로 전달받아 해당 회원이 작성한 구인공고 리스트를 반환하는 메서드 
	 * @param com_id
	 * @return List<Job_OfferVO>
	 * @throws Exception
	 * @since 2020-05-20
	 * @author JSM
	 */
	List<Job_OfferVO> getJobOfferList(Map<String, String> params) throws Exception;
	
	/**
	 * 구인글 번호를 매개변수로 전달받아 삭제하는 메서드 
	 * @param jo_num
	 * @throws Exception
	 */
	void deleteJobOffer(String jo_num) throws Exception;
	
	/**
	 * 구인공고글 전체(또는 검색) 리스트를 반환하는 메서드
	 * @param params
	 * @return List<Job_OfferVO>
	 * @throws Exception
	 * @since 2020-05-23
	 * @author JSM
	 */
	List<Job_OfferVO> getAllJobOffer(Map<String, String> params) throws Exception;
	
	/**
	 * 구인공고글 번호를 매개변수로 전달받아 해당 공고글 정보를 반환하는 메서드
	 * @param jo_num
	 * @return Job_OfferVO 
	 * @throws Exception
	 * @since 2020-05-23
	 * @author JSM
	 */
	Job_OfferVO getJobOfferInfo(String jo_num) throws Exception;
	
	List<Job_OfferVO> jobOfferList(Map<String, String> params) throws Exception;
	
	/**
	 * 해당 구인 공고글 완료하는 메서드
	 * @param jo_num
	 * @throws Exception
	 * @author 이혜인
	 */
	void jobOfferFinish(String jo_num) throws Exception;
	
}