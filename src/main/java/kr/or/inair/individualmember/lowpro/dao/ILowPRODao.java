package kr.or.inair.individualmember.lowpro.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.LowProVO;

public interface ILowPRODao {
	/**
	 * 상위 직종 번호를 입력받아 이에 해당하는 하위 직종 리스트를 반환하는 메서드 
	 * @param params (상위직종번호)
	 * @return List<LowProVO>
	 * @throws Exception
	 * @author JSM
	 */
	List<LowProVO> getLowPROList(Map<String, String>params) throws Exception;
	
	/**
	 * 하위 직종 리스트를 반환하는 메서드
	 * @return 하위 직종 리스트
	 * @throws Exception
	 * @author 이혜인
	 */
	List<LowProVO> getLowProfession() throws Exception;
}
