<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/SR03-annulaire-client/css/page.css">
    <script src="/SR03-annulaire-client/js/jquery-1.12.1.min.js"></script>
	<title>Insert title here</title>

	<script type="text/javascript">
		function searchByCategorie() {
		
		}
	</script>



</head>


<body>

<form class="form-wrapper cf" method="PUT" action="/SR03-annulaire-client/Categorie">
   	<input type="text" name="query" placeholder="new categorie name.." required>
    <button type="submit">Add Categorie</button>
</form>

<form class="form-wrapper cf" method="PUT" >
   	<input type="text" name="query" placeholder="new categorie name.." required>
    <button type="button" onclick="searchByCategorie()" >test </button>
</form>

</body>
</html>