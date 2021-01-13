<%

actionStatus = Request.Item("actionStatus")
statusMessage = ""

select case trim(ucase(actionStatus))
  case "INS"
    statusMessage = "Cadastro realizado com Sucesso"
  case "UP"
    statusMessage = "Cadastro atualizado com Sucesso"
  case "DEL"
    statusMessage = "Cadastro deletado com Sucesso"
  case else
    statusMessage = ""
end select

'search
%>
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
	<link rel="stylesheet" href="css/bootstrap.min.css">

	<!-- Ionic CSS Offgrid -->
	<link href="iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">

	<!-- FontAwesome Offgrid-->
	<link href="fontawesome/css/all.css" rel="stylesheet">
	<!-- Estilo customizado -->
	<link rel="stylesheet" type="text/css" href="css/estilo.css">

	<!-- Icone de Navegador Ex:img/favicon.png -->
	<link rel="icon"  href="">

	<title>Form</title>

</head>
<body>
    <header><!-- Incio do cabeçalho -->
        <nav class="navbar navbar-expand-sm navbar-light bg-primary"><!-- Barra de Navegação -->
            <div class="container">
                <div class="row">
                    <form class="mt-4 mb-4" action="../../formsASP/src/resultSearch.asp" method="get">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control" name="search" id="search" placeholder="Nome:">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-outline-light" id="send">Buscar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="mt-4 mb-4">
                  <a href="../../formsASP/src/result.asp"
                  class="btn btn-outline-light"
                  rel="noopener noreferrer">
                  Listar Cadastrados
                </a>
              </div>
            </div>
        </nav><!-- Fim da Barra de Navegação -->
    </header><!-- Fim do cabeçalho-->

    <% if trim(statusMessage) <> "" then %>
        <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
        <%=statusMessage%>
        </div>
    <% end if %>
    <section><!-- Inscrição Formulario -->
        <div class="container">
            <div class="clientFormSubmit">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <form class="d-flex" action="../../formsASP/src/receiving.asp" method="post">
                            <div class="form-group col-12">
                                <div class="align-self-center">
                                    <br>
                                    <h2>Adicionar Novo</h2>
                                    <p>Entre com dados para cadastro:</p>
                                    <hr>
                                </div>
                                <label for="name"></label>
                                <input type="text" class="form-control form-control-lg" name="name" id="name"  value="<%=name%>" placeholder="Nome:">

                                <label for="inputEmail1"></label>
                                <input type="email" class="form-control form-control-lg" name="email" id="inputEmail1"  value="<%=email%>" placeholder="E-mail:">

                                <label for="address"></label>
                                <input type="text" class="form-control form-control-lg" name="address" id="address"  value="<%=address%>" placeholder="Endereço:">
                                <br>
                                <div class="form-row">
                                    <div class="form-group col-12 text-right">
                                        <div for="send">
                                            <button type="submit" class="btn btn-primary form-control-lg" id="send">Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

    </section><!-- ./Inscrição Formulario -->
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</body>
</html>
<%

'conn.close()

set conn = Nothing

%>
