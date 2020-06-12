package kr.or.inair.individualmember.resume.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ResumeVO;

public interface IResumeService {
	
	/**
	 * 접속한 회원의 이력서 리스트를 반환하는 메서드 
	 * @param indvdl_id
	 * @return 파라미터로 전달받은 회원의 아이디로 작성된 이력서 리스트 
	 * @author JSM
	 */
	List<ResumeVO> getResumeList(String indvdl_id) throws Exception;

	/**
	 * 이력서, 세부학력, 경력, 자격증, 수상내역, 어학내역, 자기소개서, 포트폴리오를 insert 하는 메서드 
	 * @throws Exception
	 */
	String insertResume(ResumeVO insertResumeInfo) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 전달받아 이력서 정보를 반환하는 메서드 
	 * @param resume_num
	 * @return
	 * @throws Exception
	 */
	ResumeVO getResumeInfo(String resume_num) throws Exception;
	
	/**
	 * 이력서 삭제하는 메서드
	 * @param resume_num
	 * @throws Exception
	 */
	void deleteResume(String resume_num) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 전달받아 이력서 정보를 반환하는 메서드 
	 * @param indvdl_id
	 * @return
	 * @throws Exception
	 */
	List<ResumeVO> getResumeInfoList(Map<String, String> params) throws Exception;
	
	/**
	 * 이력서 정보를 매개변수로 전달받아 업데이트 하는 메서드 
	 * @param updateResumeVo
	 * @throws Exception
	 */
	void updateResumeInfo(ResumeVO updateResumeVo) throws Exception;

	/**
	 * 검색 또는 전체 이력서 리스트 반환하는 메서드 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	List<ResumeVO> resumeList(Map<String, String> params) throws Exception;
}