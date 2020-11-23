<% @ LANGUAGE = "VBSCRIPT" %>
<!-- #include file="../database/config.asp" -->
<%

id   = Request.Item("id")
name = replace(trim(request.form("name")),"'","")
email = replace(trim(request.form("email")),"'","")
address = replace(trim(request.form("address")),"'","")

' Seleciona os dados do evento
commandSQL = "insert into tbform (name, email, address) values ('"&name&"','"&email&"','"&address&"');"
conn.execute(commandSQL)
			
response.redirect("../public/index.asp?actionStatus=INS")
response.End
%>

