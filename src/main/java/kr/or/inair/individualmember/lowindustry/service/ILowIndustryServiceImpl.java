package kr.or.inair.individualmember.lowindustry.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.individualmember.lowindustry.dao.ILowIndustryDao;
import kr.or.inair.vo.LowIndustryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ILowIndustryServiceImpl implements ILowIndustryService {
	@Autowired
	private ILowIndustryDao lowIndustryDao;

	@Override
	public List<LowIndustryVO> getLowIndustryList(Map<String, String> params)
			throws Exception {
		return lowIndustryDao.getLowIndustryList(params);
	}

	@Override
	public LowIndustryVO getIndustryInfo(String lwinduty_num) throws Exception {
		return lowIndustryDao.getIndustryInfo(lwinduty_num);
	}

	@Override
	public List<LowIndustryVO> getLowIndustry() throws Exception {
		return lowIndustryDao.getLowIndustry();
	}
	
}
