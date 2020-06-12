package kr.or.inair.individualmember.finalacademic.dao;
import java.util.List;

import kr.or.inair.vo.Final_AcademicVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IFinalAcademicDaoImpl implements IFinalAcademicDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<Final_AcademicVO> getFinalAcademicList() throws Exception {
		return client.queryForList("finalAcademic.getFinalAcademeicList");
	}

	@Override
	public List<Final_AcademicVO> getJobOfferFinalAcademicList()
			throws Exception {
		return client.queryForList("finalAcademic.getJobOfferFinalAcademicList");
	}
	
}
