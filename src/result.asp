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
    
    <h3>Pesquisa</h3>
    <table class="table table-hover"> 
       <thead class="table-primary">
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Endereço</th>
            <th>Edite/Remove</th>
        </thead>
        <tbody>

          <%

          commandSQL = "select * from tbform order by name asc;"

          set resultObj = conn.execute(commandSQL)

          do while not resultObj.EOF

            %>
            <tr>
              <td><%=resultObj("id")%></td>
              <td><%=resultObj("name")%></td>
              <td><%=resultObj("email")%></td>
              <td><%=resultObj("address")%></td>
              <td>
                <a 
                    href="toEdit.asp?id=<%=resultObj("id")%>" 
                    class="btn btn-outline-primary" 
                    alt="Editar" 
                    title="toEdit">
                    <i class="fas fa-pencil-alt"></i>
                </a>

                <a 
                    data-href="deleteRecord.asp?id=<%=resultObj("id")%>"
                    class="btn btn-outline-danger" 
                    data-toggle="modal" 
                    data-target="#confirm-delete" 
                    alt="Excluir Cadastro" 
                    title="deleteRecord">
                    <i class="far fa-trash-alt"></i>
                </a>
            
              </td>
            </tr>
            <%

            resultObj.MoveNext()

          loop

          set resultObj = Nothing

          %>

        </tbody>
      </table>
    </div>

    <!-- MODAL Exclusão-->
    <div class="modal fade stick-up" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header clearfix text-left">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="pg-close fs-14"></i>
            </button>
            <h5>Confirmação <span class="semi-bold">de Exclusão</span></h5>
          </div>
          <div class="modal-body">
            <!--<p class="debug-url"></p>-->
            <p>Confirmar a exclusão do usuário?</p>
          </div>                
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-outline-danger btn-deletar">Deletar</a>
          </div>
        </div>
      </div>
    </div>
      
    <!-- JavaScript (Opcional) -->
    <!-- jQuery primeiro, depois Popper.js, depois Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script>
        $(function()
        { 
        $('#confirm-delete').on('show.bs.modal', function(e) {
            $(this).find('.btn-deletar').attr('href', $(e.relatedTarget).data('href'));
            //$('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-deletar').attr('href') + '</strong>');
        });
        });
    </script>

</body>
</html>
<%

conn.close()

set conn = Nothing

%>