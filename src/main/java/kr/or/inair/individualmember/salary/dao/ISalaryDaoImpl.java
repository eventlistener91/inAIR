package kr.or.inair.individualmember.salary.dao;
import java.util.List;

import kr.or.inair.vo.SalaryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISalaryDaoImpl implements ISalaryDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<SalaryVO> getSalaryList() throws Exception{
		return client.queryForList("salary.getSalaryList");
	}

	
}
