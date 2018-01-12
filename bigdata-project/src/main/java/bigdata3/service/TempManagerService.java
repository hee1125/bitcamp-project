package bigdata3.service;

import java.util.List;

import bigdata3.domain.TempManager;

public interface TempManagerService {
  public List<TempManager> list(int startIndex, int pageSize);
  public void insert(TempManager tempManager);
  public void update(TempManager tempManager);
  public void delete(int tempManagerNo);
}
