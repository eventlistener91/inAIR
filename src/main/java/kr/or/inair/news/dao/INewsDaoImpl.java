package kr.or.inair.news.dao;

import java.util.List;

import kr.or.inair.vo.NewsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class INewsDaoImpl implements INewsDao{
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<NewsVO> getNewsList(String clickKeyWord) throws Exception {
		return client.queryForList("news.getNewsList", clickKeyWord);
	}

	@Override
	public Object insertNews(List<NewsVO> newsList) throws Exception {
		Object obj = null;
		
		for(int i = 0; i < newsList.size(); i++){
			obj = client.insert("news.insertNews", newsList.get(i));
			
			if(obj != null){
				return obj;
			}
			
		}
		return obj;
	}

}
