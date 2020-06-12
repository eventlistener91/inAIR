package kr.or.inair.individualmember.individualmember.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.inair.vo.INDVDLMEMVO;

public interface IINDVDLMEMService {
	
	/**
	 * indvdlmemInfo를 이용한 원하는 회원 불러오는 매서드
	 * @date 2020-04-29
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public INDVDLMEMVO indvdlmemInfo(Map<String, String> params) throws Exception;
	
	/**
	 * INDVDLMEMVO를 id와 mail을 받아서 원하는 회원정보를 불러오는 매서드 
	 * @date 2020-05-01
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public INDVDLMEMVO searchid(Map<String, String> params) throws Exception;
	
	/**
	 * id와 email을 받아서 INDVDLMEMVO를 반환하는 매서드 
	 * @date 2020-05-02
	 * @author 한유경
	 * @param 
	 * @return
	 * @throws Exception
	 */
	public INDVDLMEMVO searchpass(Map<String, String> param) throws Exception;
	
	/**
	 * id와 임시패스워드를 받아서 update시켜주는 매서드
	 * @date 2020-05-02
	 * @author 한유경
	 * @param indvdlmemInfo
	 * @throws Exception
	 */
	public void updatePassword(Map<String, String> params) throws Exception;

	/**
	 * 소셜 로그인 연동하지 않은 개인회원 회원가입 메서드
	 * @param 회원정보
	 * @author 우영래
	 * @since 2020-05-07
	 */
	void insertIndvdlMember(INDVDLMEMVO indvdlMemInfo) throws Exception;
	
	/**
	 * 아이디나 이메일 중복검사 메서드
	 * @param 아이디나 이메일
	 * @return 존재하는 계정
	 * @author 우영래
	 * @since 2020-05-08
	 */
	INDVDLMEMVO duplCheck(Map<String, String> params)  throws Exception;
	
	/**
	 * 모든 회원들의 수를 반환하는 메서드
	 * @return 회원들의 수
	 * @author 우영래
	 * @since 2020-05-09
	 */
	int getIndvdlMemCount() throws Exception;
	
	/**
	 * 개인회원 정보수정 하는 메서드
	 * @param indvdlMemInfo 회원정보
	 * @author 이혜인
	 * @throws Exception
	 */
	public void updateIndvdlMember(INDVDLMEMVO indvdlMemInfo) throws Exception;
	
	/**
	 * 아이디나 이메일을 받아서 개인 회원 정보를 반환하는 메서드
	 * @param params 아이디나 이메일
	 * @return 개인회원 정보
	 * @author 이혜인
	 * @throws Exception
	 */
	public INDVDLMEMVO indvdlInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 개인 회원의 비밀번호 수정하는 메서드
	 * @param params 비밀번호
	 * @author 이혜인
	 * @throws Exception
	 */
	public void passwordChange(Map<String, String> params) throws Exception;
	
	/**
	 * 개인 회원 탈퇴 하는 메서드
	 * @param params 아이디, 탈퇴사유
	 * @throws Exception
	 * @author 이혜인
	 */
	public void deleteIndvdlMember(Map<String, String> params) throws Exception;

	/**
	 * 로그인한 회원의 아이디를 매개변수로 전달받아 로그인한 회원의 정보를 반환하는 메서드 
	 * @param indvdl_id
	 * @return INDVDLMEMVO
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-29
	 */
	INDVDLMEMVO getLoginINDVDLMEMInfo(String indvdl_id) throws Exception;
}