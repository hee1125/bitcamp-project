package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.BranchDao;
import bigdata3.dao.BranchMasterDao;
import bigdata3.dao.FileDao;
import bigdata3.domain.Branch;
import bigdata3.domain.Upload;
import bigdata3.service.BranchService; 

@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	BranchDao branchDao;
	
	@Autowired
	BranchMasterDao branchMasterDao;
	
	@Autowired
	FileDao fileDao;
	
	public List<Branch> list(int pageNo, int pageSize) throws Exception{
		HashMap<String, Object> valueMap = new HashMap<>();
		valueMap.put("startIndex", (pageNo - 1) * pageSize);
		valueMap.put("pageSize", pageSize);
		
		return branchDao.selectList(valueMap);
		  
	}
	
	public List<Branch> listByBranchNo(int no) throws Exception{
		return branchDao.selectListByBranchNo(no);
		  
	}
	  
	public Branch get(int no) throws Exception{
		return branchDao.selectOne(no);
		  
	}
	  
	public void add(Branch branch) throws Exception{
		branchDao.insert(branch);
		
		List<Upload> uploadList =branch.getUploadList();
		for (Upload upload:uploadList) {
			
			upload.setBranchNo(branch.getNo());
			System.out.println("************" + branch.getNo());
			fileDao.insert(upload);
		}
		
		//this.insertPhoto(branch.getNo(), branch.getPhotoList()); // 지점 사진 추가
	}
	  
	public void update(Branch branch) throws Exception {
		
		int count = branchDao.update(branch);
	    if (count < 1) {
	      throw new Exception(branch.getNo() + "번 지점을 찾을 수 없습니다.");
	    }
	    
	    // 지점 사진 갱신
	    fileDao.delete(branch.getNo()); // 지점의 모든 사진을 지운다.
	    
	    List<Upload> uploadList =branch.getUploadList();
		for (Upload upload:uploadList) {
			
			upload.setBranchNo(branch.getNo());
			
			fileDao.insert(upload);
		} // 지점 사진 추가
	  
	  }
	
//	private void insertPhoto(int branchNo, List<String> photoPathList) {
//	    HashMap<String,Object> valueMap = new HashMap<>();
//	    valueMap.put("branchNo", branchNo);
//	    
//	    for (String photoPath : photoPathList) {
//	      valueMap.put("photoPath", photoPath);
//	      branchDao.insertPhoto(valueMap);
//	    }
//	  }
//	  
	public void remove(int no) throws Exception{
		fileDao.delete(no);
	    int count = branchDao.delete(no);
	    if (count < 1) {
	      throw new Exception(no + "번 지점을 찾을 수 없습니다.");
	    }
	    
	    try {
	      count = branchDao.delete(no);
	    } catch (Exception e) {}
	}
}
