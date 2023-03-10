//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener("DOMContentLoaded", function(){
  var select = document.getElementById("my_select");
  var div =document.getElementById("my_div");

  select.addEventListener("change", function(){
    if (select.value === "MiniBoot_Outlet_8"){
      div.style.display = "block";
    } else {
      div.style.display = "none";
    }
  });
});
