package kr.or.inair.individualmember.cerificatie.service;
import kr.or.inair.individualmember.cerificatie.dao.ICerificatieDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ICerificatieServiceImpl implements ICerificatieService {
	@Autowired
	private ICerificatieDao cerificatieDao;

}
