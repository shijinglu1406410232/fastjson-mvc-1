<%--
  Created by IntelliJ IDEA.
  User: shijinglu
  Date: 2019/2/1
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试JSON交互</title>

    <!--引入js文件,引入路径 从当前项目的js文件夹下的jquery-1.11.3.min.js-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
    </script>
    <!--写一个function testJson()-->
    <script type="text/javascript">
        function testJson() {
            <!--获取用户输入的用户名和密码-->
            var username=$("#username").val();
            var password=$("#password").val();
            <!--发一个ajax请求-->
            $.ajax({
                <!--testJson路径  默认是当前页的地址，这里是交给testJson处理-->
                url:"${pageContext.request.contextPath}/testJson",
                type:"post",
                <!--把发送过来的数据转换成json字符串-->
                data:JSON.stringify({username:username,password:password}),
                <!--请求类型设置为json字符串，并设置字符集为utf-8-->
                contentType: "application/json;charset=UTF-8",
                <!--定义回调的响应格式为json字符串，该属性可以省略-->
                dataType:"json",
                success : function(data) {
                    if(data !=null){
                        alert("您输入的用户名为："+data.username+"密码为："+data.password);
                    }
                }
            });

        }
    </script>
</head>
<body>
<!--type="text"为什么会是灰色的？-->
<form>
    用户名：<input type="text" name="username" id="username"><br/>
    密&nbsp;&nbsp;&nbsp;码:<input type="password" name="password" id="password"><br/>
    <input type="button" value="测试json交互" onclick="testJson()">
</form>
</body>
</html>
