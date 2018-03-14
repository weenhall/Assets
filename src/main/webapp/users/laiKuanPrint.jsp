<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: BomWu
  Date: 2015/10/29 0029
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>来款认领单打印</title>
    <style>
        @page {
            size: A4 portrait;
        }

        body {
            font-family: "宋体", "Times New Roman", Arial, sans-serif;;
            font-size: 17px;
            font-weight: bold;
        }

        .title {
            margin: 5px 0px;
            text-align: center;
            font-family: "宋体", Arial, sans-serif;
            font-weight: 900;
        }

        table {
            margin-top: 10px;
            border-collapse: collapse;
            border: none;
        }

        td {
            border: solid #000000 2px;
            padding: 2px 5px;
            text-align: left;
        }

        tr {
            height: 42px;
        }

        tr.row2 {
            height: 84px;
        }

        tr.row3 {
            height: 126px;
        }

        tr.row6 {
            height: 252px;
        }

        .labeltext {
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="width:674px;height: 1090px;margin:0px auto;padding:30px 50px 0px 80px;">
    <div id="toorbar">
      <input type="button" value="承办" onclick="show()"/>
      <input type="button" value="打印" onclick="show()"/>
    </div>
    <div>
        <h1 style="text-align: center;">来款认领单</h1>
    </div>
    <p>来款情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额合计:</p>
    <table style="width:674px;">
        <tbody>
        <tr>
            <td class="labeltext">序号</td>
            <td class="labeltext">来款编号</td>
            <td class="labeltext">来款单位</td>
            <td class="labeltext">来款形式</td>
            <td class="labeltext">人民币金额</td>
        </tr>
        <c:forEach items="lkList" var="lk" varStatus="status">
            <tr>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p>票据情况:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额合计:</p>
    <table style="width:674px;">
        <tbody>
        <tr>
            <td class="labeltext">序号</td>
            <td class="labeltext">发票号</td>
            <td class="labeltext">开票日期</td>
            <td class="labeltext">购票单位</td>
            <td class="labeltext">价税合计</td>
            <td class="labeltext">税金</td>
            <td class="labeltext">经办人</td>
        </tr>
        <c:forEach items="pjList" var="pj" varStatus="status">
            <tr>
                <td class="labeltext">1</td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
                <td class="labeltext">1
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p>认领情况:</p>
    <table style="width:674px;">
        <tbody>
        <tr>
            <td class="labeltext">认领人</td>
            <td class="labeltext">1
            </td>
            <td class="labeltext">认领日期</td>
            <td class="labeltext" >2016-11-11
            </td>
        </tr>
        </tbody>
    </table>
    <p>承办情况:</p>
    <table style="width:674px;">
        <tbody>
        <tr>
            <td class="labeltext" >承办人</td>
            <td class="labeltext">张新民
            </td>
            <td class="labeltext" >承办日期</td>
            <td class="labeltext" >2016-11-11
            </td>
            <td class="labeltext" >凭证号</td><td class="labeltext" style="width:120px;" contentEditable="true"></td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    function show(){
    	document.getElementById('toorbar').style.display="none";
    	window.print();
    	document.getElementById('toorbar').style.display="inline";
    }
</script>
</body>
</html>
