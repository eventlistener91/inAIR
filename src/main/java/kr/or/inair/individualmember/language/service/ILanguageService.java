package kr.or.inair.individualmember.language.service;

import java.util.List;

import kr.or.inair.vo.LanguageVO;

public interface ILanguageService {

	/**
	 * 언어 리스트를 반환하는 메서드 
	 * @return List<LanguageVO>
	 * @throws Exception
	 */
	List<LanguageVO> getLanguageList() throws Exception;

}
