(function ($) {
    var i = 0;
    RemoveTableRow = function (handler) {
        var tr = $(handler).closest('tr');

        tr.fadeOut(400, function () {
            tr.remove();
        });

        return false;
    };

    AddTableRow = function () {

        var newRow = $("<tr>");
        var cols = "";


        cols += '<td><select id="sl_descricao" name="sl_descricao" class="form-control">' +
                '<option value="Perna Estendida">Perna Estendida</option>' +
                '<option value="Leg Press Inclinado">Leg Press Inclinado</option>' +
                '<option value="Supino Reto">Supino Reto</option>' +
                '<option value="Elevação Frontal">Elevação Frontal</option>' +
                '<option value="Crucifixo (ou Fly)">Crucifixo (ou Fly)</option>' +
                '<option value="Remada Unilateral">Remada Unilateral</option>' +
                '<option value="Triângulo e Polia Alta">Triângulo e Polia Alta</option>' +
                '</select></td>';
        cols += '<td> <select id="sl_serie" name="sl_serie" class="form-control">' +
                '<option value="1">1</option>' +
                '<option value="2">2</option>' +
                '<option value="3">3</option>' +
                '<option value="4">4</option>' +
                '</select></td>';
        cols += '<td> <select id="sl_repeticao" name="sl_repeticao" class="form-control">' +
                '<option value="5">5</option>' +
                '<option value="10">10</option>' +
                '<option value="15">15</option>' +
                '<option value="20">20</option>' +
                '</select></td>';
        cols += '<td> <select id="sl_grupomuscular" name="sl_grupomuscular" class="form-control">' +
                '<option value="Braço">Braço</option>' +
                '<option value="Perna">Perna</option>' +
                '<option value="Ombro">Ombro</option>' +
                '<option value="Costas">Costas</option>' +
                '</select></td>';

        cols += '<td class="actions">';
        cols += '<button class="btn btn-large btn-danger" onclick="RemoveTableRow(this)" type="button">Remover</button>';
        cols += '</td>';

        newRow.append(cols);

        $("#products-table").append(newRow);
        i++;
        return false;
    };
    $("#products-table").after(newRow);

})(jQuery);


