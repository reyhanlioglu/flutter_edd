import 'package:example/common_events/event_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

class PersonalInformationEventSetFullName extends BaseDataEvent<String, dynamic, EventId> {
  PersonalInformationEventSetFullName({required super.data, super.id, super.preconditionedEventId});
}

class PersonalInformationEventSetEmail extends BaseDataEvent<String, dynamic, EventId> {
  PersonalInformationEventSetEmail({required super.data, super.id, super.preconditionedEventId});
}

class PersonalInformationEventSetPhoneNumber extends BaseDataEvent<String, dynamic, EventId> {
  PersonalInformationEventSetPhoneNumber({required super.data, super.id, super.preconditionedEventId});
}
