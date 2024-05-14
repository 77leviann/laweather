class AirQualityConstant {
  static Map<String, String> airQualityMap = {
    '1': 'Good',
    '2': 'Fair',
    '3': 'Moderate',
    '4': 'Poor',
    '5': 'Very Poor',
  };

  static String airQuality(String airQualityIndex) {
    return airQualityMap.containsKey(airQualityIndex)
        ? airQualityMap[airQualityIndex]!
        : 'Undefined';
  }
}
