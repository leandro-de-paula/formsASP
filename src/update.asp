<% @ LANGUAGE = "VBSCRIPT" %>
<!-- #include file="../database/config.asp" -->
<%

id   = Request.Item("id")
name = replace(trim(request.form("name")),"'","")
email = replace(trim(request.form("email")),"'","")
address = replace(trim(request.form("address")),"'","")

' Seleciona os dados do evento
commandSQL = "update tbform set name = '"&name&"', email = '"&email&"', address = '"&address&"' where id = " & id
conn.execute(commandSQL)
			
response.redirect("../public/index.asp?actionStatus=UP")
response.End
%>