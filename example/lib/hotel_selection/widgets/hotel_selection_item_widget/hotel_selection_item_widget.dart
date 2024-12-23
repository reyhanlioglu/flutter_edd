import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/bloc/hotel_selection_item_cubit.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/models/hotel_selection_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSelectionItemWidget extends StatelessWidget {
  const HotelSelectionItemWidget({required this.hotel, super.key});

  final HotelSelectionItemModel hotel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelSelectionItemCubit(hotel: hotel),
      child: BlocBuilder<HotelSelectionItemCubit, HotelSelectionItemState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Card(
              shape: state.isHighlighted
                  ? RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    )
                  : null,
              child: ListTile(
                title: Text(hotel.name),
                subtitle: Text('${hotel.location} - \$${hotel.price} per night'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.star, color: Colors.amber),
                    Text(hotel.rating.toString()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
