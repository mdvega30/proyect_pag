function pregunta() {// Editar Usuario (cambiar alerta)
    if (confirm('¿Estas seguro de enviar este formulario?')) {
        document.editar.submit();
    }
}

var error = false;

$(document).ready(function () {


    $('.input-email').on('focusout', function (event) {
        event.preventDefault();
        $.ajax({
            url: 'iniciar',
            dataType: 'text',
            method: 'POST',
            data: {'correo': $(this).val(), 'textOpcion': 4},
        }).done(function (data) {
            if (data === 'ok') {
                $('#resultado5').removeClass('alert-success');
                $('#resultado5').addClass('alert-danger');
                $('#resultado5').html('<b>¡Error!</b> Ya hay un usuario registrado con ese correo.');
                error = true;

            } else {
                error = false;

            }
        });
    });

});

/*Validacion Formulario de Registro*/
$(document).ready(function () {

    var validacion1 = true;
    var validacion2 = true;
    var validacion3 = true;
    var validacion4 = true;
    var validacion5 = true;
    var validacion6 = true;
    var validacion7 = true;
    var validacion8 = true;
    var validacion9 = true;
    console.log(validacion8);
    console.log(validacion9);
    var validarSujeto = new RegExp(/^[a-z\d_]{4,25}$/i);
    $('#pass').keyup(function (e) {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(this).val())) {
            $('#contra1').html('Más caracteres.');
        } else if (strongRegex.test($(this).val())) {
            $('#contra1').addClass('alert-success');
            $('#contra1').html('Fuerte!');
        } else if (mediumRegex.test($(this).val())) {
            $('#contra1').className = 'alert';
            $('#contra1').html('Media!');
        } else {
            $('#contra1').className = 'error';
            $('#contra1').html('Débil!');
        }
        return false;
    });
//Validacion Nombre
    $('#nom1').on('focusout', function (e) {
        var nom1 = $('#nom1').val()
        var vali = new RegExp(/^[a-z\d_]{4,25}$/i);
        if (nom1.trim() === '') {
            $('#resultado1').addClass('alert-danger');
            $('#resultado1').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion1 = true;
        } else if (false == validarSujeto.test(nom1)) {
            $('#resultado1').addClass('alert-danger');
            $('#resultado1').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.');
            validacion1 = true;
        } else {
            $('#resultado1').removeClass('alert-danger');
            $('#resultado1').addClass('alert-success');
            $('#resultado1').html('Coreecto!');
            validacion1 = false;
        }

    });
//Validacion Apellido1    
    $('#ape1').on('focusout', function (e) {
        var apel1 = $('#ape1').val();

        if (apel1.trim() === '') {
            $('#resultado3').addClass('alert-danger');
            $('#resultado3').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion3 = true;
        } else if (false == validarSujeto.test(apel1)) {
            $('#resultado3').addClass('alert-danger');
            $('#resultado3').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.');
            validacion3 = true;
        } else {
            $('#resultado3').removeClass('alert-danger');
            $('#resultado3').addClass('alert-success');
            $('#resultado3').html('Coreecto!');
            validacion3 = false;
        }

    });
// Validar Email
    $('#email').on('focusout', function () {
        var ema = $('#email').val();
        var validarCorreo = new RegExp(/\w+@\w+\.+[a-z]/);
        if (ema.trim() === '') {
            $('#resultado5').removeClass('alert-success');
            $('#resultado5').addClass('alert-danger');
            $('#resultado5').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion5 = true;
        } else if (false == validarCorreo.test(ema)) {

            $('#resultado5').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 35 y debe ser un correo.');
            validacion5 = true;
        } else {
            $('#resultado5').removeClass('alert-danger');
            $('#resultado5').addClass('alert-success');
            $('#resultado5').html('Coreecto!');
            validacion5 = false;
        }


    });
