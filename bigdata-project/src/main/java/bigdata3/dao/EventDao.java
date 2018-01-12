package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.Event;

public interface EventDao {
  // 작성
  int insert(Event event);
  int delete(int branchNo);
  List<Event> selectList(Map<String,Object> valueMap); // Branch 리스트 기능
  Event selectOne(int no);
}
