<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/SR03-annulaire-client/css/page.css">
	<title>Annonce Detail</title>
</head>
<body>
	<%@page import="action.ActionProxy"%>
	<%@page import="java.util.Map"%>
	<%@page import="java.util.HashMap"%>
	<%@page import="java.util.List"%>
	<%@page import="com.alibaba.fastjson.JSON"%>
	<%@page import="com.alibaba.fastjson.JSONArray"%>
	<%@page import="com.alibaba.fastjson.TypeReference"%>
	<%@page import="com.alibaba.fastjson.JSONObject"%>

	<%
		String id_annonce = request.getParameter("id_annonce");
		ActionProxy ap = new ActionProxy();
		String annonceString = ap.searchById(id_annonce);
		List<Map> annonces = JSON.parseArray(annonceString, Map.class);
		Map annonce = (HashMap)annonces.get(0);
		String categories = ap.getGategorie();
	%>
	<h1>Détail d'annonce</h1>
	<form class="form-wrapper cf" method="POST" action="/SR03-annulaire-client/Annonce.do?action=modify&id_annonce=<%=id_annonce %>">
	   	<table>
	   	<tr>
	   		<td>Title</td>
	   		<td><input type="text" name="nom" value='<%=annonce.get("nom") %>'></td>
	   	</tr>
	   	<tr>
	   		<td>Categorie</td>
	   		<td>
		   		<c:set var="categorie" scope="session" value='<%=annonce.get("categorie") %>'/>
		   		<select name="categorie" class="categorieSelect" >
		   			<c:forTokens items='<%= categories%>' delims=";" var="name">
		   				<option ${name == categorie ? 'selected' : ''} ><c:out value="${name}"/></option>
					</c:forTokens>
		   		</select>
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>Content</td>
	   		<td><textarea type="text" name="text"><%=annonce.get("text") %></textarea></td>
	   	</tr>
	   	<tr>
	   		<td>Tel</td>
	   		<td><input type="text" name="telephone" value='<%=annonce.get("telephone") %>'></td>
	   	</tr>
	   	<tr>
	   		<td>Code Postal</td>
	   		<td><input type="text" name="code_postal" value='<%=annonce.get("code_postal") %>'></td>
	   	</tr>
	   	<tr>
	   		<td>Rue</td>
	   		<td><input type="text" name="rue" value='<%=annonce.get("rue") %>'></td>
	   	</tr>
	   	<tr>
	   		<td>Ville</td>
	   		<td><input type="text" name="ville" value='<%=annonce.get("ville") %>'></td>
	   	</tr>
	   	<tr>
	   		<td></td>
	   		<td><button type="submit">Modify</button></td>
	   	</tr>	   	
	   	</table>
	   	<a href="index.jsp">Back</a>
	   	
	</form>
	
</body>

</html>