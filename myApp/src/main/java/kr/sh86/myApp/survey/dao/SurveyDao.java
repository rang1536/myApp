package kr.sh86.myApp.survey.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.sh86.myApp.survey.domain.Mms;
import kr.sh86.myApp.survey.domain.Response;
import kr.sh86.myApp.survey.domain.Users;

@Repository
public class SurveyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//신규 응답입력
	public int insertRes(Response response) {
		return sqlSession.insert("SurveyDao.insertRes", response);
	}

	//응답자 조회
	public Users selectUser(int userNo) {
		return sqlSession.selectOne("SurveyDao.selectUser", userNo);
	}
	
	// 응답여부 확인
	public int selectCountRes(int userNo) {
		return sqlSession.selectOne("SurveyDao.selectCountRes", userNo);
	}
	
	// 문항별 응답내용 갱신
	public int updateRes(Response response) {
		return sqlSession.update("SurveyDao.updateRes", response);
	}
	
	// 응답자 마지막 응답번호 수정
	public int updateUserLastComplete(Users user) {
		return sqlSession.update("SurveyDao.updateUserLastComplete", user);
	}
	
	// 응답번호 조회
	public int selectResNo(int userNo) {
		return sqlSession.selectOne("SurveyDao.selectResNo", userNo);
	}
	
	//문자 > 전체응답자 조회
	public List<Users> selectUserAll(){
		return sqlSession.selectList("SurveyDao.selectUserAll");
	}
	
	//문자 전송
	public int sendMmsToSelected(Mms mms) {
		return sqlSession.insert("SurveyDao.sendMmsToSelected", mms);
	}
	
	// 총카운트
	public int selectUserCount() {
		return sqlSession.selectOne("SurveyDao.selectUserCount");
	}
	
	// 응답자 총카운트
	public int selectResCount() {
		return sqlSession.selectOne("SurveyDao.selectResCount");
	}
	
	// 모든답변응답자
	public int selectResAllCount() {
		return sqlSession.selectOne("SurveyDao.selectResAllCount");
	}
	
	// 문자전송 실패자
	public int selectMmsFailCount() {
		return sqlSession.selectOne("SurveyDao.selectMmsFailCount");
	}
	
	// 문자전송 실패자
	public List<Users> selectMmsFailList() {
		return sqlSession.selectList("SurveyDao.selectMmsFailList");
	}
		
	//미응답자 조회
	public List<Users> selectNoResList(){
		return sqlSession.selectList("SurveyDao.selectNoResList");
	}
	
	//문자발송내역 인서트
	public int insertMmsReport() {
		return sqlSession.insert("SurveyDao.insertMmsReport");
	}
	
	//문자발송내역 조홰ㅣ
	public List<String> selectSendReport(){
		return sqlSession.selectList("SurveyDao.selectSendReport");
	}
	
	//문자재발송자 조회
	public List<Users> selectReSendList(){
		return sqlSession.selectList("SurveyDao.selectReSendList");
	}
}
