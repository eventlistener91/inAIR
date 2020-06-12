package kr.or.inair.admin.adminchart.dao;

import kr.or.inair.vo.AdminChartVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.ResumeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAdminChartDaoImpl implements IAdminChartDao {

	@Autowired
	private SqlMapClient client;

	@Override
	public AdminChartVO genderChart() throws Exception {
		return  (AdminChartVO) client.queryForObject("indvdlmem.genderChart");
	}

	@Override
	public AdminChartVO ageIndvdlChart() throws Exception {
		return (AdminChartVO)client.queryForObject("indvdlmem.ageIndvdlChart");
	}

	@Override
	public ResumeVO workIndvdlChart() throws Exception {
		return (ResumeVO) client.queryForObject("indvdlmem.workChart");
	}

	@Override
	public AdminChartVO IndvdlDropChart() throws Exception {
		
		return (AdminChartVO) client.queryForObject("indvdlmem.IndvdlDrop");
	}

	@Override
	public AdminChartVO FinAcadmcr() throws Exception {
		// TODO Auto-generated method stub
		return (AdminChartVO) client.queryForObject("indvdlmem.finAcdmcr");
	}

	@Override
	public AdminChartVO AdminBoard() throws Exception {
	
		return (AdminChartVO) client.queryForObject("indvdlmem.adminBoardChart");
	}
}
