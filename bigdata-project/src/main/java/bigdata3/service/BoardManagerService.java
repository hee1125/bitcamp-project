package bigdata3.service;

import java.util.List;

import bigdata3.domain.BoardManager;

public interface BoardManagerService {

  public List<BoardManager> list(int startIndex, int pageSize);

  public void insertBoard(BoardManager boardManager);

  public void updateBoard(BoardManager boardManager);

  public void deleteBoard(int boardManagerNo);

}
