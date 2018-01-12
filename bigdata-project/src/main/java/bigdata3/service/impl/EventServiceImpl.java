package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.EventDao;
import bigdata3.dao.EventFileDao;
import bigdata3.dao.EventTemplateDao;
import bigdata3.domain.Branch;
import bigdata3.domain.Event;
import bigdata3.domain.EventTemplate;
import bigdata3.domain.Upload;
import bigdata3.service.EventService; 

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	EventDao eventDao;
	@Autowired
	EventTemplateDao eventTemplateDao;
	@Autowired
	EventFileDao eventFileDao;
	
	public List<Event> list(int pageNo, int pageSize) throws Exception{
		HashMap<String, Object> valueMap = new HashMap<>();
		valueMap.put("startIndex", (pageNo - 1) * pageSize);
		valueMap.put("pageSize", pageSize);
		
		return eventDao.selectList(valueMap);
		  
	}
	
	public List<EventTemplate> listByTemplate(int no) throws Exception{
		
		HashMap<String, Object> valueMap = new HashMap<>();
		valueMap.put("startIndex", (no));
		return eventTemplateDao.selectListByEventTemplate(valueMap);
		  
	}
	
	public void add(Event event) throws Exception{
		eventDao.insert(event);
		List<Upload> uploadList =event.getUploadList();
		for (Upload upload:uploadList) {
			upload.setBranchNo(event.getBno());
			upload.setEventNo(event.getNo());
			eventFileDao.insert(upload);
		}
		//this.insertPhoto(branch.getNo(), branch.getPhotoList()); // 지점 사진 추가
	}
	
	public Event get(int no) throws Exception{
		return eventDao.selectOne(no);
		  
	}
	
	
}
