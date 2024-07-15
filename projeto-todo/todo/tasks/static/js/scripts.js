$(document).ready(function() {
    var deleteBtn = $('.delete-btn');

    $(deleteBtn).on('click', function(e) {

        e.preventDefault();

        var delLink = $(this).attr('href');
        var result = confirm('Tem certeza que deseja deletar esta tarefa?');

        if(result) {
            window.location.href = delLink;
        }

    });
});