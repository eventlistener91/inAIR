package kr.or.inair.individualmember.winningprize.dao;

import java.util.List;

import kr.or.inair.vo.WinningPrizeVO;

public interface IWinningprizeDao {
	/**
	 * 수상내역 리스트를 insert 하는 메서드 
	 * @param insertWinningPrizeList
	 * @throws Exception
	 */
	void insertWinningPrizeList(List<WinningPrizeVO> insertWinningPrizeList) throws Exception;

	/**
	 * 수상내역 리스트를 update 하느 메서드 
	 * @param updateWinningPrizeList
	 * @throws Exception
	 */
	void updateWinningPrizeList(List<WinningPrizeVO> updateWinningPrizeList) throws Exception;
}
