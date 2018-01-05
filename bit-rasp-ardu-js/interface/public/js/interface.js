// Function to control lamp
$(document).ready(function() {

  // Refresh sensor data
  refreshSensors();
  setInterval(refreshSensors, 5000);

});


function refreshSensors() {

    $.get('/sensor/set_dht', function(json_data) {
      $("#temperature").text('Temperature: ' + json_data.temperature + ' °C');

  	  $.get('/sensor/set_dht', function(json_data) {
        $("#humidity").text('Humidity: ' + json_data.humidity + ' %');
      });
    });

    $.get('/sensor/set_dust', function(json_data) {
        $("#dustDensityug").text('DustDensityug:' + json_data.dustDensityug + ' ugm3');
    });
}
