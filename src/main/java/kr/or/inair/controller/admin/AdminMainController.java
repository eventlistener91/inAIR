package kr.or.inair.controller.admin;

import kr.or.inair.admin.adminchart.service.IAdminChartService;
import kr.or.inair.vo.AdminChartVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.ResumeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/admin/main/")
@Controller
public class AdminMainController {
	@Autowired
	private IAdminChartService iadminChartService;
	
	
	
	@RequestMapping("mainView")
	public ModelAndView mainView(ModelAndView andView,
								AdminChartVO indvdlmentInfo,
								AdminChartVO indvdlAgeInfo,
								AdminChartVO indvdlDropInfo,
								AdminChartVO indvdlFinAcadmcrInfo,
								AdminChartVO indvdlboardchartInfo,
								ResumeVO resumeInfo) throws Exception{
		
		indvdlmentInfo = iadminChartService.genderChart();
		indvdlAgeInfo = iadminChartService.ageIndvdlChart();
		resumeInfo = iadminChartService.workIndvdlChart();
		indvdlDropInfo = iadminChartService.IndvdlDropChart();
		indvdlFinAcadmcrInfo = iadminChartService.FinAcadmcr();
		indvdlboardchartInfo = iadminChartService.AdminBoard();
		
		andView.addObject("indvdlboardchartInfo",indvdlboardchartInfo);
		andView.addObject("indvdlFinAcadmcrInfo", indvdlFinAcadmcrInfo);
		andView.addObject("indvdlDropInfo", indvdlDropInfo);
		andView.addObject("resumeInfo",resumeInfo);
		andView.addObject("indvdlmentInfo", indvdlmentInfo);
		andView.addObject("indvdlAgeInfo", indvdlAgeInfo);
		andView.setViewName("admin/main/mainView");
		
		return andView;
	}
	
	
	
	
	
}
