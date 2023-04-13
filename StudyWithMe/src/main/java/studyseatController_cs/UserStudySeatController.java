package studyseatController_cs;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

import lombok.extern.log4j.Log4j;
import studyseatService_cs.StudyseatService;
import studyseatUtil_cs.changetime;
	
@Controller
@Log4j
public class UserStudySeatController {
	private StudyseatService service;
	@GetMapping("/userstudyseat")
	public String UserStudyseat(Model model) {
		
		UserVO vo = new UserUtil().getUserDetails();
		changetime changer = new changetime();
		String remainingSeatTime = changer.time_longtoString(vo.getRemainingSeatTime());
		
		
		List<Integer> useseat = service.useseat(1); 
		System.out.println(useseat);
		model.addAttribute("useseat",useseat);
		log.info(useseat);
		 
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("time", remainingSeatTime);
		model.addAttribute("long_time",vo.getRemainingSeatTime());
		// 메인에서 초심인천점을 골랐을 경우, get으로 받든 post로 받든 지점명 넘어와야됨.
		// 현재 get형태 구현
		return "studycafe_cs/chosim_incheon_cs/userstudyseat";
	}
	
	@PostMapping("/userstudyseat/reservation")
	public String reservation() {
		return "studycafe_cs/chosim_incheon_cs/userstudyseat";
	}
}
