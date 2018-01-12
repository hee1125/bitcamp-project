package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.TempManager;

public interface TempManagerDao {
  public List<TempManager> list(Map<String, Object> tempMap);
  public void insert(TempManager tempManager);
  public void update(TempManager tempManager);
  public void delete(int tempManagerNo);
  public void insertFile(Map<String, Object> tempMap);
}
