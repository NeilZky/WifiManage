<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
		<c:if test="${requestScope.sucPageInfo !=null }">
				<c:if test="${requestScope.sucPageInfo.navPageTypes !=null }">
				<div>
						<c:forEach items="${requestScope.sucPageInfo.navPageTypes}" var="item">
							<h1>---------------------</h1>
							<div>
								${item.name }
							</div>							
							<div>
								<c:forEach items="${item.navPages}" var="navPage">
									<div>
										<a href="redirect.action?uid=0&linkType=1&id=${navPage.id }"><img  style="height: 40px;width: 40px;" src="${navPage.photoUrl }">${navPage.name }</a>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
				</div>
				</c:if>	
					<div>
						<div>
							轮播广告
						</div>
						<c:forEach items="${requestScope.sucPageInfo.scrollAds}" var="item">
						<h1>---------------------</h1>
						<div  >
							<a href="redirect.action?uid=0&linkType=2&id=${item.id }">
								 <img height="200px" width="70%" src="${item.photoUrl}">
								<span>${item.content}</span>
							</a>
						</div>
					</c:forEach>
					</div>
					
					<div>
					<div>公共页面自定义区域</div>	
						<c:forEach items="${requestScope.sucPageInfo.commonAreas}" var="item">
												<h1>---------------------</h1>
						<div  >
							<a href="redirect.action?&linkType=3&id=${item.id }&uid=${item.uid}">
								 <img height="200px" width="300px" src="${item.photoUrl}">
								<span>${item.title}</span>
							</a>
						</div>
					</c:forEach>
					</div>
					
					<div>
										<div>商家自定义页面区域</div>	
						<c:forEach items="${requestScope.sucPageInfo.sellerAreas}" var="item">
						<div  >
							<a href="redirect.action?uid=${requestScope.sucPageInfo.uid}&linkType=4&id=${item.id }">
								 <img height="200px" width="300px" src="${item.photoUrl}">
								<span>${item.title}</span>
							</a>
						</div>
					</c:forEach>
					</div>
					
					
				</div>
		
		</c:if>
</body>
</html>