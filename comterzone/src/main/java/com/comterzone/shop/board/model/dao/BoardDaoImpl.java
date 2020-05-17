package com.comterzone.shop.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.comterzone.shop.board.model.vo.Attachment;
import com.comterzone.shop.board.model.vo.Board;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public List<Board> selectBoard(SqlSessionTemplate session, int cPage, int numPerPage) {
		return session.selectList("board.selectBoard",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, Board b) {
		// TODO Auto-generated method stub
		return session.insert("board.insertBoard",b);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate session, Attachment a) {
		// TODO Auto-generated method stub
		return session.insert("board.insertAttachment",a);
	}

	@Override
	public Board selectBoard(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectView",no);
	}

	@Override
	public List<Attachment> selectFiles(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectFiles",no);
	}
	
	

	
	
}
