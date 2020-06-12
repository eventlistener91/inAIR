package kr.or.inair.news.service;

import java.util.List;

import kr.or.inair.news.dao.INewsDao;
import kr.or.inair.vo.NewsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class INewsServiceImpl implements INewsService{
	
	@Autowired
	private INewsDao newsDao;

	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
	@Override
	public List<NewsVO> getNewsList(String clickKeyWord) throws Exception {
		return newsDao.getNewsList(clickKeyWord);
	}
	
	@Override
	public boolean insertNews(List<NewsVO> newsList) throws Exception {
		boolean result = false;
		
		Object obj = newsDao.insertNews(newsList);
		
		if(obj == null){
			result = true;
		}
		
		return result;
	}
}
