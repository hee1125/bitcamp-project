package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.TempManagerDao;
import bigdata3.domain.TempManager;
import bigdata3.domain.Upload;
import bigdata3.service.TempManagerService;

@Service
public class TempManagerServiceImpl implements TempManagerService {
  
  @Autowired TempManagerDao tempManagerDao;
  
  @Override
  public List<TempManager> list(int startIndex, int pageSize) {
    HashMap<String, Object> tempMap = new HashMap<>();
    tempMap.put("startIndex", (startIndex-1)*pageSize);
    tempMap.put("pageSize", pageSize);
    return tempManagerDao.list(tempMap);
  }

  @Override
  public void insert(TempManager tempManager) {
    tempManagerDao.insert(tempManager);
    System.out.println("============>>>getUploadFile!!!"+tempManager.getUpload());
    this.insertFile(tempManager.getTemplateNo(), tempManager.getUpload());
  }

  @Override
  public void update(TempManager tempManager) {
    tempManagerDao.update(tempManager);
  }

  @Override
  public void delete(int tempManagerNo) {
    tempManagerDao.delete(tempManagerNo);
  }
  
  private void insertFile(int tempManagerNo, Upload upload) {
    HashMap<String, Object> tempMap = new HashMap<>();
    tempMap.put("tempManagerNo", tempManagerNo);
    tempMap.put("upload", upload);
    System.out.println("========>tempMap!!!!"+tempMap);
    tempManagerDao.insertFile(tempMap);
  }
  
}
