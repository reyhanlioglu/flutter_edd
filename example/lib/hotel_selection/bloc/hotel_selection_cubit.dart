import 'package:equatable/equatable.dart';
import 'package:example/common_events/common_events.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/hotel_selection/repository/hotel_selection_repository_event.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/models/hotel_selection_item_model.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'hotel_selection_state.dart';

class HotelSelectionCubit extends Cubit<HotelSelectionState> with EventBusListener {
  HotelSelectionCubit() : super(HotelSelectionStateLoading()) {
    _listenEventBus();
  }

  void _listenEventBus() {
    listenEvent<EventBus, HotelSelectionRepositoryEventNotifyHotelListFetched>(
      onEventReceived: (event) {
        final hotels = event.data.hotels.map((hotel) => HotelSelectionItemModel.fromJson(hotel)).toList();
        emit(HotelSelectionStateLoaded(hotels: hotels));
        sendEvent<EventBus>(CommonEventDisplayWidget(id: EventId.displayPageHotelSelection));
      },
    );
  }

  void fetchHotels() {
    sendEvent<EventBus>(HotelSelectionRepositoryEventFetchHotelList());
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
