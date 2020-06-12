package kr.or.inair.admin.adminchart.service;

import kr.or.inair.admin.adminchart.dao.IAdminChartDao;
import kr.or.inair.vo.AdminChartVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.ResumeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IAdminChartServiceImpl implements IAdminChartService {
	@Autowired
	private IAdminChartDao adminChartDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public AdminChartVO genderChart() throws Exception {

		return adminChartDao.genderChart();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public AdminChartVO ageIndvdlChart() throws Exception {
		return adminChartDao.ageIndvdlChart();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public ResumeVO workIndvdlChart() throws Exception {
		
		return adminChartDao.workIndvdlChart();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public AdminChartVO IndvdlDropChart() throws Exception {
		
		return adminChartDao.IndvdlDropChart();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public AdminChartVO FinAcadmcr() throws Exception {
		
		return adminChartDao.FinAcadmcr();
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public AdminChartVO AdminBoard() throws Exception {
		return adminChartDao.AdminBoard();
	}
	
}
