package kr.or.inair.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.NoticeVO;

public interface INoticeService {
	/**
	 * params받아서 list를 반환하는 매서드
	 * @date 2020-05-11
	 * @author 한유경
	 * @param params
	 * @return startCount와 endCount를 params로 받아서 list로 반환
	 * @throws Exception
	 */
	public List<NoticeVO> noticeList(Map<String, String> params) throws Exception;
	/**
	 * 검색할 키워드를 params로 받아서 해당하는 게시글 갯수를 반환하는 매서드 
	 * @date 2020-05-11
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 totalCount를 반환
	 * @throws Exception
	 */
	public String totalCount(Map<String, String> params) throws Exception;
	/**
	 * params를 받아서 개인회원에 해당하는 공지게시물을 반환하는매서드
	 * @date 2020-05-12
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 list를 반환
	 * @throws Exception
	 */
	public List<NoticeVO> indvdlNoticeList(Map<String, String> params) throws Exception;
	/**
	 * params받아서 해당하는 게시글 갯수를 반환하는 매서드
	 * @date 2020-05-12
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 indvdlCount를 반환
	 * @throws Exception
	 */
	public String indvdlCount(Map<String, String> params) throws Exception;
	/**
	 * 회사 공지사항 리스트 출력
	 * @date 2020-05-12
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 회사 공지사항에 해당하는 리스트를 반화
	 * @throws Exception
	 */
	public List<NoticeVO> COMNoticeList(Map<String, String> params) throws Exception;
	/**
	 * 회사 공지사항 갯수를 출력 
	 * @date 2020-05-12
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 회사 공지사항 갯수를 반환
	 * @throws Exception
	 */
	public String COMNoticeCount(Map<String, String> params) throws Exception;
	/**
	 * 공지사항 notice_num을 params로 받아서 해당하는 noticeVO를 반환하는 매서드 
	 * @date 2020-05-13
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 해당하는 noticeVo를 반환
	 * @throws Exception
	 */
	public NoticeVO noticeInfo(Map<String, String> params) throws Exception;
	/**
	 * params를 받아서 관리자 공지사항 전체 리스트를 출력하는 매서드 
	 * @date 2020-05-18
	 * @author 한유경
	 * @param params
	 * @return params를 받아서 list를 반환
	 * @throws Exception
	 */
	public List<NoticeVO> noticeboardList(Map<String, String> params) throws Exception;
	/**
	 * params를 받아서 공지사항 전체리스트 갯수를 출력하는 매서드 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String totalNoticeCount(Map<String, String> params) throws Exception;
	/**
	 * vo를 받아서 데이터 베이스에 추가시키는 매서드 
	 * @date 2020-05-19
	 * @author 한유경 
	 * @param noticeboardInfo
	 * @throws Exception
	 */
	public void insertNoticeInfo(NoticeVO noticeboardInfo) throws Exception;
	/**
	 * vo를 받아서 update시키는 매서드 
	 * @date 2020-05-19
	 * @author 한유경
	 * @param noticeboardInfo
	 * @throws Exception
	 */
	public void updateNoticeInfo(NoticeVO noticeboardInfo) throws Exception;
	/**
	 * params로 notice_num을 받아서 삭제시키는 매서드 
	 * @date 2020-05-19
	 * @author 한유경 
	 * @param params
	 * @throws Exception
	 */
	public void deleteNotice(Map<String, String> params) throws Exception;
}
