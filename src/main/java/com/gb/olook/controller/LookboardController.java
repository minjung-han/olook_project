package com.gb.olook.controller;



import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.gb.olook.model.LookCommentDTO;
import com.gb.olook.model.LookboardDTO;
import com.gb.olook.model.OlookLikeDTO;
import com.gb.olook.model.PageDTO;
import com.gb.olook.service.LookboardService;
import com.gb.olook.service.LookcommentService;
import com.gb.olook.service.OlookLikeService;
import com.gb.olook.service.OlookUserService;

@Controller
@RequestMapping("/lookboard") //일단 폴더 만들어 놨음 변화가 필요함!
public class LookboardController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LookboardService service; 
	
	@Autowired
	LookcommentService cmtservice;
	
	@Autowired
	OlookUserService user;
	
	@Autowired
	OlookLikeService like;
	
	@RequestMapping(value = { "/", "/list" })
	private void pageList(String page, String field, String findText, Model model) {
		int currentPage; // 현재 페이지
		List<LookboardDTO> list;
		int totalCount;
		int pageSize = 4;
		if (page == null || page.trim().length() == 0)
			currentPage = 1;
		else
			currentPage = Integer.parseInt(page); // page파라미터가 숫자로 넘어온경우만 실행
		PageDTO pageDto;
		ModelMap modelMap = new ModelMap(); // 검색 기능사용할 때 검색필드와 검색키워드 뷰에 전달된다.

		totalCount = service.getCount();
		pageDto = new PageDTO(currentPage, pageSize, totalCount, field, findText);
		list = service.getPagelist(new PageDTO(currentPage, pageSize, totalCount, field, findText));
		modelMap.put("field", field);
		modelMap.put("findText", findText);

		if (findText != null) { // 검색하는 경우
			totalCount = service.searchCount(modelMap); // 서비스 메소드 타입 변경예정
			pageDto = new PageDTO(currentPage, pageSize, totalCount, field, findText);
			list = service.searchList(pageDto);
		} else { // 검색안하는 경우
			totalCount = service.getCount();
			pageDto = new PageDTO(currentPage, pageSize, totalCount, field, findText);
			pageDto = new PageDTO(currentPage, pageSize, totalCount, field, findText);
			list = service.getPagelist(new PageDTO(currentPage, pageSize, totalCount, field, findText));// 주석처리 예정
		}

		modelMap.put("page", pageDto); // view에게 전달할 모델객체 설정
		modelMap.put("list", list);
		model.addAllAttributes(modelMap); // 위에 4개의 put 설정은 map객체를 애트리뷰트에 저장한다.

	}

		//좋아요 (리스트에서)
	@RequestMapping(value = "likeAction")
	public String likeAction(OlookLikeDTO dto, Model model) {
		if (dto.getUser_email() == "") {
			model.addAttribute("message2", "로그인 후 이용해주세요");
			return "olookUser/alertLogin";
		} else {
			if (like.like(dto) == 0) {
				like.likeinsert(dto);
			} else {
				like.likedelete(dto);
			}
			service.likeupdate(dto.getLook_ref());
			return "redirect:/lookboard/list?page=1";
		}
	}
		//좋아요 (디테일에서)
	@RequestMapping(value="likeAction2")
	public String likeAction2(OlookLikeDTO dto) {
		if(like.like(dto) == 0) {
			like.likeinsert(dto);
		}else {
			like.likedelete(dto);
		}
		int idx = dto.getLook_ref();
		service.rcnt(idx);
		service.likeupdate(dto.getLook_ref());
		return "redirect:/lookboard/detail?idx="+idx+"&page=1";
	}

	// 글쓰기 -view
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert(int page, Model model,HttpServletRequest request) {
	      model.addAttribute("page", page);
	      HttpSession session = request.getSession();
	      session.getAttribute("loginUser");
	} // view이름은 insert
		   
		   
	// 글쓰기 - 저장 : save()메소드 리다이렉트 list로.
	   @RequestMapping(value = "/insert", method = RequestMethod.POST)
	   public String save(@ModelAttribute LookboardDTO LookBoard) throws IOException {
	      String fileName = null;
	      MultipartFile uploadFile = LookBoard.getUploadFile();
	      if (!uploadFile.isEmpty()) {
	         String originalFileName = uploadFile.getOriginalFilename();
	         LookBoard.setLook_filename(originalFileName);
	         String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
	         UUID uuid = UUID.randomUUID(); // UUID 구하기
	         fileName = uuid + "." + ext;
	         uploadFile.transferTo(new File("C:\\image\\" + fileName));
	         //-------------------------------
	         String oPath = "C:\\image\\"+fileName; // 원본 경로
	         File oFile = new File(oPath);

	         int index = oPath.lastIndexOf(".");
	         String ext2 = oPath.substring(index + 1); // 파일 확장자

	         String tPath = oFile.getParent() + File.separator + "t-" + oFile.getName(); // 썸네일저장 경로
	         File tFile = new File(tPath);
	         //int tWidth = 200; // 생성할 썸네일이미지의 너비
	         //int tHeight = 200; // 생성할 썸네일이미지의 높이
	         double ratio = 2; // 이미지 축소 비율
	         int tWidth;
	         int tHeight;
	         try {
	            BufferedImage oImage = ImageIO.read(oFile); // 원본이미지
	            System.out.println("width = " + ((int) (oImage.getWidth() / ratio)));
	            System.out.println("height = " + ((int) (oImage.getHeight() / ratio)));
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
	            
	            System.out.println("조정 후 width = " + tWidth);
	            System.out.println("조정 후 height = " + tHeight);
	            //int tWidth = (int) (oImage.getWidth() / ratio); // 생성할 썸네일이미지의 너비
	            //int tHeight = (int) (oImage.getHeight() / ratio); // 생성할 썸네일이미지의 높이
	            //int tWidth = 440; // 생성할 썸네일이미지의 너비
	            //int tHeight = 440; // 생성할 썸네일이미지의 높이
	            
	            BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
	            Graphics2D graphic = tImage.createGraphics();
	            Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
	            graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
	            graphic.dispose(); // 리소스를 모두 해제

	            ImageIO.write(tImage, ext2, tFile);
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	         //-------------------------------
	      }
	      LookBoard.setLook_filename(fileName);
	      service.insert(LookBoard);
	      return "redirect:/lookboard/list?page=1";
	   }
	
		
		
	// 디테일
	@RequestMapping("/detail")
	public void detail(int idx, int page, Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		// 파라미터 처리
		// servie 메소드 호출
		// view에 리턴받은 DTO를 전달
		service.cnt(idx);
		model.addAttribute("bean", service.getBoardOne(idx));
		// model.addAttribute("cmtlist", service.);
		// list 에서 전달받은 현재페이지를 다시 detail.jsp에게도 전달 -> 목록이동시에 원래보던 페이지로 이동
		model.addAttribute("page", page);
		// 댓글 리스트 가져오기 -> model 객체에 저장한다.
		model.addAttribute("cmtlist", cmtservice.getCmtList(idx));
		System.out.println("cmtlist");
		model.addAttribute("cr", "\n"); // textarea에서 입력된 줄바꿈을 화면 출력시 <br>변환하기 위해서 필요함.
		// view 이름은? 자동으로 detail.jsp
	}
	
	// 삭제
	@RequestMapping("/deleteAction")
	public String delete(int idx) {
	   like.likedelete2(idx);
	   cmtservice.boarddelete(idx);
	   service.delete(idx);
	
	   return "redirect:/lookboard/list?page=1";
	}
	
	//수정페이지 들어가기
	@RequestMapping("update")
	public void update(int idx, Model model) {
		model.addAttribute("bean", service.getBoardOne(idx));
		model.addAttribute("cr", "\n");
	}
	
	//수정 
	@RequestMapping(value="updateAction",method=RequestMethod.POST)
	public String updateAction(LookboardDTO LookBoard) {
		service.update(LookBoard);
		
		return "redirect:/lookboard/list?page=1";
	}
	
	//댓글추가,수정
	@RequestMapping(value = "commentAction", method = RequestMethod.POST)
	public String commentAction(LookCommentDTO LookComment, int idx, Model model) {
		System.out.println("아이디값 = " + LookComment.getLook_name());
		if (LookComment.getLook_name() == "") {
			model.addAttribute("message2", "로그인 후 이용해주세요");
			return "olookUser/alertLogin";
		} else {
			if (LookComment.getLook_cmtidx() == 0) {
				cmtservice.cmtinsert(LookComment);
				service.cmt(idx);
			} else {
				cmtservice.cmtupdate(LookComment);
			}

			return "redirect:/lookboard/detail?idx=" + idx + "&page=1";
		}
	}
	
	//댓글삭제
	@RequestMapping(value="commentdeleteAction")
	public String commentdeleteAction(int cmtidx,int idx) {
		cmtservice.cmtdelete(cmtidx);
		service.cmt(idx);
		return "redirect:/lookboard/detail?idx="+idx+"&page=1";
	}
	//댓글수정
	/*
	 * @RequestMapping(value="commentupdateAction") public String
	 * commentupdateAction(int cmtidx,int idx, String name,String content) {
	 * cmtservice.cmtupdate(null); return
	 * "redirect:/lookboard/detail?idx="+idx+"&page=1"; }
	 */
	
}
