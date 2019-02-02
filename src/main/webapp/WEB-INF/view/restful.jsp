<%--
  Created by IntelliJ IDEA.
  User: shijinglu
  Date: 2019/2/2
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RESTful测试</title>
    <!--引入js文件,引入路径 从当前项目的js文件夹下的jquery-1.11.3.min.js-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">

    </script>
    <script type="text/javascript">
        function search() {
            //获取输入的查询编号
            var  id=$("#number").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/"+id,
                type:"GET",
                //定义回调响应的数据格式为json字符串，该属性可以省略
                dataType:"json",
                //成功响应的结果
                success:function (data) {
                    if (data.username!=null){
                        alert("你查询的用户姓名是:"+data.username);
                    }else {
                        alert("没有找到id为:"+id+"的用户！");
                    }
                }
            });
        }
    </script>
</head>
<body>
       <form>
           编号：<input type="type" name="number" id="number"><br/>
                <input type="button" value="搜索" onclick="search()"><br/>
       </form>
</body>
</html>
