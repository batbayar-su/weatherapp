$(function() {
  for(var i = 0; i < weathers.length; i++)
  {
    if(weathers[i]['type'] == weather_type) {
      changeWeather(weathers[i]);
      break;
    }
  }
});
