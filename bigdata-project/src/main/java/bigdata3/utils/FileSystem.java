package bigdata3.utils;

import java.util.HashMap;

import org.springframework.http.MediaType;

public class FileSystem {
	private static HashMap<String, MediaType> mediaMap;
	// 일반 파일용
	private final static String PREFIX = "file_";
	// 썸네일용
	private final static String PREFIX2 = "thumb_";
	// 파일명 재정의 구분번호용
	private int count = 0;

	// 파일명을 받아와서 확장자를 구분하는 메서드
	public String fileFormat(String fileName) {
		String fileForm = fileName.substring(fileName.lastIndexOf(".") + 1);
		return fileForm;
	}
	
	public static MediaType getMediaType(String type) {
		// 이미지 확장자 타입을 담을 해시맵 객체 생성
		mediaMap = new HashMap<>();
		mediaMap.put("PNG",MediaType.IMAGE_PNG);
		mediaMap.put("JPG",MediaType.IMAGE_JPEG);
		mediaMap.put("GIF",MediaType.IMAGE_GIF);
		// 이미지 타입을 담고 있는 Map 반환, 이미지 파일이 아닐 경우 null반환
		return mediaMap.get(type.toUpperCase());
	}
	
	// 파일명 중복방지를 위해 새로운 형식으로 파일명 처리
	public String newFileName() {
		// 재정의 되는 파일명 뒤의 번호는 1000이상이되면 0으로 초기화
		if (count > 1000) {
			count = 0;
		}
		// 파일명 재정의
		return PREFIX + System.currentTimeMillis() + "_" + (count++);
	}
	
	public String thumbName() {
    // 재정의 되는 파일명 뒤의 번호는 1000이상이되면 0으로 초기화
    if (count > 1000) {
      count = 0;
    }
    // 파일명 재정의
    return PREFIX2 + System.currentTimeMillis() + "_" + (count++);
  }
}
