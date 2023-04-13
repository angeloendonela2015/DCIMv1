//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/



document.addEventListener("DOMContentLoaded", function(){
  (function () {
    'use strict'
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation');
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated')
        }, false)
      })
  })();


  var select = document.getElementById("my_select");
  var div = document.getElementById("oidInput");
  var display = document.getElementById("dist")
  select.addEventListener("change", function(){
    if (select.value === "MiniBoot_Outlet_8"){
      div.style.visibility = "visible";
      display.style.display = "block";
      document.getElementById("oidNameInput5").required = true;
      document.getElementById("ouiStatusInput5").required = true;
      document.getElementById("oidNameInput6").required = true;
      document.getElementById("ouiStatusInput6").required = true;
      document.getElementById("oidNameInput7").required = true;
      document.getElementById("ouiStatusInput7").required = true;
      document.getElementById("oidNameInput8").required = true;
      document.getElementById("ouiStatusInput8").required = true;

    } else {
      div.style.visibility = "hidden";
      display.style.display = "none";
      document.getElementById("oidNameInput5").required = false;
      document.getElementById("ouiStatusInput5").required = false;
      document.getElementById("oidNameInput6").required = false;
      document.getElementById("ouiStatusInput6").required = false;
      document.getElementById("oidNameInput7").required = false;
      document.getElementById("ouiStatusInput7").required = false;
      document.getElementById("oidNameInput8").required = false;
      document.getElementById("ouiStatusInput8").required = false;
    }
  });
});
