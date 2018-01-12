package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.Menu;

public interface MenuDao {
  public List<Menu> list(Map<String, Object> menuMap);
  public List<Menu> noPaging(Menu menu);
  public Menu selectOne(int menuNo);
  public void insert(Menu menu);
  public void update(Menu menu);
  public void delete(int menuNo);
  public int count();
}
