<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<style>
       
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Jua", sans-serif;
      }

      a {
        text-decoration: none;
        color: black;
      }

      li {
        list-style: none;
      }

      .wrap {
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(116, 114, 114, 0.1);
      }

      .login {
        width: 30%;
        height: 600px;
        background: white;
        border-radius: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
      }

      h2 {
        color: blue;
        font-size: 2em;
      }
     
      .login_id {
        margin-top: 20px;
        width: 80%;
      }

      .login_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
        font-family: "Jua";
      }

      .login_pw {
        margin-top: 20px;
        width: 80%;
       
      }

      .login_pw input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
        font-family: "Jua";
      }

      .submit {
        margin-top: 50px;
        width: 80%;
        font-size: 30px !important;
      }
      .submit input {
        width: 100%;
        height: 50px;
        border: 0;
        outline: none;
        border-radius: 40px;
        background: linear-gradient(to left, rgb(39, 36, 227), rgb(130, 178, 233));
        color: white;
        font-size: 1.2em;
        letter-spacing: 2px;
        font-family: "Jua", sans-serif;
      }
      div.forgot > button {
        margin-right: 20px;
        padding: 5px 15px 5px 15px;
        font-size: 20px;
      }

  

</style>
   
    <!-- Start Section -->
        <center>
            <div class="wrap">
                <div class="login">
                    
                  <h2>LOG-IN</h2>
                    
                    <div class="login_id">
                        <input type="id" name="" id="" placeholder="ID">
                    </div>

                    <div class="login_pw">
                        <input type="password" name="" id="" placeholder="Password">
                    </div>

                    <div class="submit">
                        <input type="submit" value="확인">
                    </div>
                    
                    <br>

                    <div class="forgot" >
                    <button onclick="" style="font-family: Jua;border: outset;">비밀번호 찾기</button>
                    <button onclick="" style="font-family:'Jua';border: outset;">아이디 찾기</button> 
                    <button onclick="" style="font-family:'Jua';border: outset;">회 원 가 입</button> 
                    </div>
                </div>
            </div>
        </center>




<%@include file="/views/common/footer.jsp"%>