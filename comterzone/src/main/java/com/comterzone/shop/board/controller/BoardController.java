package com.comterzone.shop.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.comterzone.shop.board.model.service.BoardService;
import com.comterzone.shop.board.model.vo.Attachment;
import com.comterzone.shop.board.model.vo.Board;
import com.comterzone.shop.common.PagingFactory;

@Controller
public class BoardController {

	@Autowired
	private Logger logger;
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board/boardList")
	public ModelAndView boardList(ModelAndView mv, 
			@RequestParam(required = false, defaultValue="1") int cPage, 
			@RequestParam(required=false,defaultValue="5") int numPerpage) {
		
		List<Board> list=service.selectBoard(cPage,numPerpage);
		
		//페이징처리하는 메소드를 만들어서 처리하자.!
		//cPage, numPerpage, totalData, url
		
		int totalData=service.selectBoardCount();
				
		
		logger.debug("조회결과 : "+list);
		mv.addObject("list", list);
		mv.addObject("total",totalData);
		mv.addObject("pageBar",PagingFactory.getPage(totalData, cPage, numPerpage, "/spring/board/boardList"));
		mv.setViewName("board/boardList");
		
		return mv;
		
	}
	
	@RequestMapping("/board/boardForm.do")
	public String boardForm() {
		return "board/boardForm";
	}
	
	
	@RequestMapping("/board/boardFormEnd.do")
	public ModelAndView insertBoard(ModelAndView mv, 
			Board b, MultipartFile[] upFile, HttpSession session) {
		logger.debug("게시글 : "+b);
		logger.debug("파일명 : "+upFile[0].getOriginalFilename());
		logger.debug("파일크기 : "+upFile[0].getSize());
		logger.debug("파일명 : "+upFile[1].getOriginalFilename());
		logger.debug("파일크기 : "+upFile[1].getSize());
		
		//파일저장경로 가져오기
		String path=session.getServletContext().getRealPath("/resources/upload/board");
		
		/* 파일을 저장할 객체생성 */
		List<Attachment> files=new ArrayList();
		
		
		File f=new File(path);
		//폴더가 없으면 생성
		if(!f.exists()) f.mkdirs();
		
		//파일 저장로직 구현
		//파일 리네임구성하기
		for(MultipartFile mf : upFile) {
			if(!mf.isEmpty()) {
				//파일명 생성
				String ori=mf.getOriginalFilename();
				String ext=ori.substring(ori.lastIndexOf("."));
				//파일이름 리네임
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*1000);
				String rename=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
				//rename된 이름으로 파일저장하기
				try {
					mf.transferTo(new File(path+"/"+rename));
					//파일을 실제 저장하는 메소드!
				}catch(IOException e) {
					e.printStackTrace();
				}
				Attachment a=new Attachment();
				a.setOriginalFilename(ori);
				a.setRenamedFilename(rename);
				files.add(a);
			}
		}
		//board b객체, files 리스트를 service에게 전달
		int result=0;
		try {
			result=service.insertBoard(b,files);
		}catch(RuntimeException e){
			for(Attachment a : files) {
				File delF=new File(path+"/"+a.getRenamedFilename());
				if(delF.exists()) {
					delF.delete();
				}
			}
		}
		
		
		mv.setViewName("redirect:/board/boardList");
		
		
		return mv;
	}
	
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(ModelAndView mv, int no) {
		
		mv.addObject("board",service.selectBoard(no));
		
		mv.addObject("files",service.selectFiles(no));
		
		mv.setViewName("board/boardView");
		
		return mv;
	}
	
	@RequestMapping("/board/fileDownload")
	public void fileDownload(String ori,String rename,
			HttpSession session,
			@RequestHeader(value="user-agent") String header,
			ServletOutputStream out, HttpServletResponse res) {
		//파일경로
		String path=session.getServletContext().getRealPath("/resources/upload/board");
		BufferedInputStream bis=null;
		File f=new File(path+"/"+rename);
		//파일과 연결된 스트림, 보낼 대상의 스트림
		try {
			FileInputStream fis=new FileInputStream(f);
			bis=new BufferedInputStream(fis);
			//분기처리
			
			boolean isMSIE=header.indexOf("MSIE")!=-1||
					header.indexOf("Trident")!=-1;
			String oriName="";
			if(isMSIE) {
				oriName=URLEncoder.encode(ori,"UTF-8");
				oriName=oriName.replaceAll("\\+", "%20");
			}else {
				oriName=new String(ori.getBytes("UTF-8"),"ISO-8859-1");
			}
			//응답설정세팅
			res.setContentType("application/otect-stream;charset=UTF-8");
			res.addHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
			
			int read=-1;
			while((read=bis.read())!=-1) {
				out.write(read);
			}	
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				bis.close();
				out.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	
		
	}
	
}







