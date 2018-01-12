package bigdata3.service;

import java.util.List;

import bigdata3.domain.Reply;

public interface ReplyService {
	public List<Reply> list(int boardNo);
	public void insert(Reply reply);
	public void update(Reply reply);
	public void delete(int replyNo);
}
