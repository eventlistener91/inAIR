package kr.or.inair.zip.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ZipVO;

public interface IZipDao {
	
	/**
	 * 검색한 주소정보를 반환하는 메서드
	 * @param 검색할 내용
	 * @return 주소정보
	 * @author 우영래
	 * @since 2020-05-05
	 */
	List<ZipVO> getZipList(Map<String, String> params) throws Exception;
	
}