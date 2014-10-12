
<html>
    <form class="form-horizontal" method="Post" action="bdvoluntario.do" enctype="multipart/form-data">
        <fieldset>

            <!-- Form Name -->
            <legend>Olá, ${param.Uemail} Atualize seu Perfil! </legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Unome">Nome</label>  
                <div class="col-md-4">
                    <input id="Unome" name="Unome" type="text" placeholder="Digite seu nome.." class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Usobrenome">Sobrenome</label>  
                <div class="col-md-5">
                    <input id="Usobrenome" name="Usobrenome" type="text" placeholder="Digite seu sobrenome.." class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Utel">Telefone</label>  
                <div class="col-md-4">
                    <input id="Utel" name="Utel" type="text" placeholder="(13)0000-0000" class="form-control input-md">
                    <span class="help-block">10 caracteres</span>  
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="zipcode">CEP</label>  
                <div class="col-md-4" >
                    <input id="zipcode" name="zipcode" type="text" placeholder="00000-000" class="form-control input-md" size="30" style="width:30%; vertical-align:top">
                    <span class="help-block">8 caracteres</span>
                    <div  style="display:inline;"><a href="javascript:findCEP()"><img src="search-icon.gif" alt="Pesquisar" border="0"></a></div>
                    <div id="ajax-loading" style="display:none;"><img src="loading.gif"/></div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="street">Endereço</label>  
                <div class="col-md-5">
                    <input id="street" name="street" type="text" placeholder="Digite seu endereço.." class="form-control input-md">

                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="district">Bairro</label>  
                <div class="col-md-5">
                    <input id="district" name="district" type="text" placeholder="Digite seu bairro.." class="form-control input-md">

                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label" for="city">Cidade</label>  
                <div class="col-md-5">
                    <input id="city" name="city" type="text" placeholder="Digite seu bairro.." class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Unumero">Numero</label>  
                <div class="col-md-4">
                    <input id="Unumero" name="Unumero" type="text" placeholder="Digite o numero.." class="form-control input-md">

                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="state">Estado</label>
                <div class="col-md-4">
                    <select id="state" name="state" class="form-control">
                        <option value="">Selecione</option>
                        <option value="AC">AC</option>
                        <option value="AL">AL</option>
                        <option value="AP">AP</option>
                        <option value="AM">AM</option>
                        <option value="BA">BA</option>
                        <option value="CE">CE</option>
                        <option value="DF">DF</option>
                        <option value="ES">ES</option>
                        <option value="GO">GO</option>
                        <option value="MA">MA</option>
                        <option value="MT">MT</option>
                        <option value="MS">MS</option>
                        <option value="MG">MG</option>
                        <option value="PA">PA</option>
                        <option value="PB">PB</option>
                        <option value="PR">PR</option>
                        <option value="PE">PE</option>
                        <option value="PI">PI</option>
                        <option value="RJ">RJ</option>
                        <option value="RN">RN</option>
                        <option value="RS">RS</option>
                        <option value="RO">RO</option>
                        <option value="RR">RR</option>
                        <option value="SC">SC</option>
                        <option value="SP">SP</option>
                        <option value="SE">SE</option>
                        <option value="TO">TO</option>
                    </select>
                </div>
            </div>

            <!-- File Button --> 
            <div class="form-group">
                <label class="col-md-4 control-label" for="Ufoto">Inclua uma Foto</label>
                <div class="col-md-4">
                    <input id="Ufoto" name="Ufoto" class="input-file" type="file">
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Uenviar"></label>
                <div class="col-md-4">
                    <button id="Uenviar" name="Uenviar" class="btn btn-primary" type="submit">Enviar</button>
                </div>
            </div>

        </fieldset>
    </form>
</html>
