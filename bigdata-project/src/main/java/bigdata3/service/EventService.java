package bigdata3.service;

import java.util.List;

import bigdata3.domain.Event;
import bigdata3.domain.EventTemplate;

public interface EventService {
	 
	List<EventTemplate> listByTemplate(int no) throws Exception;
	List<Event> list(int pageNo, int pageSize) throws Exception;
	void add(Event event) throws Exception;
	Event get(int no) throws Exception;
	  

}
