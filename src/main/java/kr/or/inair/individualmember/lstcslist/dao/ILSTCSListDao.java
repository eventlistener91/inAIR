package kr.or.inair.individualmember.lstcslist.dao;

import java.util.List;

import kr.or.inair.vo.LSTCS_ListVO;

public interface ILSTCSListDao {
	/**
	 * 어학 리스트를 insert하는 메서드 
	 * @param insertLstcsListList
	 * @throws Exception
	 */
	void insertLstcsListList(List<LSTCS_ListVO> insertLstcsListList) throws Exception;
	
	/**
	 * 어학 리스트를 update하는 메서드 
	 * @param updateLstcsListList
	 * @throws Exception
	 */
	void updateLstcsListList(List<LSTCS_ListVO> updateLstcsListList) throws Exception;
}
