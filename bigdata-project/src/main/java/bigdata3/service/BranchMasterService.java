package bigdata3.service;

import java.util.List;

import bigdata3.domain.BranchMaster;

public interface BranchMasterService {
	  List<BranchMaster> list(int pageNo, int pageSize) throws Exception;
//	  BranchMaster get(int no) throws Exception;
	  BranchMaster getByEmailPassword(String email, String password) throws Exception;
	  void add(BranchMaster branchMaster) throws Exception;
	  void update(BranchMaster branchMaster) throws Exception;
	  void remove(int no) throws Exception;


}
