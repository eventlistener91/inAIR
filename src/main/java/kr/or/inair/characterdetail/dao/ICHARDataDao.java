package kr.or.inair.characterdetail.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_DETAVO;

public interface ICHARDataDao {
	
	/**
	 * 각 인성요소의 정보를 가져오는 메서드
	 * @param params char_element_num 인성요소 번호
	 * @return 해당하는 인성요소의 설명
	 * @author 이혜인
	 * @throws Exception
	 */
	public CHAR_DETAVO charDetailInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 인성요소 세부사항 정보를 가져오는 메서드
	 * @return 인성요소 세부사항
	 * @author 이혜인
	 * @throws Exception
	 */
	public List<CHAR_DETAVO> getCharDetaList() throws Exception;

}
