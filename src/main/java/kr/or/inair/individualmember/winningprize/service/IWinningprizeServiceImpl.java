package kr.or.inair.individualmember.winningprize.service;
import kr.or.inair.individualmember.winningprize.dao.IWinningprizeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IWinningprizeServiceImpl implements IWinningprizeService {
	@Autowired
	private IWinningprizeDao winningprizeDao;

}
