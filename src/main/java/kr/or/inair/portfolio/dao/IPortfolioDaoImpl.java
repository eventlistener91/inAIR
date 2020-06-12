package kr.or.inair.portfolio.dao;
import java.util.List;

import kr.or.inair.vo.PortfolioVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IPortfolioDaoImpl implements IPortfolioDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void inserPortfolioList(List<PortfolioVO> inserPortfolioList)
			throws Exception {
		for(PortfolioVO portfolioVo : inserPortfolioList){
			client.insert("portfolio.inserPortfolioInfo", portfolioVo);
		}
	}

	@Override
	public void updatePortfolioList(List<PortfolioVO> updatePortfolioList)
			throws Exception {
		for(PortfolioVO portfolioVo : updatePortfolioList){
			if((portfolioVo.getPort_num() != null) && (!portfolioVo.getPort_num().equals(""))){
				client.update("portfolio.updatePortfolioInfo", portfolioVo);
			}else{
				client.insert("portfolio.inserPortfolioInfo", portfolioVo);
			}
		}
	}

	
}
