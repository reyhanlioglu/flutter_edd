import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHotelCard extends StatefulWidget {
  const SearchHotelCard({super.key});

  @override
  State<SearchHotelCard> createState() => _SearchHotelCardState();
}

class _SearchHotelCardState extends State<SearchHotelCard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchHotelCardCubit(),
      child: BlocBuilder<SearchHotelCardCubit, SearchHotelCardState>(
        builder: (context, state) {
          final cubit = context.read<SearchHotelCardCubit>();
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: cubit.cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.dateRangeController,
                    decoration: const InputDecoration(
                      labelText: 'Start-End Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.numberOfPeopleController,
                    decoration: const InputDecoration(
                      labelText: 'Number of People',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _searchHotels(context),
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

  void _searchHotels(BuildContext context) {
    context.read<SearchHotelCardCubit>().onSearchHotels();
  }
}
