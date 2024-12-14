import 'package:example/common_events/event_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

class HotelSelectionItemEventHighlightForSuggestion
    extends WidgetDataEvent<HotelSelectionItemEventDataHighlightForSuggestion, dynamic, EventId> {
  HotelSelectionItemEventHighlightForSuggestion({required super.data, super.preconditionedEventId});
}

class HotelSelectionItemEventDataHighlightForSuggestion {
  final int hotelId;

  HotelSelectionItemEventDataHighlightForSuggestion({required this.hotelId});
}
