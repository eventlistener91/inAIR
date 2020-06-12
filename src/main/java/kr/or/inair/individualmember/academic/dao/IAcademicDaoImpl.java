package kr.or.inair.individualmember.academic.dao;
import java.util.List;

import kr.or.inair.vo.AcademicVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAcademicDaoImpl implements IAcademicDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<AcademicVO> getAcademicList() throws Exception {
		return client.queryForList("academic.getAcademicList");
	}

	
}
