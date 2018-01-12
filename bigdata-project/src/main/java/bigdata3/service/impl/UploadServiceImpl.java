package bigdata3.service.impl;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bigdata3.dao.BranchDao;
import bigdata3.dao.FileDao;
import bigdata3.domain.Upload;
import bigdata3.service.UploadService;
import bigdata3.utils.FileSystem;

@Service
public class UploadServiceImpl implements UploadService {

	@Autowired
	FileDao fileDao;
	@Autowired
	BranchDao branchDao;

	private final static String PATH = "/upload";
	private final static String PATH2 = "/upload/branch";
	private final static String PATH3 = "/upload/menu";
	private final static String PATH4 = "/upload/user";
	private final static String PATH5 = "/upload/docs";
	private final static String PATH6 = "/upload/iot";
	private final static String DIR = "c:/webupload/";

	@Override
	public String fileUpload(MultipartFile file, String newFileName/* , HttpSession session */) throws Exception {
		FileSystem fileSystem = new FileSystem();
		if (file.isEmpty()) {
			return null;
		}
		// 프로젝트 파일의 경로
		// String realPath = session.getServletContext().getRealPath(PATH3);
		String fileName = file.getOriginalFilename();
		String type = fileSystem.fileFormat(fileName);
		File filePath = new File(DIR + newFileName);
		// 파일의 경로로 파일 날려줌
		file.transferTo(filePath);
		if (FileSystem.getMediaType(type) != null) {
			BufferedImage sourceImg = ImageIO.read(new File(DIR + newFileName));
			BufferedImage thumbImg = new BufferedImage(300, 300, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumbImg.createGraphics();
			graphic.drawImage(sourceImg, 0, 0, 300, 300, null);
			String thumbName = DIR + fileSystem.thumbName() + "." + type;
			File thumbNail = new File(thumbName);
			ImageIO.write(thumbImg, type.toUpperCase(), thumbNail);
			return thumbName;
		}
		return newFileName;
	}

	public void insert(Upload upload) {

		fileDao.insert(upload);
		System.out.println("=================================> "+ upload);
	}

	

	// public void insert(int branchNo, Upload upload) {
	// HashMap<String,Object> valueMap = new HashMap<>();
	// valueMap.put("branchNo", branchNo);
	//
	//
	// fileDao.insert(valueMap, upload);
	//
	//
	// }

	@Override
	public Resource fileDownload(String fileName) {
		return new FileSystemResource(DIR + fileName);
	}
}
