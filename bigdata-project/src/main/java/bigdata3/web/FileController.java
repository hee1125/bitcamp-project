package bigdata3.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import bigdata3.domain.Upload;
import bigdata3.service.UploadService;
import bigdata3.utils.FileSystem;

@Controller
@RequestMapping("/file")
public class FileController {
/*
  @Autowired
  UploadService uploadService;

  @RequestMapping("form")
  public String form() {
    return "test/filetest";
  }

  @RequestMapping("insert")
  public void insert(MultipartFile file) throws Exception {
    Upload upload = new Upload();
    FileSystem fileSystem = new FileSystem();
    if (file != null) {
      String fileName = file.getOriginalFilename();
      String newFileName = fileSystem.newFileName();
      upload.setFileName(fileName);
      upload.setNewFileName(newFileName);
      uploadService.insert(upload);
      uploadService.fileUpload(file, newFileName);
    }
  }

  @RequestMapping("/download/{filename}")
  public ResponseEntity<Resource> download(@PathVariable String fileName) throws Exception {
    Resource file = uploadService.fileDownload(fileName);

    BodyBuilder bodyBuilder = ResponseEntity.ok();

    bodyBuilder.header(HttpHeaders.CONTENT_DISPOSITION, "attachment: filename=\"" + fileName + "\"");

    return bodyBuilder.body(file);
  }*/
}
