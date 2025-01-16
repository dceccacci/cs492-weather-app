import './forecast.dart' as forecast;

Future<void> main() async {
  // testing with Bend, OR coordinates
  double lat = 44.05;
  double lon = -121.31;
  // TODO: Seach for latitutes and longitudes of 5 cities in the US on the internet
  // Create a for loop that will generate forecasts arrays for each city
  // TODO: create forecasts and forecastsHourly both of type List<forecast.Forecast>

  List<List<double>> cityCoord = [
    [40.7128, -74.0060], // New York
    [34.0522, -118.2437], // Los Angeles
    [41.8781, -87.6298], // Chicago
    [29.7604, -95.3698], // Houston 
    [25.7617, -80.1918], // Miami
  ];

  for (List<double> city in cityCoord){
    List<forecast.Forecast> forcast = await forecast.getForecastFromPoints(city[0], city[1]);
    List<forecast.Forecast> forcastHourly = await forecast.getForecastHourlyFromPoints(city[0], city[1]);
    print("uh do");
  }
}