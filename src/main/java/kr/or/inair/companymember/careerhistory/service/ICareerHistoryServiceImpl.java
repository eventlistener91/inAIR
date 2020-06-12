package kr.or.inair.companymember.careerhistory.service;

import java.util.List;

import kr.or.inair.companymember.careerhistory.dao.ICareerHistoryDao;
import kr.or.inair.vo.CareerHistoryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ICareerHistoryServiceImpl implements ICareerHistoryService {
	@Autowired
	private ICareerHistoryDao careerHistoryDao;

	@Override
	public List<CareerHistoryVO> getcareerHistoryList() throws Exception {
		return careerHistoryDao.getcareerHistoryList();
	}
}
