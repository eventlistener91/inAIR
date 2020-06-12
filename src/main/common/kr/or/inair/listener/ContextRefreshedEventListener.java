package kr.or.inair.listener;

import java.util.List;

import kr.or.inair.news.service.INewsService;
import kr.or.inair.newskeyword.service.INewsKeyWordService;
import kr.or.inair.utiles.NewsContentGenerator;
import kr.or.inair.utiles.NewsKeyWordGenerator;
import kr.or.inair.vo.NewsKeyWordVO;
import kr.or.inair.vo.NewsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/*
 * 서버가 실행될때 데이터베이스에 접속하여 오늘날짜의 키워드가 존재하는지 검사후 존재하지 않는다면 새로운 키워드를 생성해서 데이터베이스에 등록
 */
@Component
public class ContextRefreshedEventListener implements ApplicationListener<ContextRefreshedEvent>{

	@Autowired
	private INewsKeyWordService newsKeyWordService;
	@Autowired
	private INewsService newsService;
	@Autowired
	private NewsKeyWordGenerator newsKeyWordGenerator;
	@Autowired
	private NewsContentGenerator newsContentGenerator;
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Transactional
	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0){
		
		try {
			List<NewsKeyWordVO> list = newsKeyWordService.getNewsKeyWordList();
			
			if(list.size() == 0){
				registNewsKeyWord(list);
				registNews();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private List<NewsKeyWordVO> registNewsKeyWord(List<NewsKeyWordVO> list) {
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		List<NewsKeyWordVO> newsKeyWordList = null;
		try {
			
			newsKeyWordList = newsKeyWordGenerator.getNewsKeyWordList();
			boolean result = newsKeyWordService.insertNewsKeyWord(newsKeyWordList);
			
			if(result == false){
				transactionManager.rollback(status);
				throw new Exception("뉴스 키워드를 데이터베이스에 저장하는 동안 에러를 발생시켰습니다.");
			}
			
			transactionManager.commit(status);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsKeyWordList;
	}

	private void registNews() {
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		try {
			
			List<NewsVO> newsList = newsContentGenerator.getNewsGenerator();
			boolean result = newsService.insertNews(newsList);
			
			if(result == false){
				transactionManager.rollback(status);
				throw new Exception("뉴스를 데이터베이스에 저장하는 동안 에러를 발생시켰습니다.");
			}
			
			transactionManager.commit(status);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
