enum DeepLinkEventType {
  hotelSuggestion;

  static DeepLinkEventType fromString(String value) {
    return DeepLinkEventType.values.firstWhere((e) => e.name == value);
  }
}