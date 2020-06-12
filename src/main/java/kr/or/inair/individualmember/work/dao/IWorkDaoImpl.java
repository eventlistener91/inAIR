package kr.or.inair.individualmember.work.dao;
import java.util.List;

import kr.or.inair.vo.WorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IWorkDaoImpl implements IWorkDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<WorkVO> getWorkList() throws Exception {
		return client.queryForList("work.getWorkList");
	}

	
}
