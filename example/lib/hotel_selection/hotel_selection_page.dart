import 'package:example/common_events/common_events.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/hotel_selection/bloc/hotel_selection_cubit.dart';
import 'package:example/hotel_selection/repository/hotel_selection_repository.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/hotel_selection_item_widget.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/models/hotel_selection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return RepositoryProvider(
      create: (context) => HotelSelectionRepository(),
      lazy: false,
      child: BlocProvider(
        create: (context) => HotelSelectionCubit()..fetchHotels(),
        child: Scaffold(
          appBar: AppBar(title: Text('$city Hotels')),
          body: BlocBuilder<HotelSelectionCubit, HotelSelectionState>(
            builder: (context, state) {
              switch (state) {
                case HotelSelectionStateLoading():
                  return const Center(child: CircularProgressIndicator());
                case HotelSelectionStateLoaded():
                  return ListView.builder(
                    itemCount: state.hotels.length,
                    itemBuilder: (context, index) => HotelSelectionItemWidget(hotel: state.hotels[index]),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
