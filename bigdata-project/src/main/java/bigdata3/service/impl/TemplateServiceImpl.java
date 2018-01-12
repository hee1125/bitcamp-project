package bigdata3.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.TemplateDao;
import bigdata3.domain.Template;
import bigdata3.service.TemplateService;


@Service
public class TemplateServiceImpl implements TemplateService {
  
  @Autowired TemplateDao templateDao;
  
  @Override
  public List<Template> selectByTempType(String templateType) {
    return templateDao.selectByTempType(templateType);
  }

  @Override
  public void insert(Template template) {
    templateDao.insert(template);
  }

  @Override
  public void update(Template template) {
    templateDao.update(template);
  }

  @Override
  public void delete(int templateNo) {
    templateDao.delete(templateNo);
  }

}
