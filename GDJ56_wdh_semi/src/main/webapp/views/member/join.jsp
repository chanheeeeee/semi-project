<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- Start Section -->

    <!-- Start Section -->
  
        <style>
          form 
         {
          font-family:"Gamja Flower";
          font: size 14px;
          border-radius:8px;

         }

         td {color: #080909;}
          </style>
   
    
        <center>
        <div style="font-family:Jua;">
        <table bgcolor="#f5fafe" cellpadding="15">
        <tr>
        <td >아이디 </td>

        <br>

            <td>
              <input type="text" placeholder="영문,숫자 5~11자"  style="font-variant-caps:unicase ;" size="25">
              <input type="button" value="중복확인" style="font-family:Jua;" >
            </td>
          </tr>

          <tr>
            <td> 비밀번호 </td>
            <td> <input type="password" placeholder="숫자,영문,특수문자 조합 최소 8자"  style="font-variant-caps:unicase ;" size="25"> </td>
          </tr>
  
          <tr>
            <td> 비밀번호 확인 </td>
            <td> <input type="password" placeholder="비밀번호 재입력" style="font-variant-caps:unicase ;" size="25">   *비밀번호를 다시입력하여주세요. </td>
          </tr>
  
          <tr>
            <td> 이름 </td>
            <td> <input type="text"> </td>
          </tr>
  
          <tr>
            <td> 성별 </td>
            <td>
              <input type="radio" name="gender" checked> 남자
              <input type="radio" name="gender"> 여자
            </td>
          </tr>
  
          <tr>
            <td> 생년월일</td>
            <td>
              <label><input type="date" id="start"></label>
            </td>
          </tr>
  
          <tr>
            <td> 이메일 </td>
            <td>
              <input type="text" > @ <input type="text" /> &nbsp;&nbsp; 
              <select>
                <option> 직접입력 </option> 
                <option> naver.com </option>
                <option> daum.net </option>
                <option> nate.com </option>
                <option> gmail.com </option>
              </select>
              <input type="button" value="인증코드발송" style="font-family:Jua;">
            </td>
          </tr>
  
          <tr>
            <td> 주소 </td>
            <td>
              <input type="text">
              <input type="button" value="주소찾기" style="font-family:Jua;">
            </td>
          </tr>
          <tr>
            <td> 상세주소 </td>
            <td>
              <input type="text">
            </td>
          </tr>
  
  
          <tr>
            <td> 휴대폰 </td>
            <td>
              <select>
                <option> 010 </option>
              </select>
              <input type="text" size="6"> - <input type="text" size="6">
            </td>

      </table>
  
      <br>
  
      <input type="button" value="가입하기" style="font-family:Jua;" id="modal">
      <input type="reset" value="취소하기" style="font-family:Jua;">
    </center>
  </div>
    <br><br>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            회원가입을 축하드립니다.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeJoin">확인</button>
          </div>
        </div>
      </div>
    </div>

<%@include file="/views/common/footer.jsp"%>
