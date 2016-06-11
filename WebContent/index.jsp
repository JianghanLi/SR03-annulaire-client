<%@page import="java.rmi.RemoteException"%>
<%@page import="action.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/SR03-annulaire-client/css/page.css">
    <script src="/SR03-annulaire-client/js/jquery-1.12.1.min.js"></script>
	<title>Insert title here</title>
	<%
		ActionProxy actionProxy = new ActionProxy();
		String annonce = "";
		try {
			annonce = actionProxy.searchAll();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		System.out.println(annonce);
	%>
	
	

</head>
<body>
    <p>Annonces</p>
    <table class="table annonces">
        <tr>
            <td>id_annonce</td>
            <td>categorie</td>
            <td>nom</td>
            <td>telephone</td>
            <td>code_postal</td>
            <td>ville</td>
            <td>text</td>
            <td>action</td>
        </tr>
    </table>
    <script type="text/javascript">
		var annonces = <%= annonce%>;
		function addAnnonce(annonce) {
			var annonceString = '<tr id_annonce=' + annonce.id_annonce + '>' + 
			'<td>' + annonce.id_annonce + '</td>' + 
			'<td>' + annonce.categorie + '</td>' + 
			'<td>' + annonce.nom + '</td>' +
			'<td>' + annonce.telephone + '</td>' +
			'<td>' + annonce.code_postal + '</td>' +
			'<td>' + annonce.text + '</td>' + 
			'<td> Editer </td>' +
			'<td><a href="/SR03-annulaire-client/Annonce?action=delete&id=' + annonce.id_annonce + '">Supprimer</a></td>' +
			'</tr>';
			$('.table.annonces tbody').append(annonceString);  
		}
		for (var i=0; i<annonces.length; ++i) {
			addAnnonce(annonces[i]);
		}
	</script>
	<form class="form-wrapper cf" method="POST" action="/SR03-annulaire-client/Categorie">
	   	<input type="text" name="query" placeholder="new categorie name.." required>
	    <button type="submit">Add Categorie</button>
	</form>
</body>
</html>