package com.hebut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebut.dao.BillboardDao;
import com.hebut.entity.Billboard;
import com.hebut.service.BillboardService;
import com.hebut.util.TimeUtil;

@Service
public class BoardServiceImpl implements BillboardService {

	@Autowired
	BillboardDao boardDao;

	@Override
	public void deleteBillboard(int boardId) {
		boardDao.deleteBoardByBoardId(boardId);
	}

	@Override
	public void addBillboard(String title, String detail) {
		Billboard billboard = new Billboard();
		billboard.setTitle(title);
		billboard.setDetail(detail);
		billboard.setCreate_time(TimeUtil.getDate());
		boardDao.addBoard(billboard);
	}

	@Override
	public Billboard getBoardDetail(int boardId) {
		Billboard billboard = boardDao.selectBoardByBoardId(boardId);		
		return billboard;
	}

	@Override
	public List<Billboard> getBoards() {
		List<Billboard> boards = boardDao.selectBoards();
		TimeUtil.setBoardDate(boards);
		return boards;
	}
	
}
