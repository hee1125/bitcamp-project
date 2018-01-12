package bigdata3.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import bigdata3.domain.Board;

public interface BoardService {
  public List<Board> list(int start, int end);

  public Board detail(int boardNo);

  public void insert(Board board);

  public void update(Board board);

  public void delete(int boardNo);

  public int count();
  
  public void increaseHit(int boardNo, HttpSession session);
  
}
