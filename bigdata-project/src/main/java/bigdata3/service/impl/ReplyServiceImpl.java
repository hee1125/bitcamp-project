package bigdata3.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.ReplyDao;
import bigdata3.domain.Reply;
import bigdata3.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	ReplyDao replyDao;

	@Override
	public List<Reply> list(int boardNo) {
		return replyDao.list(boardNo);
	}

	@Override
	public void insert(Reply reply) {
		replyDao.insert(reply);
	}

	@Override
	public void update(Reply reply) {
		replyDao.update(reply);
	}

	@Override
	public void delete(int replyNo) {
		replyDao.delete(replyNo);
	}

}
