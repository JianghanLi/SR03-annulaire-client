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
	<title>Annulaire</title>
	<%
		String searchBy = request.getParameter("searchBy");
		if(searchBy == null) {
			searchBy = "";
		}
		String value = request.getParameter("value");
		ActionProxy actionProxy = new ActionProxy();
		String annonce = "";
		String categories = "";
		try {
			switch (searchBy) {
	            case "nom":  
	            	annonce = actionProxy.searchByNom(value);
	                break;
	            case "categorie":  
	            	annonce = actionProxy.searchByCategorie(value);
	                break;
	            case "code_postal":  
	            	annonce = actionProxy.searchByCodepostal(value);
	                break;
	            default: 
	            	annonce = actionProxy.searchAll();		
	                break;
        	}
				
			categories = '"' + actionProxy.getGategorie() + '"';
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	%>
	<script type="text/javascript">
	
	function search(searchBy, value) {
		if(value=="") {
			document.location.href = 'index.jsp';
		} else {
			document.location.href = 'index.jsp?searchBy=' + searchBy + '&value=' + value;
		}
		
	}
	</script>
	

</head>
<body>
	<img class="utcLogo" src="img/logosUTC_SU.jpg">
	<h3 style="color:#5f74a0">Web service message:&nbsp; ${not empty param.message? param.message : "Welcome!"}</h3>
    <h1>Annonces</h1>
    <form class="form-wrapper annonceForm" method="POST" action="/SR03-annulaire-client/Annonce">
	   	<label>Ajouter nouveau annonces:&nbsp;&nbsp;</label>
	   	<input type="text" name="action" value="add" style="display:none">
	   	<select name="categorie" class="categorieSelect" required></select>
	   	<input type="text" name="query" placeholder="new annonce name.." required>
	    <button type="submit">Valider</button>
	</form><br>
    <table class="table annonces">
        <thead><tr>
            <th>id_annonce</th>
            <th><select class="categorie categorieSelect" onchange='search("categorie",this.value)'>
            	<option value="">Tout</option>
            </select></th>
            <th><input class="nom" type="search" onsearch='search("nom",this.value)' placeholder="nom"></input></th>
            <th>telephone</th>
            <th><input class="code_postal" type="search" onsearch='search("code_postal",this.value)' placeholder="code_postal"></input></th>
            <th>ville</th>
            <th></th>
            <th></th>
        </tr></thead>
        <tbody></tbody>
    </table>
    <h1>Catégorie</h1>
    <form class="form-wrapper cf" method="POST" action="/SR03-annulaire-client/Categorie">
	   	<label>Ajouter nouveau catégorie:&nbsp;&nbsp;</label>
	   	<input type="text" name="query" placeholder="new categorie name.." required>
	    <button type="submit">Valider</button>
	</form><br>
     <table class="table categories">
        <thead><tr>
            <th>title</th>
            <th>editer</th>
            <th>supprimer</th>
        </tr><thead>
        <tbody></tbody>
    </table>
    <script type="text/javascript">
    	var annonces = <%= annonce%>;
		var categories = <%= categories%>;
		categories = categories.split(";");
		var searchBy = "<%= searchBy%>";
		function addAnnonce(annonce) {
			var annonceString = '<tr id_annonce=' + annonce.id_annonce + '>' + 
			'<td>' + annonce.id_annonce + '</td>' + 
			'<td>' + annonce.categorie + '</td>' + 
			'<td>' + annonce.nom + '</td>' +
			'<td>' + annonce.telephone + '</td>' +
			'<td>' + annonce.code_postal + '</td>' +
			'<td>' + annonce.ville + '</td>' + 
			'<td><a href="/SR03-annulaire-client/annonceDetail.jsp?id_annonce=' + annonce.id_annonce + '">Détail</a> </td>' +
			'<td><a href="/SR03-annulaire-client/Annonce?action=delete&id=' + annonce.id_annonce + '">Supprimer</a></td>' +
			'</tr>';
			$('.table.annonces tbody').append(annonceString);  
		}
		function editCategorie(categorie) {
			var newName = prompt("Entrez nouveau nom pour catégorie:", categorie);
			if(newName==categorie) {
				return;
			}
			var href = "Categorie?action=edit&categorie=" + categorie + "&newName=" + newName;
			window.location.href= href;
		}
		function addCategorie(categorie) {
			var categorieString = '<tr title=' + categorie + '>' + 
			'<td>' + categorie + '</td>' + 
			'<td><a href=javascript:editCategorie("' + categorie + '");>Editer</a></td>' +
			'<td><a href="/SR03-annulaire-client/Categorie?action=delete&title=' + categorie + '">Supprimer</a></td>' +
			'</tr>';
			$('.table.categories tbody').append(categorieString);  
			var categorieOption = '<option value="'+ categorie + '">' + categorie + '</option>';
			$('.categorieSelect').append(categorieOption);  
		}
		for (var i=0; i<annonces.length; ++i) {
			addAnnonce(annonces[i]);
		}
		for (var i=0; i<categories.length; ++i) {
			addCategorie(categories[i]);
		}
		
		if(annonces.length==0) {
			var message = "<tr><td></td><td></td><td></td><td>No annonce found.</td></tr>"; 
			$('.table.annonces tbody').append(message);  
		}
		if(categories.length==0) {
			var message = "<tr><td></td><td></td><td></td><td>No categories found.</td></tr>"; 
			$('.table.categories tbody').append(message);  
		}
		if(searchBy) {
			$(".table.annonces thead th ." + searchBy)[0].value="<%= value%>";
		}
		
	</script>
	
</body>
</html>