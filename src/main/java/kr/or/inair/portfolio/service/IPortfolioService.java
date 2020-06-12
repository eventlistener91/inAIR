package kr.or.inair.portfolio.service;

import java.util.List;

import kr.or.inair.vo.PortfolioVO;

public interface IPortfolioService {
	/**
	 * 포트폴리오 inset하는 메서드 
	 * @param inserPortfolioList
	 * @throws Exception
	 */
	void inserPortfolioList(List<PortfolioVO> inserPortfolioList) throws Exception;
	
	/**
	 * 포트폴리오 update하는 메서드 
	 * @param updatePortfolioList
	 * @throws Exception
	 */
	void updatePortfolioList(List<PortfolioVO> updatePortfolioList) throws Exception;
}
