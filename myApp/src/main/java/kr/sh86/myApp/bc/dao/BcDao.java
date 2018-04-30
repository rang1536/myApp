package kr.sh86.myApp.bc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.sh86.myApp.bc.domain.BcUser;
import kr.sh86.myApp.bc.domain.FavorCate;
import kr.sh86.myApp.bc.domain.InduCode;
import kr.sh86.myApp.bc.domain.Target;

@Repository
public class BcDao {

	@Autowired
	private SqlSessionTemplate sql;
	
	//산업분류 관련
	public List<InduCode> selectInduCodeAll(){
		return sql.selectList("BcDao.selectInduCodeAll");
	}
	
	public List<Target> selectInduCodeAtInduCode(String indBBSmallGroup){
		return sql.selectList("BcDao.selectInduCodeAtInduCode", indBBSmallGroup);
	}
	
	public int updateTargetInduCode(Target target){
		return sql.update("BcDao.updateTargetInduCode", target);
	}
	
	
	//모든 명함목록 조회
	public List<BcUser> selectBcAll(){
		return sql.selectList("BcDao.selectBcAll");
	}
	
	//즐겨찾기 추가
	public int updateBcFavorByPoNum(BcUser bcUser) {
		return sql.update("BcDao.updateBcFavorByPoNum", bcUser);
	}
	
	//상세보기
	public BcUser selectUserByPoNum(int poNum) {
		return sql.selectOne("BcDao.selectUserByPoNum", poNum);
	}
	
	//명함검색
	public List<BcUser> selectUserByPoName(Map<String, String> params){
		return sql.selectList("BcDao.selectUserByPoName", params);
	}
	
	//명함삭제
	public int deleteUserByPoNum(int poNum) {
		return sql.delete("BcDao.deleteUserByPoNum", poNum);
	}
	
	//즐겨찾기 카테고리 조회
	public List<FavorCate> selectFavorCateAll(){
		return sql.selectList("BcDao.selectFavorCateAll");
	}
	
	//명함정보에 즐겨찾기 카테고리 등록
	public int updateUserFavorCate(BcUser bcUser) {
		return sql.update("BcDao.updateUserFavorCate", bcUser);
	}
	
	//검색옵션 조회 - JOB
	public List<String> selectJobCode(){
		return sql.selectList("BcDao.selectJobCode");
	}
	
	//검색옵션 조회 - RELATION
	public List<String> selectRelation(){
		return sql.selectList("BcDao.selectRelation");
	}
	
	//즐겨찾기 목록조회
	public List<BcUser> selectFavorListByCate(int cateNum){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cateNum", cateNum);
		return sql.selectList("BcDao.selectFavorListByCate", params);
	}
	
	//전화번호부 동기화된 번호 인서트
	public 
}
