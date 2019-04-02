package kr.sh86.myApp.survey.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.sh86.myApp.survey.domain.Ars;
import kr.sh86.myApp.survey.domain.BioResponse;
import kr.sh86.myApp.survey.domain.BioUser;
import kr.sh86.myApp.survey.domain.CopyRight;
import kr.sh86.myApp.survey.domain.Dialing;
import kr.sh86.myApp.survey.domain.ExceptionTel;
import kr.sh86.myApp.survey.domain.Home35;
import kr.sh86.myApp.survey.domain.Mms;
import kr.sh86.myApp.survey.domain.Pomg;
import kr.sh86.myApp.survey.domain.ResData;
import kr.sh86.myApp.survey.domain.Response;
import kr.sh86.myApp.survey.domain.Result;
import kr.sh86.myApp.survey.domain.Sample;
import kr.sh86.myApp.survey.domain.Sampling;
import kr.sh86.myApp.survey.domain.SicheckUser;
import kr.sh86.myApp.survey.domain.Sinbo;
import kr.sh86.myApp.survey.domain.User;
import kr.sh86.myApp.survey.domain.Users;
import kr.sh86.myApp.survey.domain.Xroshot;

@Repository
public class SurveyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//신보 검색회원번호
	public int selectSbNum(String sbHp) {
		return sqlSession.selectOne("SurveyDao.selectSbNum", sbHp);
	}
	
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
	public int selectMmsFailCount(String lastTime) {
		return sqlSession.selectOne("SurveyDao.selectMmsFailCount",lastTime);
	}
	
	// 문자전송 실패자
	public List<Users> selectMmsFailList(String lastTime) {
		return sqlSession.selectList("SurveyDao.selectMmsFailList",lastTime);
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
	
	//selectLastMmsTime
	public List<String> selectLastMmsTime(){
		return sqlSession.selectList("SurveyDao.selectLastMmsTime");
	}
	
	//selectBestpoll
	public List<Ars> selectBestpoll(){
		return sqlSession.selectList("SurveyDao.selectBestpoll");
	}
	
	//deleteBestpoll
	public int deleteBestpoll(Ars ars){
		return sqlSession.delete("SurveyDao.deleteBestpoll", ars);
	}
	
	//익산시 조회
	public List<Sample> selectSample(){
		return sqlSession.selectList("SurveyDao.selectSample");
	}
	
	//샘플데이터 입력
	public int insertSample(Sampling sampling){
		return sqlSession.insert("SurveyDao.insertSample", sampling);
	}
	
	//응답테이블입력
	public int insertArsResultTb(Sampling sampling) {
		return sqlSession.insert("SurveyDao.insertArsResultTb", sampling);
	}
	
	//익산 나머지 대상 조회
	public List<Sample> selectAllHome(String dong){
		return sqlSession.selectList("SurveyDao.selectAllHome",dong);
	}
	
	//성별
	public List<Xroshot> selectManCount(){
		return sqlSession.selectList("SurveyDao.selectManCount");
	}
		
	//연령
	public int selectAgeCount(int length){
		return sqlSession.selectOne("SurveyDao.selectAgeCount",length);
	}
		
	//selectResForAgeCheck
	public List<String> selectResForAgeCheck(){
		return sqlSession.selectList("SurveyDao.selectResForAgeCheck");
	}
	
	//대상자추가
	public List<String> selectTels(){
		return sqlSession.selectList("SurveyDao.selectTels");
	}
	
	//결과테이블 추가
	public int insertArsResultTb2(Sampling sampling) {
		return sqlSession.insert("SurveyDao.insertArsResultTb2", sampling);
	}
	
	//결과테이블 추가
	public int insertArsResultTb3(Sampling sampling) {
		return sqlSession.insert("SurveyDao.insertArsResultTb3", sampling);
	}
	//모든응답조회
	public List<Xroshot> selectAllResArs(){
		return sqlSession.selectList("SurveyDao.selectAllResArs");
	}
	
	public List<Integer> selectArsResultKis(String tel){
		return sqlSession.selectList("SurveyDao.selectArsResultKis", tel);
	}
	
	public int deleteRepeat(int num) {
		return sqlSession.delete("SurveyDao.deleteRepeat", num);
	}
	
	public int updateArsResult(Xroshot xroshot) {
		return sqlSession.update("SurveyDao.updateArsResult", xroshot);
	}
	
	public List<Result> selectResultTb(int arsNum){
		return sqlSession.selectList("SurveyDao.selectResultTb", arsNum);
	}
	
	//selectCntTel
	public int selectCntTel(String tel){
		return sqlSession.selectOne("SurveyDao.selectCntTel", tel);
	}
	
	//selectLast
	public List<Xroshot> selectLast(){
		return sqlSession.selectList("SurveyDao.selectLast");
	}
	
	//updateLast
	public int updateLast(int num) {
		return sqlSession.update("SurveyDao.updateLast", num);
	}
	
	//selectResStat
	public List<Xroshot> selectResStat(){
		return sqlSession.selectList("SurveyDao.selectResStat");
	}
	
	//selectResStat2
	public List<Xroshot> selectResStat2(){
		return sqlSession.selectList("SurveyDao.selectResStat2");
	}
	
	//insertResult
	public int insertResult(Xroshot xroshot) {
		return sqlSession.insert("SurveyDao.insertResult", xroshot);
	}
	
	//deleteOverlap
	public int deleteOverlap() {
		return sqlSession.insert("SurveyDao.deleteOverlap");
	}
	
	// selectDataUser
	public List<User> selectDataUser(){
		return sqlSession.selectList("SurveyDao.selectDataUser");
	}
	
	// insertHome35
	public int insertHome35(User user) {
		return sqlSession.insert("SurveyDao.insertHome35", user);
	}
	
	// selectOverlap207
	public int selectOverlap207(String tel) {
		return sqlSession.selectOne("SurveyDao.selectOverlap207", tel);
	}
	
	//selectOverlapHome35
	public int selectOverlapHome35(String tel) {
		return sqlSession.selectOne("SurveyDao.selectOverlapHome35", tel);
	}
	
	//selectJbuniv
	public List<User> selectJbuniv(String sigungu){
		return sqlSession.selectList("SurveyDao.selectJbuniv", sigungu);
	}
	
	//insertSamplingImsil
	public int insertSamplingImsil(Sampling sampling) {
		return sqlSession.insert("SurveyDao.insertSamplingImsil", sampling);
	}
	
	//생진원 - 업체입력
	public int insertBioUser(BioUser bioUser) {
		return sqlSession.insert("SurveyDao.insertBioUser",bioUser);
	}
	
	//생진원 - 응답입력
	public int insertBioRes(BioResponse bioResponse) {
		return sqlSession.insert("SurveyDao.insertBioRes",bioResponse);
	}
	
	//생진청 - 응답수
	public int selectBioResCount() {
		return sqlSession.selectOne("SurveyDao.selectBioResCount");
	}
	
	//예외번호조회
	public List<ExceptionTel> selectExceptionNum(){
		return sqlSession.selectList("SurveyDao.selectExceptionNum");
	}
	
	//예외번호 삭제
	public int deleteExcTel(String tel) {
		return sqlSession.delete("SurveyDao.deleteExcTel", tel);
	}
	
	//selectResJj
	public List<Xroshot> selectResJj(){
		return sqlSession.selectList("SurveyDao.selectResJj");
	}
	
	//selectDateForCompare
	public int selectDateForCompare(String phoneNumber) {
		return sqlSession.selectOne("SurveyDao.selectDateForCompare", phoneNumber);
	}
	
	//insertResJj
	public int insertResJj(Xroshot xroshot) {
		return sqlSession.insert("SurveyDao.insertResJj", xroshot);
	}
	
	//지역별 국번 조회
	public List<Dialing> selectDialing(Dialing dailing){
		return sqlSession.selectList("SurveyDao.selectDialing", dailing);
	}
	
	//지역별 국번 조회
	public List<ExceptionTel> selectExcTel(ExceptionTel excTel){
		return sqlSession.selectList("SurveyDao.selectExcTel", excTel);
	}
	
	//표본테이블 삭제
	public int deleteArsResult() {
		return sqlSession.delete("SurveyDao.deleteArsResult");
	}
	
	// 총발송
	public int selectTotalSend(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selectTotalSend", params);
	}
	// 접촉/비접촉등 사례
	public int selectres2(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selectres2",params);
	}
	
	// 타겟삭제
	public int deleteResultKis(Map<String, Object> params) {
		return sqlSession.delete("SurveyDao.deleteResultKis", params);
	}
	
	// 응답현황
	public List<Xroshot> selectResList(Map<String, Object> params){
		return sqlSession.selectList("SurveyDao.selectResList", params);
	}
	
	// 지역응답자들 정보조회
	public List<Xroshot> selectLocalByRes(Map<String, Object> params){
		return sqlSession.selectList("SurveyDao.selectLocalByRes",params);
	}
	
	// 자사 가정집 DB 지역정보 수정
	public int updateHomeDbByRes(Home35 home35){
		return sqlSession.update("SurveyDao.updateHomeDbByRes",home35);
	}
		
	//신보 - 조사대상자수*************************************************************************************************신보
	public int selSinboTotalCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboTotalCnt", params);
	}
	
	//신보 - 응답자수
	public int selSinboResCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboResCnt", params);
	}
	
	//신보 - 부재
	public int selSinboBujeCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboBujeCnt", params);
	}
	
	//신보 - 추후응답
	public int selSinboAfterCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboAfterCnt", params);
	}
	
	//신보 - 미응답
	public int selSinboRejectCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboRejectCnt", params);
	}
	
	//신보 - 문자1,2차
	public int selSinboMmsCnt(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSinboMmsCnt", params);
	}
	
	//신보 - 응답현황표
	public List<ResData> selSinboResList(Map<String, Object> params){
		return sqlSession.selectList("SurveyDao.selSinboResList", params);
	}
	
	//신보 - 문자1차발송자 조회
	public List<Sinbo> selSinboFirTarget(){
		return sqlSession.selectList("SurveyDao.selSinboFirTarget");
	}
	
	//신보 - 문자 2,3차 발송자 조회
	public List<Sinbo> selSinboSecTarget(){
		return sqlSession.selectList("SurveyDao.selSinboSecTarget");
	}
	
	//신보 - 문자발송자 정보수정
	public int updateSinboState(Sinbo sinbo){
		return sqlSession.update("SurveyDao.updateSinboState", sinbo);
	}
	
	//신보 - 마지막 발송
	public List<Sinbo> selSinboLastTarget(){
		return sqlSession.selectList("SurveyDao.selSinboLastTarget");
	}
	
	//신보 - 마지막 발송
	public List<Sinbo> selSinboLastTarget2(){
		return sqlSession.selectList("SurveyDao.selSinboLastTarget2");
	}
	
	//신보 - 마지막 pk조회
	public int selSinboLastSbNum() {
		return sqlSession.selectOne("SurveyDao.selSinboLastSbNum");
	}
	
	//신보 - 엑셀업로드
	public int insertSinboExcel(Sinbo sinbo) {
		return sqlSession.insert("SurveyDao.insertSinboExcel", sinbo);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*2019신규시책*/
	
	//2019신규시책 - 신규 응답자 정보입력
	public int addSurUser(SicheckUser user) {
		return sqlSession.insert("SurveyDao.addSurUser", user);
	}
	
	//응답내용 중간저장 updateAnsByOrder
	public int updateAnsByOrder(SicheckUser user) {
		return sqlSession.insert("SurveyDao.updateAnsByOrder", user);
	}
	
	//현황조회
	public int selSicheck(Map<String, Object> params) {
		return sqlSession.selectOne("SurveyDao.selSicheck", params);
	}
	
	//응답내용조회
	public List<SicheckUser> selSicheckResList() {
		return sqlSession.selectList("SurveyDao.selSicheckResList");
	}
	
	//대표님 개인자료에서 문자 발송 대상자 조회(응답자 제외)
	public List<Pomg> selSicheckMmsTarget(){
		return sqlSession.selectList("SurveyDao.selSicheckMmsTarget");
	}
	
	//수신거부
	public int addSicheckRej(Pomg pOmg) {
		return sqlSession.insert("SurveyDao.addSicheckRej", pOmg);
	}
	
//===========================================================================================
	
	//수협 - 재발송조회
	public List<Xroshot> getReTagetSuhyup(){
		return sqlSession.selectList("SurveyDao.getReTagetSuhyup");
	}
	
	//음성문자발송
	public int goReTargetSuhyup(String target) {
		return sqlSession.insert("SurveyDao.goReTargetSuhyup", target);
	}
	
// ==========================================================================================
	//저작권 최초입력
	public int addSuv2019(CopyRight copyRight) {
		return sqlSession.insert("addSuv2019", copyRight);
	}
	
	//updateSuv2019-1
	public int updateSuv2019(CopyRight copyRight) {
		return sqlSession.update("updateSuv2019", copyRight);
	}
	
	//updateSuv2019-2
	public int updateSuv20192(CopyRight copyRight) {
		return sqlSession.update("updateSuv20192", copyRight);
	}
}
