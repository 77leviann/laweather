class StringFormatHelper {
  static String formatForecastDescription(String? description) {
    if (description == null) return '';
    return description
        .toLowerCase()
        .replaceAll('_', ' ')
        .replaceAll('description.', '');
  }

  static String capitalizeDescription(String input) {
    if (input.isEmpty) return input;
    return input.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word.substring(0, 1).toUpperCase() + word.substring(1);
      } else {
        return '';
      }
    }).join(' ');
  }
}
