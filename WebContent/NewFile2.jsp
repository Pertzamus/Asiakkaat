<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="css/Main.css">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
 </script>
<title>Insert title here</title>
<style>
.oikealle{
	text-align: right:
}
</style>
</head>
<body>
<table id ="listaus">
	<thead>
	<tr>
			<th colspan="5" class="oikealle"><span id="uusiAsiakas">Lisää uusi Asiakas</span></th>
		</tr>	
	<tr>
		<th class="oikealle">Hakusana:</th>
		<th colspan="2"><input type="text" id="hakusana"></th>
		<th><input type="button" value="hae" id="hakunappi"></th>
	</tr>
	<tr>
		<th>Etunimi</th>
		<th>Sukunimi</th>
		<th>Puhelin</th>
		<th>Sposti</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	$("#uusiAsiakas").click(function(){
		document.location="lisaaasiakas.jsp";
		
	haeAsiakkaat();
	$("#hakunappi").click(function(){
			haeAsiakkaat();
	});
	
	$(document.body).on("keydown", function(event) {
		if(event.which==13) { //Enter
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus(); //kursori aloittaa hakusana kentästä
});
	
function haeAsiakkaat() {
	$("#listaus tbody").empty();
	$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json",success:function(result){
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>"; 
        	htmlStr+="<td><span class='poista' onclick=poista('"+field.etunimi+"')>Poista</span></td>";
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
	}