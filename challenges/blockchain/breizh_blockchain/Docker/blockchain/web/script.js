jQuery(function(){
    function getCookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(';');
        for(let i = 0; i <ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }
    let addr = getCookie('addr');
    if (addr != "") {
        $("#addr").val(addr);
        $("#deploy").hide();
        $("#address").show();
    }
    $("#start").on("click", function(){
        var chall = $("#challenge").val();
        var wallet = $("#wallet").val();
        $.ajax({
            type: "POST",
            url: "/deploy",
            data: JSON.stringify({
                "id": chall,
                "wallet": wallet
            }),
            contentType: "application/json",
            dataType: 'json',
            success: function(data) {
                if("msg" in data){
                    $("#addr").val(data.msg);
                    $("#deploy").hide();
                    $("#address").show();
                }
                if("err" in data){
                    $("#error").val(data.err);
                }
            }
        });
    });

    $("#faucet").on("click", function(){
        var wallet = $("#wallet").val();
        $.ajax({
            type: "POST",
            url: "/faucet",
            data: JSON.stringify({
                "wallet": wallet
            }),
            contentType: "application/json",
            dataType: 'json',
            success: function(data) {
                if("msg" in data){
                    $("#message").text(data.msg);
                }
                if("err" in data){
                    $("#message").text(data.err);
                }
            }
        });
    });

    $("#flag").on("click", function(){
        $.ajax({
            type: "GET",
            url: "/flag",
            success: function(data) {
                if("msg" in data){
                    $("#message").text(data.msg);
                }
                if("err" in data){
                    $("#message").text(data.err);
                }
            }
        });
    });
});