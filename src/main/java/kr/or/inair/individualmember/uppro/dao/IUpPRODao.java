package kr.or.inair.individualmember.uppro.dao;

import java.util.List;

import kr.or.inair.vo.UpProVO;

public interface IUpPRODao {

	/**
	 * 상위 업종 리스트를 반환하는 메서드 
	 * @return List<UpProVO>
	 * @throws Exception
	 * @author JSM
	 */
	List<UpProVO> getUpPROList() throws Exception;
}
