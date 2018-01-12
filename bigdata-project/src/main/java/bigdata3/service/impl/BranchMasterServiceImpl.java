package bigdata3.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.dao.BranchMasterDao;
import bigdata3.domain.BranchMaster;
import bigdata3.service.BranchMasterService;

@Service
public class BranchMasterServiceImpl implements BranchMasterService{

	@Autowired
	BranchMasterDao branchMasterDao;
	
	public List<BranchMaster> list(int pageNo, int pageSize) throws Exception{
		HashMap<String, Object> valueMap = new HashMap<>();
		valueMap.put("startIndex", (pageNo - 1) * pageSize);
		valueMap.put("pageSize", pageSize);
		
		return branchMasterDao.selectList(valueMap);
		  
	}
	
	  
//	public BranchMaster get(int no) throws Exception{
//		return branchMasterDao.selectOne(no);
//		  
//	}
	  
	public BranchMaster getByEmailPassword(String email, String password) throws Exception{
		HashMap<String,Object> valueMap = new HashMap<>();
		valueMap.put("email", email);
		valueMap.put("password", password);
		
		return branchMasterDao.selectOneByEmailPassword(valueMap);
		
	}
	  
	public void add(BranchMaster branchMaster) throws Exception{
		branchMasterDao.insert(branchMaster);
	}
	  
	public void update(BranchMaster branchMaster) throws Exception{
		branchMasterDao.update(branchMaster);
	}
	  
	public void remove(int no) throws Exception{
		branchMasterDao.delete(no);
	}
}
