package bigdata3.service;

import java.util.List;

import bigdata3.domain.Menu;

public interface MenuService {
  public List<Menu> list(int start, int end);
  public Menu selectOne(int menuNo);
  public void insert(Menu menu);
  public void update(Menu menu);
  public void delete(int menuNo);
  public int count();
}
