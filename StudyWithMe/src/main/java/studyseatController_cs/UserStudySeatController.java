package studyseatController_cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.studywithme.domain.UserVO;
import org.studywithme.util.UserUtil;

import lombok.extern.log4j.Log4j;
import studyseatService_cs.StudyseatService;
import studyseatUtil_cs.changetime;

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

		Long cafeno = (long) 1;
		log.info(service.useseat(cafeno));
		System.out.println(service.useseat(cafeno));

		model.addAttribute("cafeno", cafeno);
		model.addAttribute("lists", service.useseat(cafeno));
		model.addAttribute("name", vo.getUserName());
		model.addAttribute("id", vo.getUserId());
		model.addAttribute("time", remainingSeatTime);
		model.addAttribute("long_time", vo.getRemainingSeatTime());

		return "studycafe_cs/chosim_incheon_cs/userstudyseat";
	}

	@PostMapping("/userstudyseat/reservation")
	public ResponseEntity<String> reservation(@RequestParam("num_using") int num_using, @RequestParam("cafe_no") int cafe_no) {
		UserVO vo = new UserUtil().getUserDetails();
		
		try {
			try {
				service.insertseat(cafe_no, num_using, vo.getUserId());
				System.out.println("성공 --------------------------------------");
				return ResponseEntity.ok("Reservation Successful");
			}catch (SeatNotAvailableException e) {
				System.out.println("실패1 --------------------------------------");
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Reservation Failed");
		}
	}
}
