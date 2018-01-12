package bigdata3.dao;

import java.util.List;

import bigdata3.domain.Reply;

public interface ReplyDao {
	public List<Reply> list(int boardNo);

	public void insert(Reply reply);

	public void update(Reply reply);

	public void delete(int boardNo);
}
