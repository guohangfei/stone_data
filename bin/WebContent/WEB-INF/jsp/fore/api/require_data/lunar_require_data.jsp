<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黄历请求接口返回数据</title>
</head>
<body>
<!-- private String select_according_date;
	private String ;
	private String lunar_calendar_date;
	private String lunar_calendar_year;
	private String lunar_calendar_month;
	private String lunar_calendar_day;
	private String suit;
	private String taboo;
	private String solar_term; -->
<c:forEach items="${lunarStr}" var="lunar">
{"requiredate":"${lunar.select_according_date}",
"solarcalendardate":"${lunar.solar_calendar_day}",
"lunarcalendardate":"${lunar.lunar_calendar_date}",
"lunarcalendaryear":"${lunar.lunar_calendar_year}",
"lunarcalendarmonth":"${lunar.lunar_calendar_month}",
"lunarcalendarday":"${lunar.lunar_calendar_day}",
"suit":"${lunar.suit}",
"taboo":"${lunar.taboo}",
"solarterm":"${lunar.solar_term}"}
</c:forEach>	
</body>
</html>