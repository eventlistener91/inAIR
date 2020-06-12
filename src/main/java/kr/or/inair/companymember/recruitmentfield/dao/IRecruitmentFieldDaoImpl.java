package kr.or.inair.companymember.recruitmentfield.dao;

import java.util.List;

import kr.or.inair.vo.Recruitment_FieldVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IRecruitmentFieldDaoImpl implements IRecruitmentFieldDao {
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertRecruitmentFieldList(
			List<Recruitment_FieldVO> insertRecruitmentFieldList)
			throws Exception {
		for(Recruitment_FieldVO insertRecruitmentFieldInfo : insertRecruitmentFieldList){
			client.insert("recruitmentField.insertRecruitmentFieldInfo", insertRecruitmentFieldInfo);
		}
	}

}
