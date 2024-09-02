$(function () {
  function display(bool) {
    if (bool) {
      $("#container").show();
    } else {
      $("#container").hide();
    }
  }

  display(false);

  window.addEventListener("message", function (event) {
    display(false);
    var grades = Array.from(document.getElementsByClassName("top-left"));
    grades.forEach((grade) => {
      grade.remove();
    });
    grades = Array.from(document.getElementsByClassName("top-right"));
    grades.forEach((grade) => {
      grade.remove();
    });
    var item = event.data;
    var card = item.card;
    if (item.type === "fdtrading") {
      if (item.status == true) {
        display(true);
        document.getElementById("thecard").src = "Back.png";

        var opp = 1.0 - item.grade / 10.0;
        opp = opp + 0.01;
        if (item.graded === "True") {
          mergeImages([
            { src: "back.png", opacity: 1.0, x: 21.0, y: 515.0 },
            { src: "case.png", opacity: 1.0, x: 0.0, y: 0.0 },
          ]).then((b64) => (document.getElementById("thebackcard").src = b64));

          mergeImages([
            { src: card, opacity: 1.0, x: 21.0, y: 515.0 },
            { src: "grit.png", opacity: opp, x: 21.0, y: 515.0 },
            { src: "case.png", opacity: 1.0, x: 0.0, y: 0.0 },
          ]).then((b64) => (document.getElementById("thecard").src = b64));

          var div = document.createElement("div");
          var text = document.createTextNode("GRADE: " + item.grade);
          div.className = "top-left";
          div.appendChild(text);
          var element = document.getElementById("cardDiv");
          element.appendChild(div);

          var div2 = document.createElement("div");
          var text2 = document.createTextNode(
            "#" + String(item.number).padStart(5, "0")
          );
          div2.className = "top-right";
          div2.appendChild(text2);
          var element = document.getElementById("cardDiv");
          element.appendChild(div2);
        } else {
          document.getElementById("thebackcard").src = "Back.png";
          mergeImages([
            { src: card, opacity: 1.0 },
            { src: "grit.png", opacity: opp },
          ]).then((b64) => (document.getElementById("thecard").src = b64));
        }
        setTimeout(() => {
          $.post("https://psv-tradingcards/callback", JSON.stringify({}));
          return;
        }, 6000);
      } else {
        display(false);
      }
    } else {
      var opp = 1.0 - item.grade / 10.0;
      opp = opp + 0.01;
      if (item.graded === "True") {
        mergeImages([
          { src: "back.png", opacity: 1.0, x: 21.0, y: 515.0 },
          { src: "case.png", opacity: 1.0, x: 0.0, y: 0.0 },
        ]).then((b64) => (document.getElementById("thebackcard").src = b64));

        mergeImages([
          { src: card, opacity: 1.0, x: 21.0, y: 515.0 },
          { src: "grit.png", opacity: opp, x: 21.0, y: 515.0 },
          { src: "case.png", opacity: 1.0, x: 0.0, y: 0.0 },
        ]).then((b64) => (document.getElementById("thecard").src = b64));

        var div = document.createElement("div");
        var text = document.createTextNode("GRADE: " + item.grade);
        div.className = "top-left";
        div.appendChild(text);
        var element = document.getElementById("cardDiv");
        element.appendChild(div);

        var div2 = document.createElement("div");
        var text2 = document.createTextNode(
          "#" + String(item.number).padStart(5, "0")
        );
        div2.className = "top-right";
        div2.appendChild(text2);
        var element = document.getElementById("cardDiv");
        element.appendChild(div2);
      } else {
        document.getElementById("thebackcard").src = "Back.png";
        mergeImages([
          { src: card, opacity: 1.0 },
          { src: "grit.png", opacity: opp },
        ]).then((b64) => (document.getElementById("thecard").src = b64));
      }
      setTimeout(() => {
        display(true);
      }, 500);
    }

    //when the user clicks on the submit button, it will run
    $("#button").click(function () {
      $.post("https://psv-tradingcards/callback", JSON.stringify({}));
      return;
    });
  });
  // if the person uses the escape key, it will exit the resource
  document.onkeyup = function (data) {
    if (data.which == 27) {
      var grades = Array.from(document.getElementsByClassName("top-left"));

      grades.forEach((grade) => {
        grade.remove();
      });
      grades = Array.from(document.getElementsByClassName("top-right"));

      grades.forEach((grade) => {
        grade.remove();
      });
      display(false);
      $.post("https://psv-tradingcards/close", JSON.stringify({}));
      return;
    }
  };
});
