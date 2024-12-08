import 'package:equatable/equatable.dart';
import 'package:example/widget_events/widget_events.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'search_hotel_card_state.dart';

class SearchHotelCardCubit extends Cubit<SearchHotelCardState> with EventBusListener {
  SearchHotelCardCubit() : super(const SearchHotelCardState()) {
    _listenWidgetEventBus();
  }

  _listenWidgetEventBus() {
    listenDataEvent<WidgetEventBus, WidgetEventAutofillSearchHotelCard, WidgetEventDataAutofillSearchHotelCard>(
      onEventReceived: (data) {
        emit(
          state.copyWith(city: data.city, startEndDate: data.startEndDate, numberOfPeople: data.numberOfPeople),
        );
      },
    );
  }

  @override
  List<BaseEventBus> get eventBuses => [WidgetEventBus.instance];
}
