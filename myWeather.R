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

cat("In ",weatherData$name,
    ", currently it is ", farenheitCurrentTemp, "° F ",
    "with a of High ", farenheitHighTemp, "° F ",
    "and Low of ", farenheitLowTemp, "° F.\n", sep='');