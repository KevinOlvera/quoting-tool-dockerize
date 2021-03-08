var flag = 0;
//console.log(flag);

$("#container1").show();
$("#container2").hide();
$("#container3").hide();
$("#create").hide();
$("#back").addClass("disabled");

$("#business").show();
$("#vns").hide();
$("#vcs").hide();

$("#next").click(function(){
  switch (flag) {
    case 0:
      $("#container1").hide();
      $("#container2").show();
      $("#back").removeClass("disabled");
      $("#back_s").removeClass("disabled");
      $("#business").hide();
      $("#vns").show();
      flag++;
      break;

    case 1:
      $("#container2").hide();
      $("#container3").show();
      $("#next").hide();
      $("#create").show();
      $("#next_s").hide();
      $("#create_s").show();
      $("#vns").hide();
      $("#vcs").show();
      flag++;
      break;

    default:
      console.log("ERROR: There are no containers to show.")
      break;
  }
  //console.log(flag);
});

$("#back").click(function(){
  switch (flag) {
    case 1:
      $("#container2").hide();
      $("#container1").show();
      $("#back").addClass("disabled");
      $("#back_s").addClass("disabled");
      flag--;
      $("#vns").hide();
      $("#business").show();
      break;

    case 2:
      $("#container2").show();
      $("#container3").hide();
      $("#next").show();
      $("#create").hide();
      $("#next_s").show();
      $("#create_s").hide();
      $("#vns").show();
      $("#vcs").hide();
      flag--;
      break;

    default:
      console.log("ERROR: There are no containers to show.")
      break;
  }
  //console.log(flag);
});


$("#create_s").hide();
$("#back_s").addClass("disabled");

$("#next_s").click(function(){
  switch (flag) {
    case 0:
      $("#container1").hide();
      $("#container2").show();
      $("#back_s").removeClass("disabled");
      $("#back").removeClass("disabled");
      $("#business").hide();
      $("#vns").show();
      flag++;
      break;

    case 1:
      $("#container2").hide();
      $("#container3").show();
      $("#next_s").hide();
      $("#create_s").show();
      $("#next").hide();
      $("#create").show();
      $("#vns").hide();
      $("#vcs").show();
      flag++;
      break;

    default:
      console.log("ERROR: There are no containers to show.")
      break;
  }
  //console.log(flag);
});

$("#back_s").click(function(){
  switch (flag) {
    case 1:
      $("#container2").hide();
      $("#container1").show();
      $("#back").addClass("disabled");
      $("#back_s").addClass("disabled");
      $("#vns").hide();
      $("#business").show();
      flag--;
      break;

    case 2:
      $("#container2").show();
      $("#container3").hide();
      $("#next").show();
      $("#create").hide();
      $("#next_s").show();
      $("#create_s").hide();
      $("#vns").show();
      $("#vcs").hide();
      flag--;
      break;

    default:
      console.log("ERROR: There are no containers to show.")
      break;
  }
  //console.log(flag);
});