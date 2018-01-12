package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.BoardManager;

public interface BoardManagerDao {
  public List<BoardManager> list(Map<String, Object> boardManagerMap);
  public void insert(BoardManager boardManager);
  public void update(BoardManager boardManager);
  public void delete(int boardManagerNo);
}
