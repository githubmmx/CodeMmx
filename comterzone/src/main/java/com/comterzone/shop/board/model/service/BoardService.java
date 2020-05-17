package com.comterzone.shop.board.model.service;

import java.util.List;

import com.comterzone.shop.board.model.vo.Attachment;
import com.comterzone.shop.board.model.vo.Board;

public interface BoardService {

	List<Board> selectBoard(int cPage,int numPerpage);
	int selectBoardCount();
	int insertBoard(Board b, List<Attachment> files);
	Board selectBoard(int no);
	List<Attachment> selectFiles(int no);
}
