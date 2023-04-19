package org.studywithme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;



@Log4j
@RequestMapping("/sample/*")
@Controller
public class SampleController {


  @GetMapping("/all")
  public void doAll() {

    log.info("do all can access everybody");
  }

  @GetMapping("/user")
  public void doUser() {

    log.info("logined member");
  }


	/*
	 * @Secured({"ROLE_admin"})
	 */
  @GetMapping("/admin")
  public void doAdmin() {

    log.info("admin only");
  }

	/*
	 * @Secured({"ROLE_manager"})
	 */
  @GetMapping("/manager")
  public void doManager() {

    log.info("manager only");
  }
	/*
	 * @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	 *
	 * @GetMapping("/annoMember") public void doMember2() {
	 *
	 * log.info("logined annotation member"); }
	 *
	 *
	 * @Secured({"ROLE_ADMIN"})
	 *
	 * @GetMapping("/annoAdmin") public void doAdmin2() {
	 *
	 * log.info("admin annotaion only"); }
	 */

}
