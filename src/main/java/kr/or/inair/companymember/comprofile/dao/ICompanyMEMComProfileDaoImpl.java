package kr.or.inair.companymember.comprofile.dao;
import kr.or.inair.vo.COM_ProfileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICompanyMEMComProfileDaoImpl implements ICompanyMEMComProfileDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public COM_ProfileVO getComProfileInfo(String com_id) throws Exception {
		return (COM_ProfileVO)client.queryForObject("comProfile.getComProfileInfo", com_id);
	}

	@Override
	public void insertComProfileInfo(COM_ProfileVO comProfileInfo)
			throws Exception {
		client.insert("comProfile.insertComProfileInfo", comProfileInfo);
	}

	@Override
	public void updateComProfileInfo(COM_ProfileVO comProfileInfo)
			throws Exception {
		client.update("comProfile.updateComProfileInfo", comProfileInfo);
	}

	
}
