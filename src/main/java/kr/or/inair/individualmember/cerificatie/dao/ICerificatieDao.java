package kr.or.inair.individualmember.cerificatie.dao;

import java.util.List;

import kr.or.inair.vo.CerificatieVO;

public interface ICerificatieDao {

	/**
	 * 자격증 리스트를 insert하는 메서드 
	 * @param insertCerificatieList
	 */
	void insertCerificatieList(List<CerificatieVO> insertCerificatieList) throws Exception;

	/**
	 * 업데이트할 자격증 리스트를 매개변수로 전달받아 update하는 메서드 
	 * @param updateCerificatieList
	 * @throws Exception
	 */
	void updateCerificatieList(List<CerificatieVO> updateCerificatieList) throws Exception;
}
