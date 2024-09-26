class WeatherModel 
{
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition,
      required this.cityName});

  factory WeatherModel.fromJson(Json) 
  {
    return WeatherModel
    (
      image: Json['forecast']['forecastday'][0]['day']['condition']['icon'],
        date: DateTime.parse(Json['current']['last_updated']),
        temp: Json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: Json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: Json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: Json['forecast']['forecastday'][0]['day']['condition']['text'],
        cityName: Json['location']['name']
    );
  }
}