//validar DIRECCION 

    $('#direccion').on('focusout', function () {
        var direc = $('#direccion').val();
        if (direc.trim() === '') {

            $('#resultado6').addClass('alert-danger');
            $('#resultado6').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion6 = true;
        } else if (direc.length > 30 || direc.length < 5) {

            $('#resultado6').addClass('alert-danger');
            $('#resultado6').html('<strong>¡Error!</strong> Este campo debe contener mínimo 5 caracteres y máximo 30.');
            validacion6 = true;
        } else {
            $('#resultado6').removeClass('alert-danger');
            $('#resultado6').addClass('alert-success');
            $('#resultado6').html('Coreecto!');
            validacion6 = false;
        }
    });

    // Validar Documento



    $('#documento').on('focusout', function () {
        var doc = $('#documento').val();
        if (doc.trim() === '') {
            $('#resultado7').addClass('alert-danger');
            $('#resultado7').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion7 = true;
        } else if (isNaN(doc) || doc.length < 5 || doc.length > 20) {
            $('#resultado7').addClass('alert-danger');
            $('#resultado7').html('<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 20 y el documento debe ser numerico.');
            validacion7 = true;
        } else {
            $('#resultado7').removeClass('alert-danger');
            $('#resultado7').addClass('alert-success');
            $('#resultado7').html('Coreecto!');
            validacion7 = false;
        }
    });
    //validar contraseña
    $('#contra1').on('focusout', function () {
        var contra = $('#contra1').val();
        if (contra.trim() === '') {
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass('alert-danger');
            $('#resultado8').html('<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.');
            validacion8 = true;
            validacion4=false;
        } else {

        }

    });

    //Validar fuerza contraseña
    $('#contra1').keyup(function (e) {
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{6,}).*", "g");
        if (false == enoughRegex.test($(this).val())) {
            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').addClass('alert-danger');
            $('#resultado8').html('La contraseña debe ser minimo de 6 caracteres');
            validacion8 = true;
            validacion4=true;
        } else if (strongRegex.test($(this).val())) {

            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass('alert-success');
            $('#resultado8').html('La contraseña es segura!');
            validacion8 = false;
            validacion4=false;
        } else if (mediumRegex.test($(this).val())) {
            $('#resultado8').removeClass('alert-danger');
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').addClass('alert-warning');
            $('#resultado8').html('La contraseña es medianamente debil! debe llevar numeros y caracteres especiales');
            validacion8 = true;
            validacion4=true;
        } else {
            $('#resultado8').removeClass('alert-success');
            $('#resultado8').removeClass('alert-warning');
            $('#resultado8').addClass = ('alert-danger');
            $('#resultado8').html('La contraseña es muy debil! Debe llevar mayusculas y minusculas');
            validacion8 = true;
            validacion4=true;
        }
        return false;
    });
///validar contra2
    $('#contra2').on('focusout', function () {
        var cont2 = $('#contra2').val();
        var cont1 = $('#contra1').val();
        if (cont2.trim() === '') {
            $('#resultado9').removeClass('alert-success');
            $('#resultado9').addClass('alert-danger');
            $('#resultado9').html('<strong>¡Error!</strong> Este campo es requerido, digite su contraseña de nuevo.');
            validacion2 = false;
            validacion9 = true;
        } else {


        }
    });
//validar contra2 
    $('#contra2').keyup(function () {
        var cont2 = $('#contra2').val();
        var cont1 = $('#contra1').val();
        if (cont1 !== cont2) {
            $('#resultado9').removeClass('alert-success');
            $('#resultado9').addClass('alert-danger');
            $('#resultado9').html('<strong>¡Error!</strong> la contraseñas no coinsiden.');
            validacion9 = true;
             validacion2 = true;
        } else {
            $('#resultado9').removeClass('alert-danger');
            $('#resultado9').addClass('alert-success');
            $('#resultado9').html('<strong>¡Ok!</strong> la contraseñas si coinsiden.');
            validacion9 = false;
             validacion2 = true;
        }
    });


//No permite enviar el formulario hasta que el retorno sea TRUE
    $("#form-register").submit(function () {
        if (validacion1) {///nombre1
            $(location).attr('href', '#nombre1');
            $('#nom1').focus();
            return false;
        } else if (validacion3) {///apellido1
            $(location).attr('href', '#apellido1');
            $('#ape1').focus();
            return false;
        } else if (validacion5 || error === true) {//correo
            $(location).attr('hreft', '#correo');
            $('#email').focus();
            return false;
        } else if (validacion6) {//direccion
            $(location).attr('hreft', '#direccion');
            $('#direccion').focus();
            return false;
        } else if (validacion7) {//documento
            $(location).attr('hreft', '#documento');
            $('#documento').focus();
            return false;
        } else if (validacion8) {
            $(location).attr('hreft', '#contra1');
            $('#contra1').focus();
            return false;
        } else if (validacion9) {
            $(location).attr('hreft', '#contra2');
            $('#contra2').focus();
            return false;
        }

        return true;


    });
    $("#edit-men").submit(function () {
        if (validacion1) {///nombre1
            $(location).attr('href', '#nombre1');
            $('#nom1').focus();
            return false;
        } else if (validacion3) {///apellido1
            $(location).attr('href', '#apellido1');
            $('#ape1').focus();
            return false;
        } else if (validacion5 || error === true) {//correo
            $(location).attr('hreft', '#correo');
            $('#email').focus();
            return false;
        } else if (validacion6) {//direccion
            $(location).attr('hreft', '#direccion');
            $('#direccion').focus();
            return false;
        } else if (validacion7) {//documento
            $(location).attr('hreft', '#documento');
            $('#documento').focus();
            return false;
        }

        return true;


    });

});
///tabla editable del menu AddUniformes.jsp  funcion de seleccion multiple 
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});
