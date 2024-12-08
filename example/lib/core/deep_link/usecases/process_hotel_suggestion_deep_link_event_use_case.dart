import 'package:example/widget_events/widget_events.dart';
import 'package:flutter_edd/flutter_edd.dart';

class ProcessHotelSuggestionDeepLinkEventUseCase {
  void call(Map<String, dynamic> data) {
    final String? city = data['city'];
    final String? startDate = data['startDate'];
    final String? endDate = data['endDate'];
    final int? numberOfPeople = data['numberOfPeople'];

    WidgetEventBus.instance.sendEvent(
      WidgetEventAutofillSearchHotelCard(
        data: WidgetEventDataAutofillSearchHotelCard(
          city: city,
          startEndDate: "$startDate - $endDate",
          numberOfPeople: numberOfPeople,
        ),
      ),
    );
  }
}
