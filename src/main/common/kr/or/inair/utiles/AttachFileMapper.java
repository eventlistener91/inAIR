package kr.or.inair.utiles;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.inair.golbal.FileGlobalConstant;
import kr.or.inair.vo.COM_ProfileVO;
import kr.or.inair.vo.Freeboard_FileVO;
import kr.or.inair.vo.IDPictureVO;
import kr.or.inair.vo.Job_Offer_FileVO;
import kr.or.inair.vo.MentorVO;
import kr.or.inair.vo.Mentor_FileVO;
import kr.or.inair.vo.PortfolioVO;
import kr.or.inair.vo.Resboard_FileVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

// @Component 자동으로 빈 등록
@Component
public class AttachFileMapper {
	//자유게시판
   public List<Freeboard_FileVO> freemapper(MultipartFile[] items, String freeboard_num){
      List<Freeboard_FileVO> freefileItemList = new ArrayList<Freeboard_FileVO>();
      
      if (items != null) {
         // 업로드한 파일 정보를 저장하는 곳 : Freeboard_FileVO
    	  Freeboard_FileVO freefileItemInfo = null;
         for(MultipartFile item : items){
        	 if(item.getOriginalFilename()!=""){
        	 freefileItemInfo = new Freeboard_FileVO();
            
        	 freefileItemInfo.setFreeboard_num(freeboard_num);
            
            // a.png -> a.png
            // D:\temp\a.png -> a.png (getName())  --> 다운로드 창에서 활용
            // item.getOriginalFilename() : 파일의 이름을 취득
            String free_file_name = FilenameUtils.getName(item.getOriginalFilename());
            // 취득한 이름을 세터를 통해서 저장
            freefileItemInfo.setFree_file_name(free_file_name);
            
            // a.png    a + UUID랜덤값 + png --> 실제저장소에 파일을 저장할때 쓰임
            String baseName = FilenameUtils.getBaseName(free_file_name);
            String extension = FilenameUtils.getExtension(free_file_name);
            
            String genID = UUID.randomUUID().toString().replace("-", "");
            
            String saveFileName = baseName + genID + "." + extension; //실제저장파일명
            freefileItemInfo.setFree_file_savename(saveFileName);
            
            
            freefileItemInfo.setFree_file_eventn(item.getContentType());
            freefileItemInfo.setFree_file_size(String.valueOf(item.getSize()));
            
            
            freefileItemList.add(freefileItemInfo);
            
            saveFile(saveFileName, item);
        	 
        	 }
         }
      }
      return freefileItemList;
   }
   
   //멘토/멘티 게시판 
   public List<Mentor_FileVO> mentormapper(MultipartFile[] items, String mentor_num){
	      List<Mentor_FileVO> mentorfileItemList = new ArrayList<Mentor_FileVO>();
	      
	      if (items != null) {
	         // 업로드한 파일 정보를 저장하는 곳 : Mentor_FileVO
	    	  Mentor_FileVO mentorfileItemInfo = null;
	         for(MultipartFile item : items){
	        	 if(item.getOriginalFilename()!=""){
	        	mentorfileItemInfo = new Mentor_FileVO();
	            
	        	mentorfileItemInfo.setMentor_num(mentor_num);
	            
	            // a.png -> a.png
	            // D:\temp\a.png -> a.png (getName())  --> 다운로드 창에서 활용
	            // item.getOriginalFilename() : 파일의 이름을 취득
	            String men_file_name = FilenameUtils.getName(item.getOriginalFilename());
	            // 취득한 이름을 세터를 통해서 저장
	            mentorfileItemInfo.setMen_file_name(men_file_name);
	            
	            // a.png    a + UUID랜덤값 + png --> 실제저장소에 파일을 저장할때 쓰임
	            String baseName = FilenameUtils.getBaseName(men_file_name);
	            String extension = FilenameUtils.getExtension(men_file_name);
	            
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            
	            String saveFileName = baseName + genID + "." + extension; //실제저장파일명
	            mentorfileItemInfo.setMen_file_savename(saveFileName);
	            
	            
	            mentorfileItemInfo.setMen_file_eventn(item.getContentType());
	            mentorfileItemInfo.setMen_file_size(String.valueOf(item.getSize()));
	            
	            
	            mentorfileItemList.add(mentorfileItemInfo);
	            
	            saveFile(saveFileName, item);
	        	 
	        	 }
	         }
	      }
	      return mentorfileItemList;
	   }
   
