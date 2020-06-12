package kr.or.inair.freeboardfile.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Freeboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IFreeBoardFileDaoImpl implements IFreeBoardFileDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertFileItem(List<Freeboard_FileVO> freefileItemList)
			throws Exception {
		try {
			client.startTransaction();
			
			for(Freeboard_FileVO freefileItemInfo:freefileItemList){
				client.insert("freeboard_file.insertFileItem", freefileItemInfo);
			}
			client.commitTransaction();
			
		} finally {
			client.endTransaction();
		}
		
	}

	@Override
	public Freeboard_FileVO freefileItemInfo(Map<String, String> params)
			throws Exception {	
		return (Freeboard_FileVO) client.queryForObject("freeboard_file.freefileItemInfo", params);
	}

}
