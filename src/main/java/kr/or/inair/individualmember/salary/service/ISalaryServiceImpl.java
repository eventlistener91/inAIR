package kr.or.inair.individualmember.salary.service;
import java.util.List;

import kr.or.inair.individualmember.salary.dao.ISalaryDao;
import kr.or.inair.vo.SalaryVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ISalaryServiceImpl implements ISalaryService {
	@Autowired
	private ISalaryDao salaryDao;

	@Override
	public List<SalaryVO> getSalaryList() throws Exception{
		return salaryDao.getSalaryList();
	}

}
