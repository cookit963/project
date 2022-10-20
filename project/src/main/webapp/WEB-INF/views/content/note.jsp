<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
   <form class="mb-3" action="/franchise/reviewWritePro" name="myform" id="myform" method="post">
      <input type="hidden" name="s_comTitle"  value="${starInfoOne.s_comTitle}">
      <input type="hidden" name="s_comName" value="${starInfoOne.s_comName}">

      <input type="hidden" name="s_id" value='${user_id }'>
      <fieldset>
         <span class="text-bold">별점을 선택해주세요</span> 
         <input type="radio" name="re_stars" value="5" id="rate1"><label for="rate1">★</label>
         <input type="radio" name="re_stars" value="4" id="rate2"><label for="rate2">★</label>
         <input type="radio" name="re_stars" value="3" id="rate3"><label for="rate3">★</label> 
         <input type="radio" name="re_stars" value="2" id="rate4"><label for="rate4">★</label> 
         <input type="radio" name="re_stars" value="1" id="rate5"><label for="rate5">★</label>
      </fieldset>
      <input type="submit" value="작성하기"> 
   </form>
</div>


<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>