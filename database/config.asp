<% 
'Criando o objeto de conexão
Set conn = Server.CreateObject("ADODB.Connection") 
 
'Variaveis
connDriver = "{MySQL ODBC 5.3 Unicode Driver}"
connServer = "localhost"
connDB = "form"
connUser = "root"
connPass = "root"

connectDB = "Driver="&connDriver&";Server="&connServer&";Database="&connDB&";UID="&connUser&";PWD="&connPass&";"
 
'response.write "banco conectado <br>" 

Session("connectionstring")	=	connectDB

'Abre conexão com o Banco de dados
conn.ConnectionString = Session("connectionstring")
conn.Open
 
'Fecha a conexão com o banco de dados
'conn.Close()
 
'Destruindo o objeto
'Set conn = Nothing

'driver para conexão com banco MySQL
'https://drive.google.com/drive/folders/12Ct-nwEqDCvupvMEAA44-Az5OgDWoxNc?usp=sharing
%>

