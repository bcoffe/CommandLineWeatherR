suppressMessages(library('RJSONIO'));
suppressMessages(library('RCurl'));

kelvinToFarenheit <- function (kelvinTemp) {
  (kelvinTemp - 273.15)*1.8 + 32;
}

args <- commandArgs(trailingOnly = TRUE)
latitude <- args[1];
longitude <- args[2];

currentWeather <- getURL(paste("http://api.openweathermap.org/data/2.5/weather?lat=",latitude, "&lon=", longitude, "&APPID=10c94e0253609fd9f78e207f831b2b09", sep=''));
weatherData <- fromJSON(currentWeather);

farenheitCurrentTemp <- kelvinToFarenheit(weatherData$main["temp"]);
farenheitHighTemp <- kelvinToFarenheit(weatherData$main["temp_max"]);
farenheitLowTemp <- kelvinToFarenheit(weatherData$main["temp_min"]);

cat( "Conditions for weatherData$name\n",
    "Current Temp: ", farenheitCurrentTemp, "° F\n",
    "High Temp: ", farenheitHighTemp, "° F\n",
    "Low Temp: ", farenheitLowTemp, "° F.", sep='');
print(weatherData);

f = CFILE("img/CurrentWeather.png", mode="wb");
curlPerform(url = paste("http://openweathermap.org/img/w/", weatherData$weather[[1]]$icon, ".png", sep=''), writedata = f@ref);
close(f);