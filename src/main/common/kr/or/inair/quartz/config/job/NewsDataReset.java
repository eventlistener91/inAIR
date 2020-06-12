package kr.or.inair.quartz.config.job;

import java.util.List;

import kr.or.inair.news.service.INewsService;
import kr.or.inair.newskeyword.service.INewsKeyWordService;
import kr.or.inair.utiles.NewsContentGenerator;
import kr.or.inair.utiles.NewsKeyWordGenerator;
import kr.or.inair.vo.NewsKeyWordVO;
import kr.or.inair.vo.NewsVO;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/*
 * 서버 실행후 매 1시 01분마다 새로운 뉴스키워드를 생성하여 데이터베이스에 등록
 */
public class NewsDataReset extends QuartzJobBean{

	@Autowired
	private INewsService newsService;
	@Autowired
	private NewsContentGenerator newsContentGenerator;
	@Autowired
	private INewsKeyWordService newsKeywordService;
	@Autowired
	private NewsKeyWordGenerator newsKeyWordGenerator;
	@Autowired
	private PlatformTransactionManager transactionManager;
//	@Autowired
//	private DataSourceTransactionManager dataSrouceTransactionManager;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		newsKeyWordReset();
		newsContentReset();
		
	}
	
	private void newsKeyWordReset(){
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
//		TransactionStatus status = dataSrouceTransactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			List<NewsKeyWordVO> newsKeyWordList = newsKeyWordGenerator.getNewsKeyWordList();
			newsKeywordService.insertNewsKeyWord(newsKeyWordList);
			transactionManager.commit(status);
		} catch (Exception e) {
			transactionManager.rollback(status);
		}
	}
	
	private void newsContentReset(){
//		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			List<NewsVO> newsList = newsContentGenerator.getNewsGenerator();
			newsService.insertNews(newsList);
			transactionManager.commit(status);
		} catch (Exception e) {
			transactionManager.rollback(status);
		}
	}
	
}
