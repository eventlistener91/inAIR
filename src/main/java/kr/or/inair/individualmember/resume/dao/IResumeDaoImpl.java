package kr.or.inair.individualmember.resume.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ResumeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IResumeDaoImpl implements IResumeDao {
	@Autowired
	private SqlMapClient client;

	/**
	 * 접속한 회원의 이력서 리스트를 반환하는 메서드 
	 * @param indvdl_id
	 * @return 파라미터로 전달받은 회원의 아이디로 작성된 이력서 리스트 
	 * @author JSM
	 */
	public List<ResumeVO> getResumeList(String indvdl_id) throws Exception{
		return client.queryForList("resume.getResumeList", indvdl_id);
	}

	@Override
	public String insertResume(ResumeVO insertResumeInfo) throws Exception {
		return (String) client.insert("resume.insertResume", insertResumeInfo);
	}

	@Override
	public ResumeVO getResumeInfo(String resume_num) throws Exception {
		return (ResumeVO) client.queryForObject("resume.getResumeInfo", resume_num);
	}

	@Override
	public void deleteResume(String resume_num) throws Exception {
		client.update("resume.deleteResume", resume_num);
	}

	@Override
	public List<ResumeVO> getResumeInfoList(Map<String, String> params) throws Exception {
		return client.queryForList("resume.getResumeInfoList", params);
	}

	@Override
	public void updateResumeInfo(ResumeVO updateResumeVo) throws Exception {
		client.update("resume.updateResumeInfo", updateResumeVo);
	}

	@Override
	public List<ResumeVO> resumeList(Map<String, String> params)
			throws Exception {
		return client.queryForList("resume.resumeNewsList", params);
	}
	
}