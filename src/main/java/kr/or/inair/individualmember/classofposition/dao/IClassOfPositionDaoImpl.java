package kr.or.inair.individualmember.classofposition.dao;
import java.util.List;

import kr.or.inair.vo.ClassOfPositionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IClassOfPositionDaoImpl implements IClassOfPositionDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<ClassOfPositionVO> getClassOfPositionList() throws Exception {
		return client.queryForList("classOfPosition.getClassOfPositionList");
	}

	
}
