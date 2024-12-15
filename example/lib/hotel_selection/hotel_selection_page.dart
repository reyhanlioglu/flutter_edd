import 'package:example/common_events/common_events.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/hotel_selection_item_widget.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/models/hotel_selection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

class HotelSelectionPage extends StatelessWidget {
  final String city;
  final String dateRange;
  final int numberOfPeople;

  const HotelSelectionPage({
    required this.city,
    required this.dateRange,
    required this.numberOfPeople,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Get hotels from BLoC
    final List<Map<String, dynamic>> hotels = [
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
        'name': 'Claridge\'s',
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
        'name': 'Brown\'s Hotel',
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
    ];

    Future.delayed(const Duration(milliseconds: 10), () {
      EventBus.instance.sendEvent(CommonEventDisplayWidget(id: EventId.displayPageHotelSelection));
    });

    return Scaffold(
      appBar: AppBar(title: Text('$city Hotels')),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) => HotelSelectionItemWidget(
          hotel: HotelSelectionItemModel.fromJson(hotels[index]),
        ),
      ),
    );
  }
}
