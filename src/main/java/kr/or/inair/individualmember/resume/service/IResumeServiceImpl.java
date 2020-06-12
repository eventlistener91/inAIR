package kr.or.inair.individualmember.resume.service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.inair.academicdata.dao.IAcademicDataDao;
import kr.or.inair.career.dao.ICareerDao;
import kr.or.inair.individualmember.cerificatie.dao.ICerificatieDao;
import kr.or.inair.individualmember.lstcslist.dao.ILSTCSListDao;
import kr.or.inair.individualmember.resume.dao.IResumeDao;
import kr.or.inair.individualmember.winningprize.dao.IWinningprizeDao;
import kr.or.inair.portfolio.dao.IPortfolioDao;
import kr.or.inair.selfintroduction.dao.ISelfIntroductionDao;
import kr.or.inair.utiles.AttachFileMapper;
import kr.or.inair.vo.Academic_DetaVO;
import kr.or.inair.vo.CareerVO;
import kr.or.inair.vo.CerificatieVO;
import kr.or.inair.vo.LSTCS_ListVO;
import kr.or.inair.vo.PortfolioVO;
import kr.or.inair.vo.ResumeVO;
import kr.or.inair.vo.SelfIntroductionVO;
import kr.or.inair.vo.WinningPrizeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IResumeServiceImpl implements IResumeService {
	@Autowired
	private IResumeDao resumeDao;
	@Autowired
	private IAcademicDataDao academicDataDao;
	@Autowired
	private ICareerDao careerDao;
	@Autowired
	private ICerificatieDao cerificatieDao;
	@Autowired
	private IWinningprizeDao winningprizeDao;
	@Autowired
	private ILSTCSListDao lstcsListDao;
	@Autowired
	private ISelfIntroductionDao selfIntroductionDao;
	
	
	/**
	 * 접속한 회원의 이력서 리스트를 반환하는 메서드 
	 * @param indvdl_id
	 * @return 파라미터로 전달받은 회원의 아이디로 작성된 이력서 리스트 
	 * @author 수민
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<ResumeVO> getResumeList(String indvdl_id) throws Exception{
		return resumeDao.getResumeList(indvdl_id);
	}

	/**
	 * 이력서를 insert하는 메서드 
	 * @author 수민
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public String insertResume(ResumeVO insertResumeInfo) throws Exception {
		
		String resume_num = resumeDao.insertResume(insertResumeInfo);
		
		//세부학력, 경력, 자격증, 수상내역, 어학내역, 자기소개서, 포트폴리오 List에 이력서 번호 넣어주고, null인 리스트 걸러주기 
		List<Academic_DetaVO> insertAcademicDetaList = new ArrayList<Academic_DetaVO>();				//학력
		List<CareerVO> insertCareerInfoList = new ArrayList<CareerVO>();                  				//경력
		List<CerificatieVO> insertCerificatieList = new ArrayList<CerificatieVO>();            			//자격증
		List<WinningPrizeVO> insertWinningPrizeList = new ArrayList<WinningPrizeVO>();					//수상
		List<LSTCS_ListVO> insertLstcsListList = new ArrayList<LSTCS_ListVO>();               			//어학
		List<SelfIntroductionVO> insertSelfIntroductionList = new ArrayList<SelfIntroductionVO>();  	//자기소개서
		
		if(insertResumeInfo.getAcademicDetaList() != null){
			for(Academic_DetaVO academicDetaVo : insertResumeInfo.getAcademicDetaList()){
				if(academicDetaVo.getAcdmcr_num().equals("4")){										//null 
					if(!academicDetaVo.getDet_acdmcr_school().equals("") && academicDetaVo.getDet_acdmcr_school() != null){
						academicDetaVo.setResume_num(resume_num);
						insertAcademicDetaList.add(academicDetaVo);
					}
				}else{
					academicDetaVo.setResume_num(resume_num);
					insertAcademicDetaList.add(academicDetaVo);
				}
			}
			academicDataDao.insertAcademicDataList(insertAcademicDetaList);
		}
		
		if(insertResumeInfo.getCareerInfoList() != null){
			for(CareerVO careerVo : insertResumeInfo.getCareerInfoList()){
				if((careerVo.getCom_name() != null) && (!careerVo.getCom_name().equals(""))){
					careerVo.setResume_num(resume_num);
					insertCareerInfoList.add(careerVo);
				}
			}
			careerDao.insertCareerInfoList(insertCareerInfoList);
		}
		
		if(insertResumeInfo.getCerificatieList() != null){
			for(CerificatieVO cerificatieVo : insertResumeInfo.getCerificatieList()){
				if((cerificatieVo.getCrqfc_name() != null) && (!cerificatieVo.getCrqfc_name().equals(""))){
					cerificatieVo.setResume_num(resume_num);
					insertCerificatieList.add(cerificatieVo);
				}
			}
			cerificatieDao.insertCerificatieList(insertCerificatieList);
		}
		
		if(insertResumeInfo.getWinningPrizeList() != null){
			for(WinningPrizeVO winningPrizeVo : insertResumeInfo.getWinningPrizeList()){
				if((winningPrizeVo.getWnpz_name() != null) && (!winningPrizeVo.getWnpz_name().equals(""))){
					winningPrizeVo.setResume_num(resume_num);
					insertWinningPrizeList.add(winningPrizeVo);
				}
			}
			winningprizeDao.insertWinningPrizeList(insertWinningPrizeList);
		}
		
		if(insertResumeInfo.getLstcsListList() != null){
			for(LSTCS_ListVO lstcsListVo : insertResumeInfo.getLstcsListList()){
				if((lstcsListVo.getLang_test_name() != null) && (!lstcsListVo.getLang_test_name().equals(""))){
					lstcsListVo.setResume_num(resume_num);
					insertLstcsListList.add(lstcsListVo);
				}
			}
			lstcsListDao.insertLstcsListList(insertLstcsListList);
		}
		
		if(insertResumeInfo.getSelfIntroductionList() != null){
			for(SelfIntroductionVO selfIntroductionVo : insertResumeInfo.getSelfIntroductionList()){
				if((selfIntroductionVo.getSelfintro_qestn() != null) && (!selfIntroductionVo.getSelfintro_qestn().equals(""))){
					selfIntroductionVo.setResume_num(resume_num);
					insertSelfIntroductionList.add(selfIntroductionVo);
				}
			}
			selfIntroductionDao.insertSelfIntroductionList(insertSelfIntroductionList);
		}
		return resume_num;
	}

	/**
	 * 이력서 정보를 가져오는 메서드 
	 * @author 수민
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public ResumeVO getResumeInfo(String resume_num) throws Exception {
		return resumeDao.getResumeInfo(resume_num);
	}

	/**
	 * 이력서 	번호를 매개변수로 전달받아 삭제하는(resume_delete = 'y'로 update) 메서드
	 * @author 수민
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteResume(String resume_num) throws Exception {
		resumeDao.deleteResume(resume_num);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<ResumeVO> getResumeInfoList(Map<String, String> params) throws Exception {
		return resumeDao.getResumeInfoList(params);
	}

	/**
	 * 이력서를 update하는 메서드 
	 * @author 수민
	 */
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateResumeInfo(ResumeVO updateResumeVo) throws Exception {
		resumeDao.updateResumeInfo(updateResumeVo);
		
		//세부학력, 경력, 자격증, 수상내역, 어학내역, 자기소개서, 포트폴리오 List에 이력서 번호 넣어주고, null인 리스트 걸러주기 
		List<Academic_DetaVO> insertAcademicDetaList = new ArrayList<Academic_DetaVO>();				//학력
		List<Academic_DetaVO> updateAcademicDetaList = new ArrayList<Academic_DetaVO>();
		List<CareerVO> insertCareerInfoList = new ArrayList<CareerVO>();                  				//경력
		List<CareerVO> updateCareerInfoList = new ArrayList<CareerVO>();  
		List<CerificatieVO> insertCerificatieList = new ArrayList<CerificatieVO>();            			//자격증
		List<CerificatieVO> updateCerificatieList = new ArrayList<CerificatieVO>();
		List<WinningPrizeVO> insertWinningPrizeList = new ArrayList<WinningPrizeVO>();					//수상
		List<WinningPrizeVO> updateWinningPrizeList = new ArrayList<WinningPrizeVO>();
		List<LSTCS_ListVO> insertLstcsListList = new ArrayList<LSTCS_ListVO>();               			//어학
		List<LSTCS_ListVO> updateLstcsListList = new ArrayList<LSTCS_ListVO>();
		List<SelfIntroductionVO> insertSelfIntroductionList = new ArrayList<SelfIntroductionVO>();  	//자기소개서
		List<SelfIntroductionVO> updateSelfIntroductionList = new ArrayList<SelfIntroductionVO>();
		
		if(updateResumeVo.getAcademicDetaList() != null){
			for(Academic_DetaVO academicDetaVo : updateResumeVo.getAcademicDetaList()){
				if((academicDetaVo.getDet_acdmcr_school() != null) && (!academicDetaVo.getDet_acdmcr_school().equals(""))){
					if((academicDetaVo.getDet_acdmcr_num() != null) && (!academicDetaVo.getDet_acdmcr_num().equals(""))){
						updateAcademicDetaList.add(academicDetaVo);
					}else{
						academicDetaVo.setResume_num(updateResumeVo.getResume_num());
						insertAcademicDetaList.add(academicDetaVo);
					}
				}
			}
			academicDataDao.updateAcademicDataList(updateAcademicDetaList);
			academicDataDao.insertAcademicDataList(insertAcademicDetaList);
		}
		
		if(updateResumeVo.getCareerInfoList() != null){
			for(CareerVO careerVo : updateResumeVo.getCareerInfoList()){
				if((careerVo.getCom_name() != null) && (!careerVo.getCom_name().equals(""))){
					if((careerVo.getCareer_num() != null) && (!careerVo.getCareer_num().equals(""))){
						updateCareerInfoList.add(careerVo);
					}else{
						careerVo.setResume_num(updateResumeVo.getResume_num());
						insertCareerInfoList.add(careerVo);
					}
				}
			}
			careerDao.updateCareerInfoList(updateCareerInfoList);
			careerDao.insertCareerInfoList(insertCareerInfoList);
		}
		
		if(updateResumeVo.getCerificatieList() != null){
			for(CerificatieVO cerificatieVo : updateResumeVo.getCerificatieList()){
				if((cerificatieVo.getCrqfc_name() != null) && (!cerificatieVo.getCrqfc_name().equals(""))){
					if((cerificatieVo.getCrqfc_num() != null) && (!cerificatieVo.getCrqfc_num().equals(""))){
						updateCerificatieList.add(cerificatieVo);
					}else{
						cerificatieVo.setResume_num(updateResumeVo.getResume_num());
						insertCerificatieList.add(cerificatieVo);
					}
				}
			}
			cerificatieDao.updateCerificatieList(updateCerificatieList);
			cerificatieDao.insertCerificatieList(insertCerificatieList);
		}
		
		if(updateResumeVo.getWinningPrizeList() != null){
			for(WinningPrizeVO winningPrizeVo : updateResumeVo.getWinningPrizeList()){
				if((winningPrizeVo.getWnpz_name() != null) && (!winningPrizeVo.getWnpz_name().equals(""))){
					if((winningPrizeVo.getWnpz_num() != null) && (!winningPrizeVo.getWnpz_num().equals(""))){
						updateWinningPrizeList.add(winningPrizeVo);
					}else{
						winningPrizeVo.setResume_num(updateResumeVo.getResume_num());
						insertWinningPrizeList.add(winningPrizeVo);
					}
				}
			}
			winningprizeDao.updateWinningPrizeList(updateWinningPrizeList);
			winningprizeDao.insertWinningPrizeList(insertWinningPrizeList);
		}
		
		if(updateResumeVo.getLstcsListList() != null){
			for(LSTCS_ListVO lstcsListVo : updateResumeVo.getLstcsListList()){
				if((lstcsListVo.getLang_test_name() != null) && (!lstcsListVo.getLang_test_name().equals(""))){
					if((lstcsListVo.getLstcs_dtls_num() != null) && (!lstcsListVo.getLstcs_dtls_num().equals(""))){
						updateLstcsListList.add(lstcsListVo);
					}else{
						lstcsListVo.setResume_num(updateResumeVo.getResume_num());
						insertLstcsListList.add(lstcsListVo);
					}
				}
			}
			lstcsListDao.updateLstcsListList(updateLstcsListList);
			lstcsListDao.insertLstcsListList(insertLstcsListList);
		}
		
		if(updateResumeVo.getSelfIntroductionList() != null){
			for(SelfIntroductionVO selfIntroductionVo : updateResumeVo.getSelfIntroductionList()){
				if((selfIntroductionVo.getSelfintro_qestn() != null) && (!selfIntroductionVo.getSelfintro_qestn().equals(""))){
					if((selfIntroductionVo.getSelfintro_num() != null) && (!selfIntroductionVo.getSelfintro_num().equals(""))){
						updateSelfIntroductionList.add(selfIntroductionVo);
					}else{
						selfIntroductionVo.setResume_num(updateResumeVo.getResume_num());
						insertSelfIntroductionList.add(selfIntroductionVo);
					}
				}
			}
			selfIntroductionDao.updateSelfIntroductionList(updateSelfIntroductionList);
			selfIntroductionDao.insertSelfIntroductionList(insertSelfIntroductionList);
		}
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<ResumeVO> resumeList(Map<String, String> params)
			throws Exception {
		return resumeDao.resumeList(params);
	}
	
}
