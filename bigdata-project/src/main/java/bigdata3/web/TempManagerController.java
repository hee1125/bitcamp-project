package bigdata3.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bigdata3.domain.TempManager;
import bigdata3.domain.Upload;
import bigdata3.service.TempManagerService;
import bigdata3.service.UploadService;
import bigdata3.utils.FileSystem;

@Controller
@RequestMapping("template")
//@SessionAttributes("loginInfo")
public class TempManagerController {
  
  @Autowired TempManagerService tempManagerService;
  
  @Autowired UploadService uploadService;
  
  @RequestMapping("registform")
  public String registform() {
    return "template/registform";
  }
  
  public String list(@RequestParam(defaultValue="1") int startIndex,
      @RequestParam(defaultValue="5") int pageSize,
      Model model) {
    
    List<TempManager> tempList = tempManagerService.list(startIndex, pageSize);
    model.addAttribute("tempList", tempList);
    
    return "";
  }
  
  
  @RequestMapping("insert")
  public String insert(TempManager tempManager, 
//      @ModelAttribute("loginInfo") Member member,
      MultipartFile file) throws Exception {
    System.out.println(file);
    Upload upload = new Upload();
    if (file != null && !file.isEmpty()) {
      FileSystem fileUtil = new FileSystem();
      String fileName = file.getOriginalFilename();
      String newFilename = fileUtil.newFileName();
      String filePath = uploadService.fileUpload(file, newFilename);
      upload.setFileName(fileName);
      upload.setNewFileName(newFilename);
      upload.setFilePath(filePath);
    }
    tempManager.setUpload(upload);
//    String manager = member.getMemberGrade();
//    tempManager.setManager(manager);
    System.out.println(tempManager);
    tempManagerService.insert(tempManager);
    
    return "";
  }

}
