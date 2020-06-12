package kr.or.inair.individualmember.employment.dao;
import java.util.List;

import kr.or.inair.vo.EmploymentVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IEmploymentDaoImpl implements IEmploymentDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<EmploymentVO> getEmploymentList() throws Exception {
		return client.queryForList("employment.getEmploymentList");
	}

	
}
