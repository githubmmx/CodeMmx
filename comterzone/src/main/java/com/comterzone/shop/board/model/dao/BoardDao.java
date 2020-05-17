package com.comterzone.shop.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.comterzone.shop.board.model.vo.Attachment;
import com.comterzone.shop.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoard(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectBoardCount(SqlSessionTemplate session);
	int insertBoard(SqlSessionTemplate session, Board b);
	int insertAttachment(SqlSessionTemplate session, Attachment a);

	Board selectBoard(SqlSessionTemplate session, int no);
	List<Attachment> selectFiles(SqlSessionTemplate session, int no);
	
}
