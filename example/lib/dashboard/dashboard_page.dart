import 'package:example/dashboard/widgets/search_hotel_card/search_hotel_card.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_group_without_event_bus.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_widget/expandable_v1.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Booking Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SearchHotelCard(),
              const SizedBox(height: 32),
              ExpandableGroupWithoutEventBus(
                uiModels: [
                  ExpandableUIModel(
                    title: "Booking Process Overview",
                    content:
                    "Learn about the step-by-step process of booking a hotel room through our application. From searching for available rooms to finalizing your reservation, we guide you through each stage to ensure a smooth and hassle-free experience.",
                    isExpanded: true,
                  ),
                  ExpandableUIModel(
                    title: "Payment Methods",
                    content:
                        "Discover the various payment methods we accept for hotel bookings. Whether you prefer using credit cards, debit cards, or digital wallets, we provide multiple options to make your payment process convenient and secure.",
                  ),
                  ExpandableUIModel(
                    title: "Cancellation Policy",
                    content:
                        "Understand our cancellation policy to know your options in case you need to cancel your booking. We offer flexible cancellation terms to accommodate unforeseen changes in your travel plans, ensuring you have peace of mind when booking with us.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
