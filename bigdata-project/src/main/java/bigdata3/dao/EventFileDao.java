package bigdata3.dao;

import bigdata3.domain.Upload;

public interface EventFileDao {
  // 작성
  public void insert(Upload upload);
  public void delete(int branchNo);
}
