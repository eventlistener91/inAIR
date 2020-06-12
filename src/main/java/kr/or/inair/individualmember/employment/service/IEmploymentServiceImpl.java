package kr.or.inair.individualmember.employment.service;
import java.util.List;

import kr.or.inair.individualmember.employment.dao.IEmploymentDao;
import kr.or.inair.vo.EmploymentVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IEmploymentServiceImpl implements IEmploymentService {
	@Autowired
	private IEmploymentDao employmentDao;

	@Override
	public List<EmploymentVO> getEmploymentList() throws Exception {
		return employmentDao.getEmploymentList();
	}

	
}
