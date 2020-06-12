package kr.or.inair.controller.individualmember;

import kr.or.inair.resboard.service.IRESBoardService;
import kr.or.inair.resboardfile.service.IRESBoardFileService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/individualMember/")
public class IndividualMemberReferenceController {
	private IRESBoardService referenceService;
	private IRESBoardFileService referenceFileService;
	
}
