package com.gb.olook.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gb.olook.model.OlookUserDTO;
import com.gb.olook.service.MailSendService;
import com.gb.olook.service.MypageService;
import com.gb.olook.service.OlookUserService;

@Controller
@RequestMapping(value = "/olookUser")
public class OlookUserController {
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	MailSendService mailService;
	
	@Autowired
	OlookUserService userService;
	
	 @Autowired
	   MypageService service;
	
	@RequestMapping(value = "/olookUserPage")
	public void olookUserView(Model model, HttpSession session) {
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		model.addAttribute("kakao_url", kakaoUrl);
	}

	@RequestMapping(value = "/olookEmailCheck", method = RequestMethod.GET)
	public void olookEmailCheckView() {}
	
	@ResponseBody
	@RequestMapping(value = "/olookEmailCheck", method = RequestMethod.POST)
	public Map<String, Object> olookEmailCheck(HttpServletResponse response, @RequestBody OlookUserDTO olookUser) {
		String email = olookUser.getUser_email();
		String key = mailService.mailSendWithAuthKey(email);
		Cookie cookie = new Cookie("authKey", key);
		cookie.setMaxAge(60*3);
		response.addCookie(cookie);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("flag", Boolean.TRUE);
		return result;
	}
	
	@RequestMapping(value = "/olookUserJoin", method = RequestMethod.GET)
	public void olookUserJoinView(Model model, String userEmail) {
		model.addAttribute("userEmail", userEmail);
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public Map<String, Object> idCheck(@RequestBody OlookUserDTO olookUser) {
		Map<String, Object> result = new HashMap<String, Object>();
		OlookUserDTO userEmail = userService.idCheck(olookUser.getUser_email());
		if(userEmail == null) {
			result.put("flag", Boolean.TRUE);
		}else {
			result.put("flag", Boolean.FALSE);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/nickNameCheck", method = RequestMethod.POST)
	public Map<String, Object> nickNameCheck(@RequestBody OlookUserDTO olookUser) {
		Map<String, Object> result = new HashMap<String, Object>();
		OlookUserDTO userNickName = userService.nickNameCheck(olookUser.getUser_nickname());
		if(userNickName == null) {
			result.put("flag", Boolean.TRUE);
		}else {
			result.put("flag", Boolean.FALSE);
		}
		return result;
	}
	
	@RequestMapping(value = "/olookUserJoin", method = RequestMethod.POST)
	public String olookUserJoin(@ModelAttribute OlookUserDTO userDto, @RequestParam("uploadFile") MultipartFile uploadFile, HttpSession session) throws IOException{
		userService.join(userDto, uploadFile);
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/olookUserLogin", method=RequestMethod.POST)
	public String olookUserLogin(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("message2","no");
		model.addAttribute("message", "로그인 실패, 다시 시도해 주세요");
		model.addAttribute("flag", "false");
		OlookUserDTO loginUser = userService.login(map);
		if(loginUser != null) {
			String pwd = (String) map.get("user_password");
			String userPwd = loginUser.getUser_password();
			if(pwdEncoder.matches(pwd, userPwd)) {
				model.addAttribute("message", "로그인 성공");
				model.addAttribute("flag", "true");
				session.setAttribute("loginUser", loginUser);
			}
		}
		return "olookUser/alertLogin";
	}
	
	@RequestMapping(value="/findID", method = RequestMethod.GET)
	public void findIdView() {}
	
	@RequestMapping(value="/findID", method = RequestMethod.POST)
	public ModelAndView findId(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		OlookUserDTO userDto = userService.findID(map);
		if(userDto != null) {
			mav.addObject("findUser", userDto);
			mav.setViewName("olookUser/confirmID");
		}else {
			mav.addObject("message", "가입하신 이메일이 없습니다");
			mav.addObject("flag", "false");
			mav.setViewName("olookUser/alertLogin");
		}
		return mav;
	}
	
	@RequestMapping(value="/findPwd", method = RequestMethod.GET)
	public void findPwdView() {}

	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public void changePwdView(Model model, String userEmail) {
		model.addAttribute("userEmail", userEmail);
	}
	
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public ModelAndView changePwd(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		userService.changePwd(map);
		mav.addObject("message2", "비밀번호가 변경되었습니다");
		mav.setViewName("olookUser/alertLogin");
		return mav;
	}
	
	@RequestMapping(value = "/kakaoLogin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		String kNickName = properties.path("nickname").asText();
		session.setAttribute("kNickName", kNickName);
		mav.setViewName("olookUser/olookEmailCheck");
		return mav;
	}

	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
	
	@RequestMapping(value="/myPage")
	   public void mypageView(HttpServletRequest request, HttpSession session) {
	      session = request.getSession();
	      session.getAttribute("loginUser");
	   }
	   
	   @RequestMapping(value = "/updateUser",method = RequestMethod.GET)
	   public void updateView(HttpSession session,Model model) {
	      model.addAttribute("loginUser",service.getUser((String) session.getAttribute("user_email")));
	   }
	   
	   @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
	   public String updateUser(OlookUserDTO user) {
	      System.out.println("회원 정보수정 POST");
	      service.updateUser(user);
	      
	      return "olookUser/myPage";
	   }
	   
	
}
