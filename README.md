CommandLineWeatherR
===================

Retrieves the current Weather using the Open Weather API using R and displays it.

This project was created solely for learning, personal enjoyment, and because I was bored. There is no warrenty of any type. Anyone familiar with software engineering can readily see numerous places this code can be improved. However, this can be used in at least 2 ways.

- First: It can be simply used to disply current weather on the command line.
- Second: It can be used with either Conky on linux or GeekTool on Mac OS X to display the Weather the Desktop.

To use this application you must have R installed with the RCurl and RJSONIO packages. If you do not have those installed, see the documentation at http://cran.r-project.org.

This application uses my APPID key from Open Weather. Change that key to your key by signing up at http://openweathermap.org/API. This key can be found on line 12 in the source code as part of the URL.

Assuming the prerequisites are met, this application can be run by typing:

Rscript myWeather.R <LAT_DECIMAL> <LON_DECIMAL> <KEY>

Replacing LAT_DECIMAL and LON_DECIMAL with the Latitude and Longitude for the place you would like the current weather.

Example: Rscript myWeather.R 36 -75 randomPlaceWeather

The script will download an image of the current weather and place it in the img/ directory and name the dowloaded file using the <KEY> name you pass in. It will overright the image each time the script is run. Therefore, if you are wanting to run the script for multiple locations at once, such as in GeekTool or Conky please give each command a unique <KEY>.
