package kr.or.inair.individualmember.joboffersubmit.service;
import java.util.List;
import java.util.Map;

import kr.or.inair.individualmember.joboffersubmit.dao.IJOSubmitDao;
import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IJOSubmitServiceImpl implements IJOSubmitService {
	@Autowired
	private IJOSubmitDao joSubmitDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertJoSubmit(Map<String, String> params) throws Exception {
		joSubmitDao.insertJoSubmit(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Jo_SubmitVO> getjoSubmitList(String jo_num) throws Exception {
		return joSubmitDao.getjoSubmitList(jo_num);
	}

	@Override
	public int getjoSubmitListCount(Map<String, String> params)
			throws Exception {
		return joSubmitDao.getjoSubmitListCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<Jo_SubmitVO> joSubmitList(String indvdl_id) throws Exception {
		return joSubmitDao.joSubmitList(indvdl_id);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public JoSubmitChartsVO getJoSubmitCharts(String jo_num) throws Exception {
		return joSubmitDao.getJoSubmitCharts(jo_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public JoSubmitChartsVO getJoSubmitSalaryCharts(String jo_num)
			throws Exception {
		return joSubmitDao.getJoSubmitSalaryCharts(jo_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void finalPassIndvdlMem(String submit_num) throws Exception {
		joSubmitDao.finalPassIndvdlMem(submit_num);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void finalFailIndvdlMem(String submit_num) throws Exception {
		joSubmitDao.finalFailIndvdlMem(submit_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void aiPassIndvdlMem(String submit_num) throws Exception {
		joSubmitDao.aiPassIndvdlMem(submit_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void aiFailIndvdlMem(String submit_num) throws Exception {
		joSubmitDao.aiFailIndvdlMem(submit_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public JoSubmitChartsVO getJoSubmitFinalAcademicCharts(String jo_num)
			throws Exception {
		return joSubmitDao.getJoSubmitFinalAcademicCharts(jo_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public JoSubmitChartsVO getJoSubmitAgeCharts(String jo_num)
			throws Exception {
		return joSubmitDao.getJoSubmitAgeCharts(jo_num);
	}
	
}