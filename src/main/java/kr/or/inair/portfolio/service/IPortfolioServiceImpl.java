package kr.or.inair.portfolio.service;
import java.util.List;

import kr.or.inair.portfolio.dao.IPortfolioDao;
import kr.or.inair.vo.PortfolioVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IPortfolioServiceImpl implements IPortfolioService {
	@Autowired
	private IPortfolioDao portfolioDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void inserPortfolioList(List<PortfolioVO> inserPortfolioList)
			throws Exception {
		portfolioDao.inserPortfolioList(inserPortfolioList);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updatePortfolioList(List<PortfolioVO> updatePortfolioList)
			throws Exception {
		portfolioDao.updatePortfolioList(updatePortfolioList);
	}

	
}
