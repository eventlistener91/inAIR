package kr.or.inair.admin.itemmanagement.service;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.ClassOfPositionVO;
import kr.or.inair.vo.EmploymentVO;
import kr.or.inair.vo.INDVDL_DropVO;
import kr.or.inair.vo.LanguageVO;
import kr.or.inair.vo.LowIndustryVO;
import kr.or.inair.vo.LowProVO;
import kr.or.inair.vo.SalaryVO;
import kr.or.inair.vo.UpIndustryVO;
import kr.or.inair.vo.UpProVO;

public interface ItemManagementService {
	/**
	 * list를 출력하는 매서드 
	 * @date 2020-05-25
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
	public List<LanguageVO> adminLanguageList(Map<String, String> params) throws Exception;
	/**
	 * 검색할 키워드를 params로 받아서 해당하는 게시글의 갯수를 반환하는 매서드 
	 * @date 2020-05-26
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String totalCount(Map<String, String> params) throws Exception;
	/**
	 * 언어vo를 받아서 insert 해주는 매서드 
	 * @date 2020-05-26
	 * @author 한유경
	 * @param languageInfo
	 * @throws Exception
	 */
	public void insertLanguage(LanguageVO languageInfo) throws Exception;
	/**
	 * lang_num을 받아서 delete해주는 매서드
	 * @date 2020-05-26
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteLanguage(Map<String, String> params) throws Exception;
	/**
	 * params를 받아서 전체list를 보여주는 매서드 
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<SalaryVO> salaryList(Map<String, String> params) throws Exception; 
	/**
	 * 게시글의 갯수를 반환해주는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
	public String getAdminTotalCount() throws Exception;
	/**
	 * vo를 받아서 insert 시키는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param salaryInfo
	 * @throws Exception
	 */
	public void insertSalary(SalaryVO salaryInfo) throws Exception;
	/**
	 * params를 받아서 삭제하는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteSalary(Map<String, String> params) throws Exception;
	/**
	 * 직급항목 리스트를 출력하는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<ClassOfPositionVO> classOfPositionList(Map<String, String> params) throws Exception;
	/**
	 * 전체리스트 갯수를 출력하는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String clsfTotal(Map<String, String> params) throws Exception;
	/**
	 * 직급항목을 추가하는 매서드
	 * @date 2020-05-27
	 * @author 한유경
	 * @param clsfInfo
	 * @throws Exception
	 */
	public void insertClsf(ClassOfPositionVO clsfInfo) throws Exception;
	/**
	 * clsf_delete를 받아서 삭제하는 매서드
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteClsf(Map<String, String> params) throws Exception;
	/**
	 * 상위항목 리스트를 출력하는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<UpProVO> UpProList(Map<String, String> params) throws Exception;
	/**
	 * 전체리스트 갯수를 출력하는 매서드 
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String totalUpPRO(Map<String, String> params) throws Exception;
	/**
	 * 상위항목을 추가하는 매서드
	 * @date 2020-05-27
	 * @author 한유경
	 * @param clsfInfo
	 * @throws Exception
	 */
	public void insertUpPRO(UpProVO upProInfo) throws Exception;
	/**
	 * uppro_delete를 받아서 삭제하는 매서드
	 * @date 2020-05-27
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteUpPRO(Map<String, String> params) throws Exception;
	/**
	 * 상위직종 번호를 받아서 그에 해당하는 하위직종 리스트 출력하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<LowProVO> AdminlowPROList(Map<String, String> params) throws Exception;
	/**
	 * lowprovo 를 받아서 insert하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param lowProInfo
	 * @throws Exception
	 */
	public void insertLowPRO(LowProVO lowProInfo) throws Exception;
	/**
	 * lowpro_num을 받아서 해당 vo를 삭제하는 매서드 
	 * @date 2020-05-38
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteLowPRO(Map<String, String> params) throws Exception;
	/**
	 * 상위업종 리스트를 출력하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<UpIndustryVO> UpIndustryList(Map<String, String> params) throws Exception;
	/**
	 * 전체리스트 갯수를 출력하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String totalUpIndustry(Map<String, String> params) throws Exception;
	/**
	 * 상위항목을 추가하는 매서드
	 * @date 2020-05-28
	 * @author 한유경
	 * @param clsfInfo
	 * @throws Exception
	 */
	public void insertUpIndustry(UpIndustryVO upIndustryInfo) throws Exception;
	/**
	 * uppro_delete를 받아서 삭제하는 매서드
	 * @date 2020-05-28
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteUpIndustry(Map<String, String> params) throws Exception;
	/**
	 * 상위업종 번호를 받아서 그에 해당하는 하위업종 리스트 출력하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<LowIndustryVO> AdminLowIndustryList(Map<String, String> params) throws Exception;
	/**
	 * lowIndustryInfo 를 받아서 insert하는 매서드 
	 * @date 2020-05-28
	 * @author 한유경
	 * @param lowIndustryInfo
	 * @throws Exception
	 */
	public void insertLowIndustry(LowIndustryVO lowIndustryInfo) throws Exception;
	/**
	 * lwinduty_num을 받아서 해당 vo를 삭제하는 매서드 
	 * @date 2020-05-38
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteLowIndustry(Map<String, String> params) throws Exception;
	/**
	 * 탈퇴사유 리스트를 출력하는 매서드 
	 * @date 2020-05-29
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<INDVDL_DropVO> IndvdlDropList(Map<String, String> params) throws Exception;
	/**
	 * 전체탈퇴사유리스트 갯수를 출력하는 매서드 
	 * @date 2020-05-29
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public String indvdlDropTotalCount(Map<String, String> params) throws Exception;
	/**
	 * 탈퇴사유리스트를 추가하는 매서드
	 * @date 2020-05-29
	 * @author 한유경
	 * @param 
	 * @throws Exception
	 */
	public void insertIndvdlDrop(INDVDL_DropVO IndvdlDropInfo) throws Exception;
	/**
	 * indvdl_delete를 받아서 삭제하는 매서드
	 * @date 2020-05-29
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteIndvdlDrop(Map<String, String> params) throws Exception;
	/**
	 * startCount와 endCount를 받아서 list를 출력하는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public List<EmploymentVO> adminEmploymentList(Map<String, String> params) throws Exception;
	/**
	 * emplym_num이 같은 employment 갯수를 출력하는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
	public String adminEmployTotalCount() throws Exception;
	/**
	 * vo를 받아서 insert하는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @param employmentInfo
	 * @throws Exception
	 */
	public void insertEmploy(EmploymentVO employmentInfo) throws Exception;
	/**
	 * emplym_num을 받아서 삭제하는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @param params
	 * @throws Exception
	 */
	public void deleteEmploy(Map<String, String> params) throws Exception;
}