   //자료실 
   public List<Resboard_FileVO> resmapper(MultipartFile[] items, String res_num){
	      List<Resboard_FileVO> resfileItemList = new ArrayList<Resboard_FileVO>();
	      
	      if (items != null) {
	         // 업로드한 파일 정보를 저장하는 곳 : Freeboard_FileVO
	    	  Resboard_FileVO resfileItemInfo = null;
	         for(MultipartFile item : items){
	        	 if(item.getOriginalFilename()!=""){
	        		 resfileItemInfo = new Resboard_FileVO();
	            
	        		 resfileItemInfo.setRes_num(res_num);
	            
	            // a.png -> a.png
	            // D:\temp\a.png -> a.png (getName())  --> 다운로드 창에서 활용
	            // item.getOriginalFilename() : 파일의 이름을 취득
	            String res_name = FilenameUtils.getName(item.getOriginalFilename());
	            // 취득한 이름을 세터를 통해서 저장
	            resfileItemInfo.setRes_name(res_name);
	            
	            // a.png    a + UUID랜덤값 + png --> 실제저장소에 파일을 저장할때 쓰임
	            String baseName = FilenameUtils.getBaseName(res_name);
	            String extension = FilenameUtils.getExtension(res_name);
	            
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            
	            String saveFileName = baseName + genID + "." + extension; //실제저장파일명
	            resfileItemInfo.setRes_file_savename(saveFileName);
	            
	            
	            resfileItemInfo.setRes_file_eventn(item.getContentType());
	            resfileItemInfo.setRes_file_size(String.valueOf(item.getSize()));
	      
	            
	            
	            resfileItemList.add(resfileItemInfo);
	            
	            saveFile(saveFileName, item);
	        	 
	        	 }
	         }
	      }
	      return resfileItemList;
	   }
   
  
   

   
   //포트폴리오
   public List<PortfolioVO> portfolioMapper(MultipartFile[] items, String resume_num){
	   List<PortfolioVO> portfolioList = new ArrayList<PortfolioVO>();
	   
	   if (items != null) {
		   PortfolioVO portfolioInfo = null;
		   for(MultipartFile item : items){
			   if((!item.getOriginalFilename().equals("")) && (item.getSize() != 0)){
				   portfolioInfo = new PortfolioVO();
				   
				   portfolioInfo.setResume_num(resume_num);
				   
				   // a.png -> a.png
				   // D:\temp\a.png -> a.png (getName())  --> 다운로드 창에서 활용
				   // item.getOriginalFilename() : 파일의 이름을 취득
				   String port_filename = FilenameUtils.getName(item.getOriginalFilename());
				   // 취득한 이름을 세터를 통해서 저장
				   portfolioInfo.setPort_filename(port_filename);
				   
				   // a.png    a + UUID랜덤값 + png --> 실제저장소에 파일을 저장할때 쓰임
				   String baseName = FilenameUtils.getBaseName(port_filename);
				   String extension = FilenameUtils.getExtension(port_filename);
				   
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   
				   String saveFileName = baseName + genID + "." + extension; //실제저장파일명
				   portfolioInfo.setPort_filesavename(saveFileName); 
				   
				   
				   portfolioInfo.setPort_fileeventn(item.getContentType());
				   portfolioInfo.setPort_filesize(String.valueOf(item.getSize()));
				   
				   
				   portfolioList.add(portfolioInfo);
				   
				   saveFile(saveFileName, item);
			   }
		   }
	   }
	   return portfolioList;
   }
   
