package studyseatService_cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import studyseatMapper_cs.StudyseatMapper;
import studyseatdomain_cs.SeatVO;

@Log4j
@Service
@AllArgsConstructor
public class StudyseatServiceImpl implements StudyseatService{

	
	@Setter(onMethod_ = @Autowired)
	private StudyseatMapper mapper;
	
	@Override
	public List<SeatVO> useseat(Long cafeno) {
		log.info("check..........................." + cafeno);
		return mapper.readuseseat(cafeno);
	}

}
