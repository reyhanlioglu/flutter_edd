import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_cubit.dart';
import 'package:example/hotel_selection/hotel_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHotelCard extends StatefulWidget {
  const SearchHotelCard({super.key});

  @override
  State<SearchHotelCard> createState() => _SearchHotelCardState();
}

class _SearchHotelCardState extends State<SearchHotelCard> {
  // TODO: Move controllers to cubit
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateRangeController = TextEditingController();
  final TextEditingController _numberOfPersonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchHotelCardCubit(),
      child: BlocConsumer<SearchHotelCardCubit, SearchHotelCardState>(
        listener: (context, state) => _fillInputFields(state),
        builder: (context, state) {
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
        },
      ),
    );
  }

  void _fillInputFields(SearchHotelCardState state) {
    if (state.city != null) {
      _locationController.text = state.city!;
    }
    if (state.startEndDate != null) {
      _dateRangeController.text = state.startEndDate!;
    }
    if (state.numberOfPeople != null) {
      _numberOfPersonController.text = state.numberOfPeople!.toString();
    }
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
