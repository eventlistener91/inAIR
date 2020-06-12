package kr.or.inair.individualmember.jobofferfile.service;

import java.util.List;

import kr.or.inair.vo.Job_Offer_FileVO;

public interface IJobOfferFileService {

	/**
	 * 구인글 첨부파일 리스트를 전달받아 insert하는 메서드 
	 * @param insertJobOfferFileList
	 * @throws Exception
	 * @since 2020-05-20
	 * @author JSM
	 */
	void insertJobOfferFileList(List<Job_Offer_FileVO> insertJobOfferFileList) throws Exception;
	
	/**
	 * 구인게시글 번호를 매개변수로 전달받아 첨부파일 리스트를 반한화는 메서드 
	 * @param jo_num
	 * @return Job_Offer_FileVO
	 * @throws Exception
	 */
	List<Job_Offer_FileVO> getJobOfferFileList(String jo_num) throws Exception;
}
