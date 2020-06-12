package kr.or.inair.individualmember.jobofferfile.dao;
import java.util.List;

import kr.or.inair.vo.Job_Offer_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IJobOfferFileDaoImpl implements IJobOfferFileDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertJobOfferFileList(
			List<Job_Offer_FileVO> insertJobOfferFileList) throws Exception {
		for(Job_Offer_FileVO insertJobOfferFileVo : insertJobOfferFileList){
			client.insert("jobOfferFile.insertJobOfferFile", insertJobOfferFileVo);
		}
	}

	@Override
	public List<Job_Offer_FileVO> getJobOfferFileList(String jo_num)
			throws Exception {
		return client.queryForList("jobOfferFile.getJobOfferFileList", jo_num);
	}

}