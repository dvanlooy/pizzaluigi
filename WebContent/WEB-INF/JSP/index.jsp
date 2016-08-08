<%-- Een welkom pagina --%>
<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib uri='http://vdab.be/tags' prefix='vdab'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'%>
<!doctype html>
<html lang='nl'>
<head>
<c:import url='/WEB-INF/JSP/head.jsp'>
	<c:param name='title' value='Pizza Luigi' />
</c:import>
</head>
<body>
	
	<h1>Pizza Luigi</h1>
	<img src=<c:url value='/images/pizza.jpg'/> alt='pizza'
		class='fullwidth'>
	<h2>${begroeting}${cookie.naam.value}</h2>
	<h2>De zaakvoerder</h2>
	<dl>
		<dt>Naam</dt>
		<dd>${zaakvoerder.naam}</dd>
		<dt>Aantal kinderen</dt>
		<dd>${zaakvoerder.aantalKinderen}</dd>
		<dt>Gehuwd</dt>
		<dd>${zaakvoerder.gehuwd ? 'Ja' : 'Nee' }</dd>
		<dt>Adres</dt>
		<dd>${zaakvoerder.adres.straat}
			${zaakvoerder.adres.huisNr}<br> ${zaakvoerder.adres.postcode}
			${zaakvoerder.adres.gemeente}
		</dd>
		<dt>Aantal pizza's verkocht</dt>
		<dd>
			<fmt:formatNumber value='${aantalPizzasVerkocht}' />
		</dd>
	</dl>
	<div>
		WebMaster: <a href='mailto:${emailAdresWebMaster}'>${emailAdresWebMaster}</a>
	</div>
	<div>
		Vandaag:
		<fmt:formatDate value='${nu}' type='date' dateStyle='full' />
	</div>
</body>
</html>