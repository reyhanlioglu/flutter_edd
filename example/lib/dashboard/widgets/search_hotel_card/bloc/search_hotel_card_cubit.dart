import 'package:equatable/equatable.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/common_events/common_events.dart';
import 'package:example/core/navigation/navigation_listener_event.dart';
import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'search_hotel_card_state.dart';

class SearchHotelCardCubit extends Cubit<SearchHotelCardState> with EventBusListener {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
  final TextEditingController numberOfPeopleController = TextEditingController();

  SearchHotelCardCubit() : super(const SearchHotelCardState()) {
    _listenWidgetEventBus();
    EventBus.instance.sendEvent(CommonEventDisplayWidget(id: EventId.displayWidgetSearchHotelCard));
  }

  onSearchHotels() {
    sendEvent(SearchHotelCardEventSearchHotels());
  }

  _listenWidgetEventBus() {
    listenDataEvent<EventBus, SearchHotelCardEventAutofillFields, SearchHotelCardEventDataAutofillFields>(
      onEventReceived: (data) {
        if (data.city != null) {
          cityController.text = data.city!;
        }
        if (data.startEndDate != null) {
          dateRangeController.text = data.startEndDate!;
        }
        if (data.numberOfPeople != null) {
          numberOfPeopleController.text = data.numberOfPeople!.toString();
        }
      },
    );

    listenEvent<EventBus, SearchHotelCardEventSearchHotels>(
      onEventReceived: (_) {
        final city = cityController.text;
        final dateRange = dateRangeController.text;
        final numberOfPeople = numberOfPeopleController.text;

        if (city.isEmpty || dateRange.isEmpty || numberOfPeople.isEmpty) {
          return;
        }

        sendEvent<EventBus>(
          NavigationEvent(
            data: NavigationEventData(
              navigationType: NavigationTypePush(
                path: "/hotel-selection?city=$city&dateRange=$dateRange&numberOfPeople=$numberOfPeople",
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];

  @override
  Future<void> close() {
    cityController.dispose();
    dateRangeController.dispose();
    numberOfPeopleController.dispose();
    return super.close();
  }
}
