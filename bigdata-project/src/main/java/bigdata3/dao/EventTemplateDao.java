package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.EventTemplate;

public interface EventTemplateDao {
  // 작성
  public void insert(EventTemplate Template);
  public void delete(int templateNo);
  List<EventTemplate> selectListByEventTemplate(Map<String,Object> valueMap);
}
