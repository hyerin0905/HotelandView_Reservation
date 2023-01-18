package reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import reservation.dto.ReservationDto;
import reservation.service.ReservationService;

@Slf4j
@Controller
public class reservationController {

	@Autowired
	private ReservationService reservationService;

//<호텔 예약 시스템>
//예약자 명단 (t_reservation에 저장된 정보) 나오는 page
	@RequestMapping("/openReservationList.do")

	public ModelAndView openReservationList() throws Exception {
		ModelAndView mv = new ModelAndView("/ReservationList");

		List<ReservationDto> list = reservationService.selectReservationList();
		mv.addObject("list", list);

		return mv;
	}

//호텔 예약 정보 입력하는 page
	@RequestMapping("/openReservationWrite.do")
	public String openReservationWrite() throws Exception {
		return "/reservationWrite";
	}

//예약 정보를 insert하는 메서드
	@RequestMapping("/insertReservation.do")
	public String insertReservation(ReservationDto reservationDto) throws Exception {
		reservationService.insertReservation(reservationDto);
		return "redirect:/openReservationList.do";
	}

//<예약 조회 시스템>
//예약 확인을 위한 정보 (이름, 연락처) 입력하는 페이지
	@RequestMapping("/reservationInfoWrite.do")
	public String reservationInfoWrite() throws Exception {
		return "/reservationInfoWrite_re";
	}

//입력 받은 정보를 reservationInfo(DTO)에서 조회, 리스트 반환
	@RequestMapping("/checkReservationInfo.do")
	public ModelAndView checkReservationInfo(ReservationDto reservationDto) throws Exception {
		ModelAndView mv = new ModelAndView("/CheckReservation");

		List<ReservationDto> list = reservationService.checkReservationInfo(reservationDto);
		mv.addObject("list", list);

		return mv;
	}

//checkIdx를 파라미터로 받아서 예약 정보를 조회, 리스트 반환
	@RequestMapping("/openReservationInfo.do")
	public ModelAndView CheckReservation(@RequestParam int checkIdx) throws Exception {

		ModelAndView mv = new ModelAndView("/CheckReservation");

		List<ReservationDto> list = reservationService.CheckReservation(checkIdx);
		mv.addObject("list", list);

		return mv;
	}

}
