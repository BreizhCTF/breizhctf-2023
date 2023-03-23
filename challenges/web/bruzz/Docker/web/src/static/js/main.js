$(document).ready(function () {
  /* Parallax */
  document.addEventListener("mousemove", parallax);
  function parallax(event) {
    this.querySelectorAll("#foreground").forEach((shift) => {
      const position = 2;
      const x = (window.innerWidth - event.pageX * position) / 90;
      const y = (window.innerHeight - event.pageY * position) / 90;

      shift.style.transform = `translateX(${x}px) translateY(${y}px)`;
    });
  }

  var sparkle = new Sparkle();
  sparkle.init("#sparkle");

  /* Quizz */
  $(".quizzbox").hide();
  $(".q1").show();

  var questions = {
    "<img src='/static/images/normandie-mont-saint-michel.gif'><br/><br/>A qui appartient le Mont Saint-Michel  ?":
      [
        "La Bretagne",
        "Le Pays de Galle (indépendAAAAANT)",
        "La Normandie",
        "Stéphanie de Monaco",
      ],
    "<img src='/static/images/barbecue-saucisse.gif'><br/><br/>Quel est le meilleur plat du monde ?":
      [
        "Galette-saucisse",
        "Galette-saucisse",
        "Galette-saucisse",
        "Galette-saucisse",
      ],
    "En quelle année, Nolwenn Leroy a-t-elle gagné La Star Academy ?": [
      "2001",
      "2002",
      "2003",
      "2004",
    ],
    "Lorsqu’une gelette tombe dans la neige avant le 31 décembre, on dit :": [
      "Petit A : Que c’est une galette qui est tombé dans la neige avant le 31 décembre ?",
      "Petit B : Que c’est une Kippa surgelée ?",
      "Petit C : Que c’est un frisbee comestible ?",
      "D. La réponse D",
    ],
  };

  var k1 = Object.keys(questions)[0];
  var q = 0;
  var res = [0, 0, 0, 0];
  $("#question").html(k1);
  $(".btn-bleu").text(questions[k1][0]);
  $(".btn-rouge").text(questions[k1][1]);
  $(".btn-vert").text(questions[k1][2]);
  $(".btn-jaune").text(questions[k1][3]);

  function submitAnswers() {
    $.ajax("/quizz", {
      data: JSON.stringify({ responses: res }),
      contentType: "application/json",
      type: "POST",
    })
      .done(function (data) {
        $("#spanpseudo").text($("#name").val());
        $("#scoreupper").text(data["score"]);
        $("#resultmsg").html(data["msg"]);

        $(".quizzbox").hide();
        $(".q3").show();
        $(".nav li:nth-child(2) span").removeClass("active");
        $(".nav li:nth-child(3) span").addClass("active");
      })
      .fail(function () {
        $("#resultmsg").text("Server error.");
        $("#pseudo").text("");
        $(".quizzbox").hide();
        $(".q3").show();
        $(".nav li:nth-child(2) span").removeClass("active");
        $(".nav li:nth-child(3) span").addClass("active");
      });
  }

  function nextQuestion() {
    q += 1;
    if (q == Object.keys(questions).length) {
      submitAnswers();
      return;
    }
    k = Object.keys(questions)[q];
    $("#question").html(k);
    $(".btn-bleu").text(questions[k][0]);
    $(".btn-rouge").text(questions[k][1]);
    $(".btn-vert").text(questions[k][2]);
    $(".btn-jaune").text(questions[k][3]);
  }
  var questionnb = 0;
  $(".btn-bleu").click(function () {
    res[q] = 0;
    nextQuestion();
  });
  $(".btn-rouge").click(function () {
    res[q] = 1;
    nextQuestion();
  });
  $(".btn-vert").click(function () {
    res[q] = 2;
    nextQuestion();
  });
  $(".btn-jaune").click(function () {
    res[q] = 3;
    nextQuestion();
  });

  $("#jouer").click(function () {
    $.ajax("/register", {
      data: JSON.stringify({ name: $("#name").val() }),
      contentType: "application/json",
      type: "POST",
    });
    $(".quizzbox").hide();
    $(".q2").show();
    $(".nav li:nth-child(1) span").removeClass("active");
    $(".nav li:nth-child(2) span").addClass("active");
  });
  $("#name").keyup(function (e) {
    if (e.keyCode == 13) {
      $("#jouer").click();
    }
  });

  $("#submitlogin").click(function () {
    var login = $("#logininput").val();
    var pwd = $("#passwordinput").val();

    $.ajax("/admin", {
      data: JSON.stringify({ login: login, password: pwd }),
      contentType: "application/json",
      type: "POST",
    }).done(function (data) {
      if (data != "0") {
        location.reload();
      }
    });
  });
  $("#passwordinput").keyup(function (e) {
    if (e.keyCode == 13) {
      $("#submitlogin").click();
    }
  });
});