   //구인글 첨부파일 
   public List<Job_Offer_FileVO> jobOfferFileMapper(MultipartFile[] items, String jo_num){
	   List<Job_Offer_FileVO> jobOfferFileList = new ArrayList<Job_Offer_FileVO>();
	   
	   if (items != null) {
		   Job_Offer_FileVO jobOfferFileInfo = null;
		   for(MultipartFile item : items){
			   if((!item.getOriginalFilename().equals("")) && (item.getSize() != 0)){
				   jobOfferFileInfo = new Job_Offer_FileVO();
				   
				   jobOfferFileInfo.setJo_num(jo_num);
				   
				   // a.png -> a.png
				   // D:\temp\a.png -> a.png (getName())  --> 다운로드 창에서 활용
				   // item.getOriginalFilename() : 파일의 이름을 취득
				   String jo_file_name = FilenameUtils.getName(item.getOriginalFilename());
				   // 취득한 이름을 세터를 통해서 저장
				   jobOfferFileInfo.setJo_file_name(jo_file_name);
				   
				   // a.png    a + UUID랜덤값 + png --> 실제저장소에 파일을 저장할때 쓰임
				   String baseName = FilenameUtils.getBaseName(jo_file_name);
				   String extension = FilenameUtils.getExtension(jo_file_name);
				   
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   
				   String saveFileName = baseName + genID + "." + extension; //실제저장파일명
				   jobOfferFileInfo.setJo_file_savename(saveFileName); 
				   
				   
				   jobOfferFileInfo.setJo_file_eventn(item.getContentType());
				   jobOfferFileInfo.setJo_file_size(String.valueOf(item.getSize()));
				   
				   
				   jobOfferFileList.add(jobOfferFileInfo);
				   
				   saveFile(saveFileName, item);
			   }
		   }
	   }
	   return jobOfferFileList;
   }
   
   public IDPictureVO idPictureMapper(MultipartFile item, String indvdl_id){
	   IDPictureVO idPictureInfo = new IDPictureVO();
	   
	   if (item != null) {
		   if( (!item.getOriginalFilename().equals("")) && (item.getSize() != 0) ) {
			   
			   idPictureInfo.setIndvdl_id(indvdl_id);
			   
			   String filename = FilenameUtils.getName(item.getOriginalFilename());
			   idPictureInfo.setIdpic_file_name(filename);
			   
			   String baseName = FilenameUtils.getBaseName(filename);
			   String extension = FilenameUtils.getExtension(filename);
			   
			   String genID = UUID.randomUUID().toString().replace("-", "");
			   
			   String saveFileName = baseName + genID + "." + extension; //실제저장파일명
			   idPictureInfo.setIdpic_file_savename(saveFileName);
			   
			   idPictureInfo.setIdpic_file_eventn(item.getContentType());
			   idPictureInfo.setIdpic_file_size(String.valueOf(item.getSize()));
			   
			   saveFile(saveFileName, item);
		   }
	   }
	   return idPictureInfo;
   }
   
   //기업회원 프로필사진
   public COM_ProfileVO comProfileMapper(MultipartFile item, String com_id){
	   COM_ProfileVO comProfileInfo = new COM_ProfileVO();
	   if (item != null) {
		   if((!item.getOriginalFilename().equals("")) && (item.getSize() != 0)){
			   
			   comProfileInfo.setCom_id(com_id);
			   
			   String com_file_name = FilenameUtils.getName(item.getOriginalFilename());
			   comProfileInfo.setCom_file_name(com_file_name);
			   
			   String baseName = FilenameUtils.getBaseName(com_file_name);
			   String extension = FilenameUtils.getExtension(com_file_name);
			   
			   String genID = UUID.randomUUID().toString().replace("-", "");
			   
			   String saveFileName = baseName + genID + "." + extension; //실제저장파일명
			   comProfileInfo.setCom_file_savename(saveFileName);

			   comProfileInfo.setCom_file_eventn(item.getContentType());
			   comProfileInfo.setCom_file_size(String.valueOf(item.getSize()));
			   
			   saveFile(saveFileName, item);
		   }
	   }
	   return comProfileInfo;
   }

   private void saveFile(String saveFileName, MultipartFile item) {
      File saveFile = new File(FileGlobalConstant.FILE_PATH, saveFileName);
      try {
         // transferTo : 파일에다가 저장처리
         item.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}