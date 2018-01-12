package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.MenuDao;
import bigdata3.domain.Menu;
import bigdata3.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
  
  @Autowired MenuDao menuDao;
  
  @Override
  public List<Menu> list(int start, int end) {
    HashMap<String, Object> menuMap = new HashMap<>();
    menuMap.put("start", (start-1)*end);
    menuMap.put("end", end);
    return menuDao.list(menuMap);
  }

  @Override
  public Menu selectOne(int menuNo) {
    return menuDao.selectOne(menuNo);
  }

  @Override
  public void insert(Menu menu) {
    menuDao.insert(menu);
  }

  @Override
  public void update(Menu menu) {
    menuDao.update(menu);
  }

  @Override
  public void delete(int menuNo) {
    menuDao.delete(menuNo);
  }

  @Override
  public int count() {
    return menuDao.count();
  }
  
}
