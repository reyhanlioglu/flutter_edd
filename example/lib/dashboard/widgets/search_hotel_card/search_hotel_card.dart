import 'package:example/hotel_selection/hotel_selection_page.dart';
import 'package:flutter/material.dart';

class SearchHotelCard extends StatefulWidget {
  const SearchHotelCard({super.key});

  @override
  State<SearchHotelCard> createState() => _SearchHotelCardState();
}

class _SearchHotelCardState extends State<SearchHotelCard> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateRangeController = TextEditingController();
  final TextEditingController _numberOfPersonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _dateRangeController,
              decoration: const InputDecoration(
                labelText: 'Start-End Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _numberOfPersonController,
              decoration: const InputDecoration(
                labelText: 'Number of People',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchHotels,
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  void _searchHotels() {
    final city = _locationController.text;
    final dateRange = _dateRangeController.text;
    final numberOfPerson = _numberOfPersonController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HotelSelectionPage(
          city: city,
          dateRange: dateRange,
          numberOfPerson: int.parse(numberOfPerson),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    _dateRangeController.dispose();
    _numberOfPersonController.dispose();
    super.dispose();
  }
}
