<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/login.js"></script>
<style type="text/css">
html,body {
  position: relative;
  min-height: 100vh;
  background-color: #E1E8EE;
  align-items: center;
  justify-content: center;
  font-family: "Fira Sans", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
	.form-structor {
  background-color: #222;
  border-radius: 15px;
  height: 600px;
  width: 400px;
  position: relative;
  overflow: hidden;
  margin-left: 35%;
  
  &::after {
    content: '';
    opacity: .8;
    position: absolute;
    top: 0;right:0;bottom:0;left:0;
    background-repeat: no-repeat;
    background-position: left bottom;
    background-size: 500px;
    background-image: url('https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100');
  }
  
  .signup {
    position: absolute;
    top: 43%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    width: 65%;
    z-index: 5;
    -webkit-transition: all .3s ease;
    
    
    &.slide-up {
      top: 5%;
      -webkit-transform: translate(-50%, 0%);
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-holder,
    &.slide-up .submit-btn {
      opacity: 0;
      visibility: hidden;
    }
    
    &.slide-up .form-title {
      font-size: 1em;
      cursor: pointer;
    }
    
    &.slide-up .form-title span {
      margin-right: 5px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
    }
    
    .form-title {
      color: #fff;
      font-size: 1.7em;
      text-align: center;
      
      span {
        color: rgba(0,0,0,0.4);
        opacity: 0;
        visibility: hidden;
        -webkit-transition: all .3s ease;
      }
    }
    
    .form-holder {
      border-radius: 15px;
      background-color: #fff;
      overflow: hidden;
      margin-top: 50px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      
      .input {
        border: 0;
        outline: none;
        box-shadow: none;
        display: block;
        height: 30px;
        line-height: 30px;
        padding: 8px 15px;
        border-bottom: 1px solid #eee;
        width: 100%;
        font-size: 12px;
        
        &:last-child {
          border-bottom: 0;
        }
        &::-webkit-input-placeholder {
          color: rgba(0,0,0,0.4);
        }
      }
    }
    
    .submit-btn {
      background-color: rgba(0,0,0,0.4);
      color: rgba(256,256,256,0.7);
      border:0;
      border-radius: 15px;
      display: block;
      margin: 15px auto; 
      padding: 15px 45px;
      width: 100%;
      font-size: 13px;
      font-weight: bold;
      cursor: pointer;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      
      &:hover {
        transition: all .3s ease;
        background-color: rgba(0,0,0,0.8);
      }
    }
  }
  
  .login {
    position: absolute;
    top: 20%;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #fff;
    z-index: 5;
    -webkit-transition: all .3s ease;
    
    &::before {
      content: '';
      position: absolute;
      left: 50%;
      top: -20px;
      -webkit-transform: translate(-50%, 0);
      background-color: #fff;
      width: 200%;
      height: 250px;
      border-radius: 50%;
      z-index: 4;
      -webkit-transition: all .3s ease;
    }
    
    .center {
      position: absolute;
      top: calc(50% - 10%);
      left: 50%;
      -webkit-transform: translate(-50%, -50%);
      width: 65%;
      z-index: 5;
      -webkit-transition: all .3s ease;
      
      .form-title {
        color: #000;
        font-size: 1.7em;
        text-align: center;

        span {
          color: rgba(0,0,0,0.4);
          opacity: 0;
          visibility: hidden;
          -webkit-transition: all .3s ease;
        }
      }

      .form-holder {
        border-radius: 15px;
        background-color: #fff;
        border: 1px solid #eee;
        overflow: hidden;
        margin-top: 50px;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        .input {
          border: 0;
          outline: none;
          box-shadow: none;
          display: block;
          height: 40px;
          line-height: 40px;
          padding: 8px 15px;
          border-bottom: 1px solid #eee;
          width: 100%;
          font-size: 12px;

          &:last-child {
            border-bottom: 0;
          }
          &::-webkit-input-placeholder {
            color: rgba(0,0,0,0.4);
          }
        }
      }

      .submit-btn {
        background-color: #6B92A4;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 15px;
        display: block;
        margin: 15px auto; 
        padding: 15px 45px;
        width: 100%;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        &:hover {
          transition: all .3s ease;
          background-color: rgba(0,0,0,0.8);
        }
      }
    }
    
    &.slide-up {
      top: 90%;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .center {
      top: 10%;
      -webkit-transform: translate(-50%, 0%);
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-holder,
    &.slide-up .submit-btn {
      opacity: 0;
      visibility: hidden;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-title {
      font-size: 1em;
      margin: 0;
      padding: 0;
      cursor: pointer;
      -webkit-transition: all .3s ease;
    }
    
    &.slide-up .form-title span {
      margin-right: 5px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
    }
  }
}
</style>
</head>
<%@include file="header.jsp"%>
<body>
<div class="form-structor">

	<form action="./loginForm.do" method="post">
  <div class="signup">
    <h2 class="form-title" id="signup">Login</h2>
    <div class="form-holder">
      <input id="email" type="email" class="input" name="user_email" placeholder="이메일" required="required"/>
      <input id="password" type="password" class="input" name="user_password" placeholder="비밀번호" required="required"/>
    </div>
    <button type="submit" class="submit-btn">Login</button>
  </div>
  </form>

  </div>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">

</script>
</html>