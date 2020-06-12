package kr.or.inair.admin.admin.dao;

import kr.or.inair.vo.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminDaoImpl implements IAdminDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public boolean getAdminInfo(AdminVO adminInfo) throws Exception {
		boolean result = false;
		AdminVO loginAdminInfo = (AdminVO) client.queryForObject("admin.getAdminInfo", adminInfo);
		
		if(loginAdminInfo != null){
			result = true;
		}else{
			result = false;
		}
		
		return result;
	}

	
}
