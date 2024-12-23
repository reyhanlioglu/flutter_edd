import 'package:example/hotel_selection/repository/hotel_selection_repository_event.dart';
import 'package:flutter_edd/flutter_edd.dart';

class HotelSelectionRepository extends Cubit with EventBusListener {
  HotelSelectionRepository() : super(null) {
    _listenEventBus();
  }

  void _listenEventBus() {
    listenEvent<EventBus, HotelSelectionRepositoryEventFetchHotelList>(onEventReceived: _fetchHotels);
  }

  _fetchHotels(_) async {
    await Future.delayed(const Duration(seconds: 1));
    sendEvent<EventBus>(
      HotelSelectionRepositoryEventNotifyHotelListFetched(
        data: HotelSelectionRepositoryEventDataNotifyHotelListFetched(
          hotels: [
            {
              'id': 200,
              'name': 'The Ritz London',
              'location': 'London, UK',
              'price': 500,
              'rating': 4.9,
            },
            {
              'id': 203,
              'name': 'The Savoy',
              'location': 'London, UK',
              'price': 450,
              'rating': 4.8,
            },
            {
              'id': 217,
              'name': "Claridge's",
              'location': 'London, UK',
              'price': 400,
              'rating': 4.7,
            },
            {
              'id': 221,
              'name': 'The Langham',
              'location': 'London, UK',
              'price': 350,
              'rating': 4.6,
            },
            {
              'id': 225,
              'name': 'Shangri-La Hotel',
              'location': 'London, UK',
              'price': 300,
              'rating': 4.5,
            },
            {
              'id': 226,
              'name': 'The Connaught',
              'location': 'London, UK',
              'price': 320,
              'rating': 4.7,
            },
            {
              'id': 227,
              'name': 'The Dorchester',
              'location': 'London, UK',
              'price': 330,
              'rating': 4.8,
            },
            {
              'id': 228,
              'name': 'The Berkeley',
              'location': 'London, UK',
              'price': 340,
              'rating': 4.6,
            },
            {
              'id': 229,
              'name': "Brown's Hotel",
              'location': 'London, UK',
              'price': 310,
              'rating': 4.5,
            },
            {
              'id': 230,
              'name': 'The Lanesborough',
              'location': 'London, UK',
              'price': 360,
              'rating': 4.7,
            },
          ],
        ),
      ),
    );
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
