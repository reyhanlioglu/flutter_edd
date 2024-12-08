import 'package:example/widget_events/event_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

class WidgetEventDisplayPage extends WidgetEvent<dynamic, EventId> {
  WidgetEventDisplayPage({super.id});
}

class WidgetEventAutofillSearchHotelCard
    extends WidgetDataEvent<WidgetEventDataAutofillSearchHotelCard, dynamic, EventId> {
  WidgetEventAutofillSearchHotelCard({
    required super.data,
    super.preconditionedEventId = EventId.displayPageDashboard,
  });
}

class WidgetEventDataAutofillSearchHotelCard {
  final String? city;
  final String? startEndDate;
  final int? numberOfPeople;

  WidgetEventDataAutofillSearchHotelCard({
    this.city,
    this.startEndDate,
    this.numberOfPeople,
  });
}
