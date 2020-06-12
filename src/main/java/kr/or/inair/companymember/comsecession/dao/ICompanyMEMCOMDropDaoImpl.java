package kr.or.inair.companymember.comsecession.dao;
import java.util.List;

import kr.or.inair.vo.COM_DropVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMCOMDropDaoImpl implements ICompanyMEMCOMDropDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<COM_DropVO> getDropOutList() throws Exception {
		return client.queryForList("comDrop.getDropOutList");
	}

	
}