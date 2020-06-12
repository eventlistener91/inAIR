package kr.or.inair.freeboard.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.FreeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IFreeBoardDaoImpl implements IFreeBoardDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception {
		return client.queryForList("freeboard.freeboardlist", params);
	}
	
	@Override
	public List<FreeboardVO> freeboardComment(Map<String, String> commentparams) throws Exception {
		
		return client.queryForList("freeboard.freeboardcomment", commentparams);
	}


	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return (String) client.queryForObject("freeboard.totalCount", params);
	}

	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
		FreeboardVO freeboardInfo = null;
		try {
			client.startTransaction();
			
			client.update("freeboard.updateHIT", params);
			freeboardInfo = (FreeboardVO) client.queryForObject("freeboard.freeboardInfo", params);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return freeboardInfo;
	}

	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws Exception {
		client.update("freeboard.updateFreeboard", freeboardInfo);
		
	}
	
	@Override
	public void updateComment(FreeboardVO freeboardInfo) throws Exception {
		client.update("freeboard.updateComment", freeboardInfo);
		
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params) throws Exception {
		client.update("freeboard.deleteFreeboard", params);
		
	}

	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo) throws Exception {
		return (String) client.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public void insertFreeboardReply(FreeboardVO freeboardInfo) throws Exception {
		try {
			client.startTransaction();
			
			String freeboard_sn;
			if("0".intern() == freeboardInfo.getFreeboard_sn().intern()){
				freeboard_sn = (String) client.queryForObject("freeboard.incrementSEQ", freeboardInfo);
			}else{
				client.update("freeboard.updateSEQ", freeboardInfo);
				freeboard_sn = String.valueOf(Integer.parseInt(freeboardInfo.getFreeboard_sn())+1);
			}
			freeboardInfo.setFreeboard_sn(freeboard_sn);
			
			String freeboard_depth = String.valueOf(Integer.parseInt(freeboardInfo.getFreeboard_depth())+1);
			freeboardInfo.setFreeboard_depth(freeboard_depth);
			
			client.insert("freeboard.insertFreeboardReply", freeboardInfo);
			
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
		}
		
	}



	
	
}
