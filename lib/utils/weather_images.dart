String getWeatherImageAsset(String? condition) {
  if (condition == null) return 'assets/images/clear.png';

  if (condition.toLowerCase().contains('clear') ||
      condition.toLowerCase().contains('sunny')) {
    return 'assets/images/clear.png';
  } else if (condition.toLowerCase().contains('cloud')) {
    return 'assets/images/cloud.png';
  } else if (condition.toLowerCase().contains('rain') ||
      condition.toLowerCase().contains('drizzle') ||
      condition.toLowerCase().contains('shower')) {
    return 'assets/images/rain.png';
  } else if (condition.toLowerCase().contains('snow') ||
      condition.toLowerCase().contains('freezing') ||
      condition.toLowerCase().contains('blizzard') ||
      condition.toLowerCase().contains('ice') ||
      condition.toLowerCase().contains('sleet')) {
    return 'assets/images/freezing-snow.png';
  } else if (condition.toLowerCase().contains('thunder')) {
    return 'assets/images/thunder.png';
  } else if (condition.toLowerCase().contains('fog') ||
      condition.toLowerCase().contains('mist')) {
    return 'assets/images/fog.png';
  } else {
    return 'assets/images/clear.png';
  }
}
