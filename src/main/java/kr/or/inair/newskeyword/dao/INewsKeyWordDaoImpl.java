package kr.or.inair.newskeyword.dao;

import java.util.List;

import kr.or.inair.vo.NewsKeyWordVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class INewsKeyWordDaoImpl implements INewsKeyWordDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public List<NewsKeyWordVO> getNewsKeyWordList() throws Exception {
		return client.queryForList("newsKeyWord.getNewsKeyWordList");
	}

	@Override
	public Object insertNewsKeyWord(List<NewsKeyWordVO> newsKeyWordList) throws Exception {
		Object obj = null;

		for (int i = 0; i < newsKeyWordList.size(); i++) {
			String keyword_cn = newsKeyWordList.get(i).getKeyword_cn();
			obj = client.insert("newsKeyWord.insertNewsKeyWord", keyword_cn);
			
			if(obj != null){
				return obj;
			}
			
		}

		return obj;
	}
}
