import 'package:equatable/equatable.dart';
import 'package:example/common_events/common_events.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/personal_information/bloc/personal_information_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'personal_information_state.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> with EventBusListener {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  PersonalInformationCubit() : super(const PersonalInformationState()) {
    _listenEventBus();
    EventBus.instance.sendEvent(CommonEventDisplayWidget(id: EventId.displayPagePersonalInformation));
  }

  void _listenEventBus() {
    listenEvent<EventBus, PersonalInformationEventSetFullName>(
      onEventReceived: (event) => fullNameController.text = event.data,
    );
    listenEvent<EventBus, PersonalInformationEventSetEmail>(
      onEventReceived: (event) => emailController.text = event.data,
    );
    listenEvent<EventBus, PersonalInformationEventSetPhoneNumber>(
      onEventReceived: (event) => phoneNumberController.text = event.data,
    );
  }

  void setFullName(String fullName) {
    sendEvent<EventBus>(PersonalInformationEventSetFullName(data: fullName));
  }

  void setEmail(String email) {
    sendEvent<EventBus>(PersonalInformationEventSetEmail(data: email));
  }

  void setPhoneNumber(String phoneNumber) {
    sendEvent<EventBus>(PersonalInformationEventSetPhoneNumber(data: phoneNumber));
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
