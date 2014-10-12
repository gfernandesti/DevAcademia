<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="UsuarioModal" tabindex="-1" role="dialog"
		aria-labelledby="UsuarioModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Cadastrar Usuário</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="cadastrarUsu.do">
						<fieldset>

											<!-- Text input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="Uemail"></label>
								<div class="col-md-4">
									<input id="Uemail" name="Uemail" type="text"
										placeholder="Digite seu email.." class="form-control input-md"
										required="">

								</div>
							</div>

							<!-- Password input-->
							<div class="form-group">
								<label class="col-md-4 control-label" for="passwordinput"></label>
								<div class="col-md-4">
									<input id="passwordinput" name="Usenha" type="password"
										placeholder="Digite sua senha.." class="form-control input-md" required="">

								</div>
							</div>
                                                        <!-- Password input-->
					
							<!-- Button -->
							<div class="form-group">
								<div class="col-md-4">
									<button class="btn btn-primary" type="submit">Criar
										Conta</button>

								</div>
							</div>

						</fieldset>
					</form>


				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>