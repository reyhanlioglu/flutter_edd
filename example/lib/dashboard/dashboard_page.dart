import 'package:example/dashboard/widgets/search_hotel_card/search_hotel_card.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_group_with_event_bus.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_group_without_event_bus.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const uiModelBooking = [
    ExpandableUIModel(
      title: "Booking Process Overview",
      content:
          "Learn about the step-by-step process of booking a hotel room through our application. From searching for available rooms to finalizing your reservation, we guide you through each stage to ensure a smooth and hassle-free experience.",
      isExpanded: true,
    ),
    ExpandableUIModel(
      title: "Loyalty Program",
      content:
          "Join our loyalty program to earn points with every booking. Redeem points for free nights, exclusive discounts, and special offers. Enjoy the benefits of being a valued member of our hotel community.",
    ),
    ExpandableUIModel(
      title: "Local Attractions",
      content:
          "Discover the top local attractions near our hotel. Whether you're interested in sightseeing, dining, or entertainment, we provide recommendations and information to help you make the most of your stay.",
    ),
  ];

  static const uiModelPaymentAndCancellation = [
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
    ExpandableUIModel(
      title: "Payment Security",
      content:
          "Learn about the measures we take to ensure the security of your payment information. We use advanced encryption technologies and comply with industry standards to protect your data and provide a safe booking experience.",
    ),
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SearchHotelCard(),
              const SizedBox(height: 32),
              Text("Booking", style: Theme.of(context).textTheme.headlineMedium),
              const ExpandableGroupWithoutEventBus(uiModels: uiModelBooking),
              const SizedBox(height: 16),
              Text("Payment Information", style: Theme.of(context).textTheme.headlineMedium),
              const ExpandableGroupWithEventBus(uiModels: uiModelPaymentAndCancellation),
            ],
          ),
        ),
      ),
    );
  }
}
