package kr.or.inair.individualmember.joboffer.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Job_OfferVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IJobOfferDaoImpl implements IJobOfferDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public int getJobListCount() throws Exception {
		return (int) client.queryForObject("jobOffer.getJobListCount");
	}

	@Override
	public String insertjobOffer(Job_OfferVO insertJobOffer) throws Exception {
		return (String)client.insert("jobOffer.insertjobOffer", insertJobOffer);
	}

	@Override
	public List<Job_OfferVO> getJobOfferList(Map<String, String> params) throws Exception {
		return client.queryForList("jobOffer.getJobOfferList", params);
	}

	@Override
	public void deleteJobOffer(String jo_num) throws Exception {
		client.update("jobOffer.deleteJobOffer", jo_num);
	}

	@Override
	public List<Job_OfferVO> getAllJobOffer(Map<String, String> params)
			throws Exception {
		return client.queryForList("jobOffer.getAllJobOffer", params);
	}

	@Override
	public Job_OfferVO getJobOfferInfo(String jo_num) throws Exception {
		return (Job_OfferVO)client.queryForObject("jobOffer.getJobOfferInfo", jo_num);
	}

	@Override
	public List<Job_OfferVO> jobOfferList(Map<String, String> params) throws Exception {
		return client.queryForList("jobOffer.jobOfferList", params);
	}

	@Override
	public void jobOfferFinish(String jo_num) throws Exception {
		client.update("jobOffer.jobOfferFinish", jo_num);
	}

}
