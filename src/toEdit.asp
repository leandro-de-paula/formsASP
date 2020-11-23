<% @ LANGUAGE = "VBSCRIPT" %>
<!-- #include file="../database/config.asp" -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Compatibilidade HTML5 IE -->
	<!--[if lt IE 9]> 
	<script src="js/html5shiv.js"></script> 
	<![endif]-->

	<!-- Bootstrap Offgrid -->
	<link rel="stylesheet" href="../public/css/bootstrap.min.css">

	<!-- Ionic CSS Offgrid -->
	<link href="../public/iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">

	<!-- FontAwesome Offgrid-->
	<link href="../public/fontawesome/css/all.css" rel="stylesheet">
	<!-- Estilo customizado -->
	<link rel="stylesheet" type="text/css" href="../public/css/estilo.css">

	<!-- Icone de Navegador Ex:img/favicon.png -->
	<link rel="icon"  href="">

	<title>Form</title>

</head>
<body>
    
    <!-- #include file="search.asp" -->
    <br>
    <%
    id   = Request.QueryString("id")

    if (trim(id) = "") or (isnull(id)) then id = 0 end if

    ' Consiste o Evento
    if (cint(id) <> 0) then
                
        ' Seleciona os dados do evento
        commandSQL = "select * from tbform where id = " & id
        
        ' Executa a string sql.
        Set resultObj = conn.execute(commandSQL)
                
        ' Verifica se não é final de arquivo.	
        if not resultObj.EOF then
                    
            ' Carrega as informações do Evento
            name = resultObj("name")
            email = resultObj("email")
            address = resultObj("address")

        end if
        
        set resultObj = nothing
        
    end if

%>
    <section><!-- Edição Formulario -->
        <div class="container">
            <div class="clientFormSubmit">
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <form class="d-flex" action="update.asp" method="post"> 
                            <div class="form-group">
                                <div class="align-self-center">
                                    <br>
                                    <h2>Editar</h2>
                                    <hr>
                                </div>	
                                <label for="id">Id:</label>
                                <input type="text" class="form-control form-control-lg" name="id" id="id" value="<%=id%>" readonly>
                                
                                <label for="name">Nome:</label>
                                <input type="text" class="form-control form-control-lg" name="name" id="name" value="<%=name%>">
                                
                                <label for="inputEmail1">E-mail:</label>
                                <input type="email" class="form-control form-control-lg" name="email" id="inputEmail1" value="<%=email%>">
                                
                                <label for="address">Endereço:</label>
                                <input type="text" class="form-control form-control-lg" name="address" id="address" value="<%=address%>">
                                <br>
                                <div class="form-row">
                                    <div class="form-group col-12 text-right">
                                        <div for="send">
                                            <button type="submit" class="btn btn-primary form-control-lg" id="send">Alterar</button>
                                            <!-- <a href="result.php??php echo $id;?>" class="btn btn-outline-light" rel="noopener noreferrer">Cancelar</a>
                                            -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>	
                    </div>
                </div>
            </div>
            
    </section><!-- ./Edição Formulario -->


    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>