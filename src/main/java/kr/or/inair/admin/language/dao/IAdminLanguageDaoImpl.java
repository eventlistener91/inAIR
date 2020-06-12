package kr.or.inair.admin.language.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.LanguageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminLanguageDaoImpl implements IAdminLanguageDao {
	@Autowired
	private SqlMapClient client;

//	@Override
//	public List<LanguageVO> adminLanguageList(Map<String, String> params) throws Exception {
//		return client.queryForList("language.adminLanguageList",params);
//	}
//
//	@Override
//	public String totalCount(Map<String, String> params) throws Exception {
//		return (String) client.queryForObject("language.totalCount", params);
//	}

}
