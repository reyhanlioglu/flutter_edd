import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/event_bus/hotel_selection_item_bus_data_models.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/event_bus/hotel_selection_item_bus_events.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/models/hotel_selection_item_model.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'hotel_selection_item_state.dart';

class HotelSelectionItemCubit extends Cubit<HotelSelectionItemState> with EventBusListener {
  final HotelSelectionItemModel hotel;

  HotelSelectionItemCubit({required this.hotel}) : super(HotelSelectionItemState(isHighlighted: false)) {
    _listenWidgetEventBus();
  }

  @override
  List<BaseEventBus> get eventBuses => [WidgetEventBus.instance];

  void _listenWidgetEventBus() {
    listenDataEvent<WidgetEventBus, HotelSelectionItemHighlightForSuggestionBusEvent,
        HotelSelectionItemHighlightForSuggestionBusEventData>(
      onEventReceived: (data) {
        if (data.hotelId == hotel.id) {
          emit(state.copyWith(isHighlighted: true));
        }
      },
    );
  }
}
