$(document).ready(function () {
    $(document).on('keyup', '.busca', function (e) {
        e.preventDefault();
        var mostrar = $('.busca').val();
        if (mostrar.length >= 3) {
            console.log(mostrar);
            $.ajax({
                url: 'busqueda.jsp',
                dataType: 'html',
                data: {'busqueda': mostrar},
                beforeSend: function (xhr) {
                    $('.show-result').html('Cargando ...');
                    $('.original-data').addClass('hide');
                }
            }).done(function (data) {
                $('.show-result').removeClass('hide');;
                $('.show-result').after(data);
            });
        } else {
            $('.show-result').addClass('hide');
            $('.original-data').removeClass('hide');
        }
    });
});

