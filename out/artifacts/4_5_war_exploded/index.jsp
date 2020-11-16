<%--
  Created by IntelliJ IDEA.
  User: 16929
  Date: 2020/11/16
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>work4~5</title>
  <script src="js/jquery-3.5.1.js"></script>
</head>
<body>
<div>
  <select id="menu1" onchange="loadInfo()">
    <option value="">---请选择---</option>
    <option value="1">福建省</option>
    <option value="2">浙江省</option>
    <option value="3">安徽省</option>
  </select>
  <select id="menu2"></select>
</div>
</body>

<script>
  //1. 创建XmlHttpRequest
  // var xmlhttp;
  // if(window.XMLHttpRequest){
  //     xmlhttp = new XMLHttpRequest();
  // }else{
  //     xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  // }
  // //2. 发送Ajax请求
  // //true 代表异步执行  false代表同步执行
  // xmlhttp.open("GET" , "/ajax/news_list" , true);
  // xmlhttp.send();
  // console.log("请求发送完成");
  // //3. 处理服务器响应
  // xmlhttp.onreadystatechange = function(){
  //     if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
  //         var text = xmlhttp.responseText;
  //         console.log(text);
  //         var json = JSON.parse(text);
  //         console.log(json);
  //         var html = "";
  //         for(var i = 0 ; i < json.length ; i++){
  //             var news = json[i];
  //             html = html + "<h1>" + news.title + "</h1>";
  //             html = html + "<h2>" + news.date + "&nbsp;" + news.source +"</h2>"
  //             html = html + "<hr/>"
  //         }
  //         document.getElementById("show-content").innerHTML = html;
  //     }
  // }

  //jq 实现ajax
  function loadInfo() {

    const menu1Val = $("#menu1 option:checked").val()
    $("#menu2").empty()
    // console.log(menu1Val)
    $.ajax({
      url:"/4_5_war_exploded/ContentServlet",
      type:"GET",
      data:{
        computerId:menu1Val,
      },
      success:function (res) {
        const json = JSON.parse(res);
        // console.log(json)
        for (let i=0;i<json.length;i++){
          $("#menu2").append("<option>"+json[i]+"</option>")
        }
      }
    })
  }
</script>
</html>