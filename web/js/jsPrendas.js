//SUBE IMAGEN(NOMBRE LA PREVISUALIZA, y Valida el tamaño )
$(document).ready(function () {
    var tamanoImagen = false;
    var nomUniforme = false;
    var descUniforme = false;
    var validarSujeto1 = new RegExp(/^[a-z\d_]{15,35}$/i);
    var validarSujeto2 = new RegExp(/^[a-z\d_]{15,45}$/i);

    $("#imgPren").change(function (e) {
        var _URL = window.URL;
        var respuesta = false;
        var file, img, origin_file;
        origin_file = this;
        if ((file = this.files[0])) {
            img = new Image();
            img.onload = function () {
                //#img-upload
                if (this.width <= 798 && this.height <= 1200) {//Valida tamaño de imagen 
                    $("#respuesta1").html("");
                    readURL(origin_file);
                    return tamanoImagen = false;//retorna falso si todo esta correcto

                } else {
                    $('#img-upload').attr('src', "");
                    $("#respuesta1").html("La imagen debe ser de un tamaño maximo de 798x1200 pixeles.");
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


    $(document).on('click', '.eliminaP', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
        $('.idDeletePre').val(mostrar);
    });
    
    $(document).on('click', '.editarP', function (e) {
        e.preventDefault();
        var mostrar = $(this).attr('value');
        console.log(mostrar);
//    $('.idEdit').val(mostrar);

        $.ajax({//pasar por post datos al controlador
            url: 'editarprenda.jsp',
            dataType: 'html',
            data: {'idPrenda': mostrar},
        }).done(function (data) {

            $('.formularioEditarPrenda').html(data);
        });
    });
});

