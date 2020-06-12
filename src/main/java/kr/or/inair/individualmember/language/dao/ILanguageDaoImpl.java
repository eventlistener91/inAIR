package kr.or.inair.individualmember.language.dao;
import java.util.List;

import kr.or.inair.vo.LanguageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ILanguageDaoImpl implements ILanguageDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<LanguageVO> getLanguageList() throws Exception {
		return client.queryForList("language.getLanguageList");
	}

	
}
