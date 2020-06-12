package kr.or.inair.characterresult.dao;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.inair.vo.CHAR_ResultVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICHARResultDaoImpl implements ICHARResultDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public List<CHAR_ResultVO> selectCharResult(Map<String, String> parmas) throws Exception {
		
		return client.queryForList("charResult.selectCharResult", parmas);
	}

	@Override
	public void insertCharResult(Map<String, String> params) throws Exception {
		for(int i=1; i<7; i++){
			Map<String, String> newParams = new HashMap<String, String>();
			newParams.put("char_element_num", "");
			newParams.put("char_element_num", String.valueOf(i));
			if(i == 1){
				newParams.put("char_detail_lev", params.get("char_detail_lev01"));
				newParams.put("char_score", params.get("char_score01"));
			}else if(i == 2){
				newParams.put("char_detail_lev", params.get("char_detail_lev02"));
				newParams.put("char_score", params.get("char_score02"));
			}else if(i == 3){
				newParams.put("char_detail_lev", params.get("char_detail_lev03"));
				newParams.put("char_score", params.get("char_score03"));
			}else if(i == 4){
				newParams.put("char_detail_lev", params.get("char_detail_lev04"));
				newParams.put("char_score", params.get("char_score04"));
			}else if(i == 5){
				newParams.put("char_detail_lev", params.get("char_detail_lev05"));
				newParams.put("char_score", params.get("char_score05"));
			}else{
				newParams.put("char_detail_lev", params.get("char_detail_lev06"));
				newParams.put("char_score", params.get("char_score06"));
			}
			newParams.put("char_num", params.get("char_num"));
			client.insert("charResult.insertCharResult", newParams);
		}
	}

	@Override
	public List<CHAR_ResultVO> charScoreChart() throws Exception {
		return client.queryForList("charResult.charScoreAVG");
	}
}
