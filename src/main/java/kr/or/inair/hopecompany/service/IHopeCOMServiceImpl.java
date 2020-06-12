package kr.or.inair.hopecompany.service;

import kr.or.inair.hopecompany.dao.IHopeCOMDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IHopeCOMServiceImpl implements IHopeCOMService {
	@Autowired
	private IHopeCOMDao hopeCompanyDao;

}
