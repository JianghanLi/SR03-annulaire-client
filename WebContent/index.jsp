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
		String categories = "";
		try {
			annonce = actionProxy.searchAll();
			categories = '"' + actionProxy.getGategorie() + '"';
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	%>
	
	

</head>
<body>
    <p>Annonces</p>
    <form class="form-wrapper annonceForm" method="POST" action="/SR03-annulaire-client/Annonce">
	   	<input type="text" name="action" value="add" style="display:none">
	   	<select name="categorie"></select>
	   	<input type="text" name="query" placeholder="new annonce name.." required>
	    <button type="submit">Add annonce</button>
	</form>
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
    <p>Catégorie</p>
    <form class="form-wrapper cf" method="POST" action="/SR03-annulaire-client/Categorie">
	   	<input type="text" name="query" placeholder="new categorie name.." required>
	    <button type="submit">Add Categorie</button>
	</form>
     <table class="table categories">
        <tr>
            <td>title</td>
            <td>editer</td>
            <td>supprimer</td>
        </tr>
    </table>
    <script type="text/javascript">
		var annonces = <%= annonce%>;
		var categories = <%= categories%>;
		categories = categories.split(";");
		function addAnnonce(annonce) {
			var annonceString = '<tr id_annonce=' + annonce.id_annonce + '>' + 
			'<td>' + annonce.id_annonce + '</td>' + 
			'<td>' + annonce.categorie + '</td>' + 
			'<td>' + annonce.nom + '</td>' +
			'<td>' + annonce.telephone + '</td>' +
			'<td>' + annonce.code_postal + '</td>' +
			'<td>' + annonce.text + '</td>' + 
			'<td><a href="/SR03-annulaire-client/annonceDetail.jsp?id_annonce=' + annonce.id_annonce + '">Editer</a> </td>' +
			'<td><a href="/SR03-annulaire-client/Annonce?action=delete&id=' + annonce.id_annonce + '">Supprimer</a></td>' +
			'</tr>';
			$('.table.annonces tbody').append(annonceString);  
		}
		function addCategorie(categorie) {
			var categorieString = '<tr title=' + categorie + '>' + 
			'<td>' + categorie + '</td>' + 
			'<td> Editer </td>' +
			'<td><a href="/SR03-annulaire-client/Categorie?action=delete&title=' + categorie + '">Supprimer</a></td>' +
			'</tr>';
			$('.table.categories tbody').append(categorieString);  
			var categorieOption = '<option value="'+ categorie + '">' + categorie + '</option>';
			$('.annonceForm select').append(categorieOption);  
		}
		for (var i=0; i<annonces.length; ++i) {
			addAnnonce(annonces[i]);
		}
		for (var i=0; i<categories.length; ++i) {
			addCategorie(categories[i]);
		}
		
	</script>
	
</body>
</html>