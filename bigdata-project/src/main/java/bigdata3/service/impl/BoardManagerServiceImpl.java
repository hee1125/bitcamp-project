package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.BoardManagerDao;
import bigdata3.domain.BoardManager;
import bigdata3.service.BoardManagerService;

@Service
public class BoardManagerServiceImpl implements BoardManagerService {

  @Autowired
  BoardManagerDao boardManagerDao;

  @Override
  public List<BoardManager> list(int startIndex, int pageSize) {

    HashMap<String, Object> managerMap = new HashMap<>();
    managerMap.put("startIndex", (startIndex - 1) * pageSize);
    managerMap.put("pageSize", pageSize);
    return boardManagerDao.list(managerMap);
  }

  @Override
  public void insertBoard(BoardManager boardManager) {
    boardManagerDao.insert(boardManager);
  }

  @Override
  public void updateBoard(BoardManager boardManager) {
    boardManagerDao.update(boardManager);
  }

  @Override
  public void deleteBoard(int boardManagerNo) {
    boardManagerDao.delete(boardManagerNo);
  }

}
