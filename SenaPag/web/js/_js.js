

/*Validacion Formulario de Registro*/
function validacion() {
    var nom1, nom2, ape1, ape2, email, direccion, documento, tipoDoc, contra1, contra2;

    nom1 = document.getElementById("nom1").value;
    nom2 = document.getElementById("nom2").value;
    ape1 = document.getElementById("ape1").value;
    ape2 = document.getElementById("ape2").value;
    email = document.getElementById("email").value;
    direccion = document.getElementById("direccion").value;
    documento = document.getElementById("documento").value;
    tipoDoc = document.getElementById("tipoDoc").value;
    contra1 = document.getElementById("contra1").value;
    contra2 = document.getElementById("contra2").value;

    if (nom1 === "") {
        document.getElementById("resultado1").innerHTML = "<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.";
        document.location.href = "#nombre1";
        document.getElementById("nom1").focus();
        return false;
    } else if (!/^[a-z\d_]{4,25}$/i.test(nom1)) {
        document.getElementById("resultado1").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.";
        document.location.href = "#nombre1";
        document.getElementById("nom1").focus();
        return false;
    } else {

        document.getElementById("resultado1").innerHTML = "";
    }

    if (ape1 === "") {
        document.getElementById("resultado3").innerHTML = "<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.";
        document.location.href = "#apellido1";
        document.getElementById("ape1").focus();
        return false;
    } else if (!/^[a-z\d_]{4,25}$/i.test(ape1)) {
        document.getElementById("resultado3").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 25 y no puede llevar caracteres especiales.";
        document.location.href = "#apellido1";
        document.getElementById("ape1").focus();
        return false;
    } else {

        document.getElementById("resultado3").innerHTML = "";
    }

    if (email === "") {
        document.getElementById("resultado5").innerHTML = "<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.";
        document.location.href = "#correo";
        document.getElementById("email").focus();
        return false;
    } else if (!(/\w+@\w+\.+[a-z]/.test(email)) || email.length > 35) {
        document.getElementById("resultado5").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 4 caracteres y máximo 35 y debe ser un correo.";
        document.location.href = "#correo";
        document.getElementById("email").focus();
        return false;
    } else {
        document.getElementById("resultado5").innerHTML = "";
    }

    if (direccion === "") {
        document.getElementById("resultado6").innerHTML = "<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.";
        document.location.href = "#direccion";
        document.getElementById("direccion").focus();
        return false;
    } else if ((direccion.length > 30) || (direccion.length < 5)) {
        document.getElementById("resultado6").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 30.";
        document.location.href = "#direccion";
        document.getElementById("direccion").focus();
        return false;
    } else {

        document.getElementById("resultado6").innerHTML = "";
    }

    if (documento === "") {
        document.getElementById("resultado7").innerHTML = "<strong>¡Error!</strong> Este campo es requerido, no debe ir vacío.";
        document.location.href = "#documento";
        document.getElementById("documento").focus();
        return false;
    } else if (isNaN(documento) || documento.length > 20 || documento.length < 5) {
        document.getElementById("resultado7").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 5 caracteres y máximo 20 y el documento debe ser numerico.";
        document.location.href = "#documento";
        document.getElementById("documento").focus();
        return false;

    } else {

        document.getElementById("resultado7").innerHTML = "";
    }

    if (contra1 !== contra2) {
        document.getElementById("resultado8").innerHTML = "<strong>¡Error!</strong> ¡Error! la contraseñas no coinside.";
        document.getElementById("resultado9").innerHTML = "<strong>¡Error!</strong> ¡Error! la contraseñas no coinside.";

        document.location.href = "#contra1";
        document.getElementById("contra1").focus();
        return false;
    } else if (contra1 === "") {
        document.getElementById("resultado8").innerHTML = "<strong>¡Error!</strong> ¡Error!Este campo es requerido, no debe ir vacío.";
        document.location.href = "#contra1";
        document.getElementById("contra1").focus();
        return false;

    } else if (contra2 === "") {
        document.getElementById("resultado9").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo es requerido, no debe ir vacío.";
        document.location.href = "#contra2";
        document.getElementById("contra2").focus();
        return false;
    } else if (contra1.length < 6) {
        document.getElementById("resultado8").innerHTML = "<strong>¡Error!</strong> ¡Error! Este campo debe contener mínimo 6 caracteres y máximo 16.";
        document.location.href = "#contra1";
        document.getElementById("contra1").focus();
        return false;
    } else {
        document.getElementById("resultado8").innerHTML = "";
        document.getElementById("resultado9").innerHTML = "";

    }

}
function pregunta() {
    if (confirm('¿Estas seguro de enviar este formulario?')) {
        document.editar.submit();
    }
}


$(document).ready(function () {

    var error = false;

    $('.input-email').on('focusout', function (event) {
        event.preventDefault();
        $.ajax({
            url: 'iniciar',
            dataType: 'text',
            method: 'POST',
            data: {'correo': $(this).val(), 'textOpcion': 4},
        }).done(function (data) {
            if (data === 'ok') {
                $('#resultado5').html('<b>¡Error!</b> Ya hay un usuario registrado con ese correo.');
                error = true;

            } else {
                $('.message').html(' ');

            }
        });
    });

});
