package com.gb.olook.controller;


import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.gb.olook.model.LookCommentDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookLikeDTO;
import com.gb.olook.model.OlookUserDTO;
import com.gb.olook.model.PageDTO;
import com.gb.olook.service.LookboardService;
import com.gb.olook.service.LookcommentService;
import com.gb.olook.service.MailSendService;
import com.gb.olook.service.MypageService;
import com.gb.olook.service.OlookLikeService;
import com.gb.olook.service.OlookUserService;
import com.sun.mail.handlers.image_gif;

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
	MypageService myPageService;
	
	@Autowired
	LookboardService boardService;
	
	@Autowired
	LookcommentService cmtService;
	
	@Autowired
	OlookLikeService likeService;
	
	private String lookboardView ="redirect:/lookboard/detail";
	
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

	@RequestMapping(value="/myPage")
	public String mypageView(HttpServletRequest request, Model model) throws IOException {
		HttpSession session = request.getSession();
		OlookUserDTO user = (OlookUserDTO)session.getAttribute("loginUser");
		System.out.println(session.getAttribute("loginUser"));
		String user_email = user.getUser_email();
		System.out.println("mypage = " + user_email);
		List<LookboardDTO> list = myPageService.getMyBoardList(user_email);
//		System.out.println(list);
		
//		System.out.println(user.getFilename());
		model.addAttribute("list",list);
		model.addAttribute("loginUser",user); 
		
		if(user_email == null) {
			model.addAttribute("message2","로그인 후 이용해주세요");
			return "olookUser/alertLogin";
		}
		return "olookUser/myPage";
	}
	
	@RequestMapping(value="Searchlist")
	public ModelAndView searchList(HttpServletRequest request,String page, String field, String findText, Model model) {
		int currenPage;
		int totalCount;
		int pageSize = 4;
		if(page == null || page.trim().length() == 0)
			currenPage = 1;
		else currenPage = Integer.parseInt(page);
		PageDTO pageDto;
		ModelMap modelMap = new ModelMap();
		
		totalCount = myPageService.getboardCnt();
		pageDto = new PageDTO(currenPage, pageSize, totalCount, field, findText);
		List<LookboardDTO> list;
		list = myPageService.getPagelist2(new PageDTO(currenPage, pageSize, totalCount, field, findText));
		modelMap.put("field", field);
		modelMap.put("findText", findText);
		
		if(findText!=null) {
			totalCount = myPageService.searchCount2(modelMap);
			pageDto = new PageDTO(currenPage, pageSize, totalCount, field, findText);
			list = myPageService.searchList2(pageDto);
		}else {
			totalCount = myPageService.getboardCnt();
			pageDto = new PageDTO(currenPage, pageSize, totalCount, field, findText);
			list = myPageService.getPagelist2(new PageDTO(currenPage, pageSize, totalCount, field, findText));
		}
		
		HttpSession session = request.getSession();
		OlookUserDTO user = (OlookUserDTO)session.getAttribute("loginUser");
		
		modelMap.put("page", pageDto);
		modelMap.put("list", list);
		model.addAttribute("loginUser",user);
		model.addAllAttributes(modelMap);
	
		ModelAndView mav = new ModelAndView();
		
		mav.addObject(model);
		mav.setViewName("olookUser/myPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/updateUser",method = RequestMethod.GET)
	public void updateUserView(HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 session.getAttribute("loginUser");
	}
	  
	@RequestMapping(value = "/updateUser",method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute OlookUserDTO user, Model model, HttpSession session) throws IllegalStateException, IOException {
		 String filename = null;
		 MultipartFile uploadFile = user.getUploadFile();
		 if(!uploadFile.isEmpty()) {
			 String orginalFileName = uploadFile.getOriginalFilename();
			 user.setUser_filename(orginalFileName);
			 String ext = FilenameUtils.getExtension(orginalFileName);
			 UUID uuid = UUID.randomUUID();
			 filename = uuid + "." + ext;
			 uploadFile.transferTo(new File("C:\\image\\"+filename));
			 
			 String oPath = "C:\\image\\"+filename;
			 File oFile = new File(oPath);
			 
	         int index = oPath.lastIndexOf(".");
	         String ext2 = oPath.substring(index + 1); // 파일 확장자

	         String tPath = oFile.getParent() + File.separator + "p-" + oFile.getName(); // 썸네일저장 경로
	         File tFile = new File(tPath);
	         
	         double ratio = 2; // 이미지 축소 비율
	         int tWidth;
	         int tHeight;
	         
			try {
				BufferedImage oImage = ImageIO.read(oFile);
	         if(((int) (oImage.getWidth() / ratio)) < 440) {
	               tWidth = 440;
	            }else {
	               tWidth = (int) (oImage.getWidth() / ratio);
	            }
	            if(((int) (oImage.getHeight() / ratio)) < 440) {
	               tHeight = 440;
	            }else {
	               tHeight = (int) (oImage.getHeight() / ratio);
	            }
	          
	         BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
	         Graphics2D graphic = tImage.createGraphics();
	         Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
	         graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
	         graphic.dispose(); // 리소스를 모두 해제
	         ImageIO.write(tImage, ext2, tFile);

			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		 user.setUser_filename(filename);
		 myPageService.updateUser(user);
		 System.out.println(filename);
		 
		 ModelAndView mav = new ModelAndView();
		 
//		 mav.addObject("loginUser",user);
		 mav.setViewName("olookUser/olookUserPage");
		
		 session.invalidate();

		 return mav;
	 }
	   
	@RequestMapping("/detailBoard")
	public String detailView(int idx, Model model, HttpServletRequest request) {
		HttpSession session  = request.getSession();
		session.getAttribute("loginUser");
		myPageService.cnt2(idx);
		model.addAttribute("bean",myPageService.getBoardOne2(idx));
		model.addAttribute("cmtlist",cmtService.getCmtList(idx));
		model.addAttribute("cr","\n");
		
		return "lookboard/detail";
	}

	@RequestMapping("/deleteAction")
	public String delete(int idx) {
		   likeService.likedelete2(idx);
		   cmtService.boarddelete(idx);
		   boardService.delete(idx);
		
		   return "olookUser/myPage";
		}
	
	@RequestMapping(value = "update")
	public void update(int idx, Model model) {
		model.addAttribute("bean",myPageService.getBoardOne2(idx));
		model.addAttribute("cr","\n");
	}
	
	@RequestMapping(value = "updateAction",method = RequestMethod.POST)
	public String updateAction(LookboardDTO Lookboard) {
		boardService.update(Lookboard);
		
		return "redirect:/olookUser/myPage";
	}
	
	@RequestMapping(value = "commentAction", method = RequestMethod.POST)
	public String commentAction(LookCommentDTO lookCmt, int idx, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		OlookUserDTO user = (OlookUserDTO) session.getAttribute("loginUser");
		if(lookCmt.getLook_name() == user.getUser_email()) {
			model.addAttribute("message3","자신의 글에는 댓글을 달 수 없습니다.");
		}
		return "redirect:/olookUser/myPage";
	}
	
	@RequestMapping(value = "commentdeleteAction")
	public String commentdeleteAction(int cmtidx, int idx) {
		cmtService.cmtdelete(cmtidx);
		boardService.cmt(idx);
		return "redirect:/olookUser/myPage";
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/");
		return mav;
	}
		
//	관리자 로그인 시 강제 회원 탈퇴기능
//	@RequestMapping(value = "/forcedEviction",method = RequestMethod.GET)
//	public void forcedEvictionView() {
//		
//	}
//	
//	@RequestMapping(value = "/forcedEviction",method = RequestMethod.POST)
//	public ModelAndView forcedEviction(String user_email) {
//		
//		OlookUserDTO dto = new OlookUserDTO();
//		dto.setUser_email(user_email);
//		
//		myPageService.adminforcedEviction(dto);
//		
//		ModelAndView mav = new ModelAndView();
//		
//		if(dto.getUser_email() != null) {
//			mav.setViewName("/");
//			mav.addObject("message","정상적으로 강제탈퇴 처리 되었습니다.");
//		}else {
//			mav.setViewName("lookUser/forcedEviction");
//			mav.addObject("message","회원 목록에 없는 회원입니다. 다시 확인해주세요.");
//		}
//		
//		return null;
//		
//	}
	
	
	
	
	
}
