package bigdata3.dao;

import java.util.List;
import java.util.Map;

import bigdata3.domain.Branch;

public interface BranchDao {
	List<Branch> selectList(Map<String,Object> valueMap); // Branch 리스트 기능
	List<Branch> selectListByBranchNo(int no);
	Branch selectOne(int no); // Branch 지점의 상세 정보 보기 기능
	int insert(Branch branch); // Branch 정보 추가
	int delete(int no); // Branch 정보 삭제
	int update(Branch branch); // Branch 정보 수정
//	void insertPhoto(Map<String,Object> valueMap); // Branch 사진 정보 추가
//	List<String> selectPhotoList(int branchNo); // Branch 사진 정보 보기
//	void deletePhoto(int branchNo); // Branch 사진 정보 삭제

}
