package kr.or.inair.resboard.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ResboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRESBoardDaoImpl implements IRESBoardDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<ResboardVO> resboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("resboard.resboardList", params);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception{
		return (String) client.queryForObject("resboard.totalReboardCount", params);
	
	}

	@Override
	public ResboardVO resboardInfo(Map<String, String> params) throws Exception {
		ResboardVO resboardInfo = null;
		try {
			client.startTransaction();
			
			client.update("resboard.resboardHit", params);
			resboardInfo = (ResboardVO) client.queryForObject("resboard.resboardInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return resboardInfo;
	}

	@Override
	public void updateResboard(ResboardVO resboardInfo) throws Exception {
		client.update("resboard.updateResboard", resboardInfo);
		
	}

	@Override
	public void deleteResboard(Map<String, String> params) throws Exception {
		client.update("resboard.deleteResboard", params);
		
	}

	@Override
	public String insertResboardInfo(ResboardVO resboardInfo) throws Exception {
		return (String) client.insert("resboard.insertResboard", resboardInfo);
	}

	@Override
	public List<ResboardVO> resCommentList(Map<String, String> params)
			throws Exception {
		return client.queryForList("resboard.resboardComment", params);
	}

	@Override
	public void insertResboardReply(ResboardVO resboardInfo) throws Exception {
		try {
			client.startTransaction();
			
			String res_sn;
			if("0".intern() == resboardInfo.getRes_sn().intern()){
				res_sn = (String) client.queryForObject("resboard.incrementSEQ", resboardInfo);
			}else{
				client.update("resboard.updateSEQ", resboardInfo);
				res_sn =String.valueOf(Integer.parseInt(resboardInfo.getRes_sn())+1);
			}
			resboardInfo.setRes_sn(res_sn);
			
			String res_depth = String.valueOf(Integer.parseInt(resboardInfo.getRes_depth())+1);
			resboardInfo.setRes_depth(res_depth);
			
			client.insert("resboard.insertResboardReply", resboardInfo);
			client.commitTransaction();

		} finally {
			client.endTransaction();
			
		}
	}

	@Override
	public void updateCommentResboard(ResboardVO resboardInfo) throws Exception {
		client.update("resboard.updateComment", resboardInfo);
		
	}

}
