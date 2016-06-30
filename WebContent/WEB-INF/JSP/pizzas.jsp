<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url='/WEB-INF/JSP/head.jsp'>
<c:param name="title" value="Pizza's"/>
</c:import>
</head>
<body>
<c:import url='/WEB-INF/JSP/menu.jsp'/>
	<h1>
		Pizza's
		<c:forEach begin="1" end="5">
&#9733; <%-- de HTML code van een ster --%>
		</c:forEach>
	</h1>
	
	<ul class="zebra">
		<c:forEach var="entry" items="${pizzas}">
			<li>${entry.key}:<c:out value="${entry.value.naam}" />
				${entry.value.prijs}&euro; ${entry.value.pikant ? "pikant" : "niet pikant"}
				<c:url value="/pizzas/detail.htm" var="detailURL">
					<c:param name="id" value="${entry.key}" />
				</c:url> <a href="${detailURL}">Detail</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>