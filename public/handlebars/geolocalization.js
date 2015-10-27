$(document).ready(function(){
  geoFindMe();
});


function geoFindMe() {
  var output = document.getElementById("notice-geo");

  if (!navigator.geolocation){
    output.innerHTML = "Tu navegador no soporta la geolocalización.";
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;
    output.innerHTML = "<p>["+latitude+","+longitude +"]</p>";
    $('#latitude').val(latitude);
    $('#longitude').val(longitude);

    //var img = new Image();
    //img.src = "https://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";
    //output.appendChild(img);
  };

  function error() {
    output.innerHTML = "No ha sido posible establecer la geolocalización";
  };

  output.innerHTML = "<p>Localizando</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}