$(document).ready(function(){
    $("#drink").change(function(){
        $("#preview_img").css("background-image", "url('/static/drinks/"+$(this).val()+".jpg')");
    });
    $('#form_command').on('submit', function(e){
        e.preventDefault();
        data = {
            "firstname": $("#firstname").val(),
            "drink": $("#drink").val(),
            "size": $("#size").val(),
            "toppings": $("#toppings").val(),
            "note": $("#note").val(),
        };
        $.ajax({
            type: "POST",
            url: "/command",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8"
        }).done(function(data){
            document.location = '/';
        });        
        return false;
    });
});