package bigdata3.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bigdata3.domain.Branch;
import bigdata3.domain.BranchMaster;
import bigdata3.domain.Event;
import bigdata3.domain.EventTemplate;
import bigdata3.domain.Upload;
import bigdata3.service.BranchService;
import bigdata3.service.EventService;
import bigdata3.service.UploadService;
import bigdata3.utils.FileSystem;

@Controller
@RequestMapping("/event")
public class EventControl {
	
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	UploadService uploadService;
	
	@RequestMapping("eventList")
	public String list(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "20") int pageSize,
			Model model) throws Exception {

		List<Event> eventList = eventService.list(pageNo, pageSize);
		model.addAttribute("list", eventList);

		return "event/eventList";
	}
	
	@RequestMapping("add")
	public String add(Event event, MultipartFile[] photo) throws Exception {
		
		
		FileSystem fileSystem = new FileSystem();
		Upload upload = new Upload();
		ArrayList<Upload> uploadList = new ArrayList<>();
		for (MultipartFile fileItem : photo) {
			if (fileItem != null) {
				String fileName = fileItem.getOriginalFilename();
				String newFileName = fileSystem.newFileName();
				upload.setFileName(fileName);
				upload.setNewFileName(newFileName);
				uploadService.fileUpload(fileItem, newFileName);
				uploadList.add(upload);
			}
		}
		event.setUploadList(uploadList);
		eventService.add(event);
		
		return "storeManagement/main";
	}
	
	
	@RequestMapping("eventRequestPage")
	public String eventRequestPage(
			HttpSession session, 
			Model model)throws Exception {
		BranchMaster branchMaster = (BranchMaster) session.getAttribute("loginBranchMaster");
		
		//로그인한 사람의 지점정보 가져오기
		List<Branch> branchList = branchService.listByBranchNo(branchMaster.getNo());
		model.addAttribute("branchList", branchList);
		
		int no = 1;
		
		List<EventTemplate> templateList = eventService.listByTemplate(no);
		model.addAttribute("templateList", templateList);
		
		
		
		return "event/eventRequestPage";
	}
	
	
	@RequestMapping("eventConfirmPage")
	public String eventConfirmPage(int no, Model model) throws Exception {
		Event event = eventService.get(no);
		if (event == null) {
			throw new Exception(no + "번 회원이 없습니다.");
		}
		model.addAttribute("event", event);
		return "event/eventConfirmPage";

	}
	
	@RequestMapping("eventBoard")
	public void eventBoard() {
	}
	
	
	@RequestMapping("eventBoard2")
	public void eventBoard2() {
	}

}
