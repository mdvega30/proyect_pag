//SUBE IMAGEN(NOMBRE LA PREVISUALIZA, y Valida el tamaño )
$(document).ready(function () {
    var tamanoImagen = false;
    var nomUniforme = false;
    var descUniforme = false;
    var validarSujeto1 = new RegExp(/^[a-z\d_]{15,35}$/i);
    var validarSujeto2 = new RegExp(/^[a-z\d_]{15,45}$/i);

    $("#imgInp").change(function (e) {
        var _URL = window.URL;
        var respuesta = false;
        var file, img, origin_file;
        origin_file = this;
        if ((file = this.files[0])) {
            img = new Image();
            img.onload = function () {
                //#img-upload
                if (this.width == 330 && this.height == 660) {//Valida tamaño de imagen 
                    $("#respuesta1").html("");
                    readURL(origin_file);
                    return tamanoImagen = false;//retorna falso si todo esta correcto

                } else {
                    $('#img-upload').attr('src', "");
                    $("#respuesta1").html("La imagen debe ser de un tamaño de 800x500 pixeles.");
                    return tamanoImagen = true;
                }

            };
            img.src = _URL.createObjectURL(file);
        }
//15 maximo 45
    });
});
/*imagen preview*/

$(document).on('change', '.btn-file :file', function () {
    var input = $(this),
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [label]);
});

$('.btn-file :file').on('fileselect', function (event, label) {

    var input = $(this).parents('.input-group').find(':text'),
            log = label;

    if (input.length) {
        input.val(log);
    } else {
        if (log)
            alert(log);
    }

});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#img-upload').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


/*Form eliminar de adduniforme.jsp enviar datos */
$(document).ready(function () {


    $(document).on('click', '.eliminaI', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
        $('.idDeleteIns').val(mostrar);
    });
    
    $(document).on('click', '.editarI', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
        console.log(mostrar);
//    $('.idEdit').val(mostrar);

        $.ajax({//pasar por post datos al controlador
            url: 'editarinstitucion.jsp',
            dataType: 'html',
            data: {'idInstitucion': mostrar},
        }).done(function (data) {

            $('.formularioEditarPrenda').html(data);
        });
    });
});

