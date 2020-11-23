<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="../database/config.asp" -->
<%

id = Request.QueryString ("id")

if trim(id) = "" or isnull(id) or trim(id) = "0" then
	Response.Write ("<script>alert('Código do Usuário não informado. Favor verificar!'); document.location='index.asp';</script>")
	Response.End
end If

strSQL = "delete from tbform where id = " & id

conn.execute(strSQL)

Response.Redirect ("../public/index.asp?actionStatus=DEL")
Response.End

%>
