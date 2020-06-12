package kr.or.inair.newskeyword.service;

import java.util.List;

import kr.or.inair.newskeyword.dao.INewsKeyWordDao;
import kr.or.inair.vo.NewsKeyWordVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class INewsKeyWordServiceImpl implements INewsKeyWordService {

	@Autowired
	private INewsKeyWordDao newsKeyWordDao;

	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
	@Override
	public List<NewsKeyWordVO> getNewsKeyWordList() throws Exception {
		return newsKeyWordDao.getNewsKeyWordList();
	}

	@Override
	public boolean insertNewsKeyWord(List<NewsKeyWordVO> newsKeyWordList)
			throws Exception {
		boolean result = false;

		Object obj = newsKeyWordDao.insertNewsKeyWord(newsKeyWordList);

		if (obj == null) {
			result = true;
		}

		return result;
	}
}
