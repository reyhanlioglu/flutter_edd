import 'package:example/common_events/event_ids.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/event_bus/hotel_selection_item_bus_data_models.dart';
import 'package:flutter_edd/flutter_edd.dart';

class HotelSelectionItemHighlightForSuggestionBusEvent
    extends WidgetDataEvent<HotelSelectionItemHighlightForSuggestionBusEventData, dynamic, EventId> {
  HotelSelectionItemHighlightForSuggestionBusEvent({required super.data, super.preconditionedEventId});
}
