$( document ).ready(function() {
    var myfp = new fullpage('#fullpage',{
        anchors:['home', 'art1', 'art2', 'art3', 'art4', 'oc', 'contact'],
        onLeave: afterslide
    });

    function afterslide(section, origin, destination, direction){
        //console.dir(section);
        $(".iframe-wrapper iframe").fadeOut();
        //origin['anchor']
        $("#menuleft a div").removeClass("active");
        $("#menuleft a[href='#"+origin['anchor']+"'] div").addClass("active");
        $("div[data-anchor='"+origin['anchor']+"'] .iframe-wrapper iframe").fadeIn(750);
    }
    
    $("#send_but").click(function(){
        vname = $("#inp_name").val();
        vmail = $("#inp_mail").val();
        vmsg = $("#inp_msg").val();
        $.post( "mail.php", { name: vname, mail: vmail, msg: vmsg },function(data){
            if (data === "success"){
                $("#ressendmail").text("Email has been send !");
                $("#ressendmail").css("color","#d3e66c");
            }else if (data === "badmail"){
                $("#ressendmail").text("Wrong email.");
                $("#ressendmail").css("color","#e66c6c");
            }else{
                $("#ressendmail").text("Error, you should retry later.");
                $("#ressendmail").css("color","#e66c6c");
            }
            $("#ressendmail").fadeIn();
            $("#ressendmail").delay(1000).fadeOut();
        });
    });

    $(".nextsection").click(function(){
        myfp.moveSectionDown();
    });
    
    $("#topright").click(function(){
        $("#menuright").slideDown();
    });
    $("#menuright").click(function(){
        $(this).slideUp();
    });

    $("#loaddiv").hide(); // Document is ready
});
