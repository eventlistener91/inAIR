package kr.or.inair.selfintroduction.dao;
import java.util.List;

import kr.or.inair.vo.SelfIntroductionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISelfIntroductionDaoImpl implements ISelfIntroductionDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertSelfIntroductionList(
			List<SelfIntroductionVO> insertSelfIntroductionList)
			throws Exception {
		for(SelfIntroductionVO selfIntroductionVo : insertSelfIntroductionList){
			client.insert("selfIntroduction.insertSelfIntroductionInfo", selfIntroductionVo);
		}
	}

	@Override
	public void updateSelfIntroductionList(
			List<SelfIntroductionVO> updateSelfIntroductionList)
			throws Exception {
		for(SelfIntroductionVO selfIntroductionVo : updateSelfIntroductionList){
			client.insert("selfIntroduction.updateSelfIntroductionInfo", selfIntroductionVo);
		}
	}
	

}
