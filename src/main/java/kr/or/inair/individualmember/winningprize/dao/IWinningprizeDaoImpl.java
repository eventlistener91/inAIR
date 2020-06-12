package kr.or.inair.individualmember.winningprize.dao;
import java.util.List;

import kr.or.inair.vo.WinningPrizeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IWinningprizeDaoImpl implements IWinningprizeDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertWinningPrizeList(
			List<WinningPrizeVO> insertWinningPrizeList) throws Exception {
		for(WinningPrizeVO winningPrizeVo : insertWinningPrizeList){
			client.insert("winningPrize.insertWinningPrizeInfo", winningPrizeVo);
		}
	}

	@Override
	public void updateWinningPrizeList(
			List<WinningPrizeVO> updateWinningPrizeList) throws Exception {
		for(WinningPrizeVO winningPrizeVo : updateWinningPrizeList){
			client.insert("winningPrize.updateWinningPrizeInfo", winningPrizeVo);
		}
	}

	
}
