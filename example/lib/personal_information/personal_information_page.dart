import 'package:example/hotel_selection/bloc/hotel_selection_cubit.dart';
import 'package:example/hotel_selection/repository/hotel_selection_repository.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/hotel_selection_item_widget.dart';
import 'package:example/personal_information/bloc/personal_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInformationCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Personal Information')),
        body: BlocBuilder<PersonalInformationCubit, PersonalInformationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [

                  TextFormField(
                    controller: context.read<PersonalInformationCubit>().fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: context.read<PersonalInformationCubit>().emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: context.read<PersonalInformationCubit>().phoneNumberController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
