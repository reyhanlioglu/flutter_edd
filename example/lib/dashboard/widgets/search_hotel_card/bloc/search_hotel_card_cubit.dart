import 'package:equatable/equatable.dart';
import 'package:example/core/navigation/navigation_listener_event.dart';
import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'search_hotel_card_state.dart';

class SearchHotelCardCubit extends Cubit<SearchHotelCardState> with EventBusListener {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
  final TextEditingController numberOfPersonController = TextEditingController();

  SearchHotelCardCubit() : super(const SearchHotelCardState()) {
    _listenWidgetEventBus();
  }

  onSearchHotels() {
    sendEvent(SearchHotelCardEventSearchHotels());
  }

  onCityChanged(String city) {
    cityController.text = city;
  }

  _listenWidgetEventBus() {
    listenDataEvent<WidgetEventBus, SearchHotelCardEventAutofillFields, SearchHotelCardEventDataAutofillFields>(
      onEventReceived: (data) {
        if (data.city != null) {
          cityController.text = data.city!;
        }
        if (data.startEndDate != null) {
          dateRangeController.text = data.startEndDate!;
        }
        if (data.numberOfPeople != null) {
          numberOfPersonController.text = data.numberOfPeople!.toString();
        }
        print('TEST: Inputs are filled');
      },
    );

    listenEvent<WidgetEventBus, SearchHotelCardEventSearchHotels>(
      onEventReceived: () {
        final city = cityController.text;
        final dateRange = dateRangeController.text;
        final numberOfPeople = numberOfPersonController.text;

        if (city.isEmpty || dateRange.isEmpty || numberOfPeople.isEmpty) {
          print('TEST: Returned');
          return;
        }

        print('TEST: Sending navigation event');

        sendEvent(
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
  List<BaseEventBus> get eventBuses => [WidgetEventBus.instance];

  @override
  Future<void> close() {
    cityController.dispose();
    dateRangeController.dispose();
    numberOfPersonController.dispose();
    return super.close();
  }
}
