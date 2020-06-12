package kr.or.inair.idpicture.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.IDPictureVO;

public interface IIdPictureDao {
	/**
	 * 개인회원 프로필 사진 insert하는 메서드
	 * @param idPictureList
	 * @throws Exception
	 * @author 이혜인
	 */
	public void insertIdPicture(IDPictureVO idPicture) throws Exception;
	
	/**
	 * 개인회원 프로필 정보를 반환하는 메서드
	 * @param params 개인 회원 아이디
	 * @return IDPictureVO
	 * @throws Exception
	 * @author 이혜인
	 */
	public IDPictureVO idPictureInfo(Map<String, String> params) throws Exception;
	
	/**
	 * 개인회원 프로필 사진 update하는 메서드
	 * @param idPicture
	 * @throws Exception
	 * @author 이혜인
	 */
	public void updateIdPicture(IDPictureVO idPicture) throws Exception;
}
