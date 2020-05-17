import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'e0b17d01bff931d0c6e5330e31d2274a';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {

    Location loc = Location();
    await loc.getCurrentPosition();

    String url = '$openWeatherMapURL?lat=${loc.lat}&lon=${loc.long}&appid=$apiKey&units=metric';

    Network network = Network(url);
    var weatherData = await network.getNetworkData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(cityName) async {

    String cityData = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';

    Network cityNetwork = Network(cityData);
    var cityWeatherData = await cityNetwork.getNetworkData();

    return cityWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
