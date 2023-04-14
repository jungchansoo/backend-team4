package studyseatController_cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import studyseatService_cs.StudyseatService;
import studyseatUtil_cs.changetime;
import studyseatdomain_cs.SeatVO;
	

@Controller
@Log4j
public class UserStudySeatController {
	@Autowired
	private StudyseatService service;
	@GetMapping("/userstudyseat")
	public String UserStudyseat(Model model) {
		
		UserVO vo = new UserUtil().getUserDetails();
		changetime changer = new changetime();
		String remainingSeatTime = changer.time_longtoString(vo.getRemainingSeatTime());
		
		Long bno = (long) 1;
		log.info(service.useseat(bno));
		System.out.println(service.useseat(bno));
		
		model.addAttribute("lists", service.useseat(bno));
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("time", remainingSeatTime);
		model.addAttribute("long_time",vo.getRemainingSeatTime());
		
		return "studycafe_cs/chosim_incheon_cs/userstudyseat";
	}
	
	@PostMapping("/userstudyseat/reservation")
	public String reservation() {
		return "studycafe_cs/chosim_incheon_cs/userstudyseat";
	}
}
