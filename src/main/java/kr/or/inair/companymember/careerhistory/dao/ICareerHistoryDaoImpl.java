package kr.or.inair.companymember.careerhistory.dao;

import java.util.List;

import kr.or.inair.vo.CareerHistoryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICareerHistoryDaoImpl implements ICareerHistoryDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<CareerHistoryVO> getcareerHistoryList() throws Exception {
		return client.queryForList("careerHistory.getcareerHistoryList");
	}
}
