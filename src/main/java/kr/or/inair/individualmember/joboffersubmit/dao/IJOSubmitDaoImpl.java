package kr.or.inair.individualmember.joboffersubmit.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IJOSubmitDaoImpl implements IJOSubmitDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertJoSubmit(Map<String, String> params) throws Exception {
		client.insert("joSubmit.insertJoSubmit", params);
	}

	@Override
	public List<Jo_SubmitVO> getjoSubmitList(String jo_num) throws Exception {
		return client.queryForList("joSubmit.getjoSubmitList", jo_num);
	}

	@Override
	public int getjoSubmitListCount(Map<String, String> params)
			throws Exception {
		return (int)client.queryForObject("joSubmit.getjoSubmitListCount", params);
	}

	@Override
	public List<Jo_SubmitVO> joSubmitList(String indvdl_id) throws Exception {
		return client.queryForList("joSubmit.selectJoSubmitList", indvdl_id);
	}

	@Override
	public JoSubmitChartsVO getJoSubmitCharts(String jo_num) throws Exception {
		return (JoSubmitChartsVO) client.queryForObject("joSubmit.getJoSubmitCharts", jo_num);
	}

	@Override
	public JoSubmitChartsVO getJoSubmitSalaryCharts(String jo_num)
			throws Exception {
		return (JoSubmitChartsVO) client.queryForObject("joSubmit.getJoSubmitSalaryCharts", jo_num);
	}

	@Override
	public void finalPassIndvdlMem(String submit_num) throws Exception {
		client.update("joSubmit.finalPassIndvdlMem", submit_num);
	}
	
	@Override
	public void finalFailIndvdlMem(String submit_num) throws Exception {
		client.update("joSubmit.finalFailIndvdlMem", submit_num);
	}

	@Override
	public void aiPassIndvdlMem(String submit_num) throws Exception {
		client.update("joSubmit.aiPassIndvdlMem", submit_num);
	}

	@Override
	public void aiFailIndvdlMem(String submit_num) throws Exception {
		client.update("joSubmit.aiFailIndvdlMem", submit_num);
	}

	@Override
	public JoSubmitChartsVO getJoSubmitFinalAcademicCharts(String jo_num)
			throws Exception {
		return (JoSubmitChartsVO) client.queryForObject("joSubmit.getJoSubmitFinalAcademicCharts", jo_num);
	}

	@Override
	public JoSubmitChartsVO getJoSubmitAgeCharts(String jo_num)
			throws Exception {
		return (JoSubmitChartsVO) client.queryForObject("joSubmit.getJoSubmitAgeCharts", jo_num);
	}

	
}