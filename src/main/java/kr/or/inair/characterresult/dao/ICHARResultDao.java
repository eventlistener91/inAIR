package kr.or.inair.characterresult.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_ResultVO;

public interface ICHARResultDao {

	/**
	 * 인성검사 결과를 조회하는 메서드
	 * @param parmas char_num 인성검사 번호
	 * @return char_num에 해당하는 인성검사 결과를 가져온다
	 * @author 이혜인
	 * @throws Exception
	 */
	public List<CHAR_ResultVO> selectCharResult(Map<String, String> parmas) throws Exception;
	
	/**
	 * 인성검사를 다 수행한 후, 결과 테이블에 insert하는 메서드
	 * @param params indvdl_id, 각 인성 요소의 char_detail_lev, char_score
	 * @author 이혜인
	 * @throws Exception
	 */
	public void insertCharResult(Map<String, String> params) throws Exception;
	
	/**
	 * 각 인성 요소의 평균값을 구하는 메서드
	 * @return 인성 요소 평균
	 * @author 이혜인
	 * @throws Exception
	 */
	public List<CHAR_ResultVO> charScoreChart() throws Exception; 
}
