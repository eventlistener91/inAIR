package kr.or.inair.resboardfile.dao;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.Resboard_FileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRESBoardFileDaoImpl implements IRESBoardFileDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertFileItem(List<Resboard_FileVO> resfileItemList)
			throws Exception {
		try {
			client.startTransaction();
			
			for(Resboard_FileVO resfileItemInfo : resfileItemList){
				client.insert("reboard_file.insertFileitem", resfileItemInfo);
			}
			client.commitTransaction();
		} finally {
			client.endTransaction();

		}
		
	}
	


	@Override
	public Resboard_FileVO resboardfileItemInfo(Map<String, String> param)
			throws Exception {
		return (Resboard_FileVO) client.queryForObject("reboard_file.resfileItemInfo", param);
	}

	@Override
	public void updateFileitem(Resboard_FileVO resFileInfo) throws Exception {
		try {
			client.update("reboard_file.updateFileitem", resFileInfo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}



	

}
