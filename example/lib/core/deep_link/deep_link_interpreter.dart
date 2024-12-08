import 'package:example/core/deep_link/deep_link_event_type.dart';
import 'package:example/core/deep_link/usecases/process_hotel_suggestion_deep_link_event_use_case.dart';
import 'package:jwt_decode/jwt_decode.dart';

class DeepLinkInterpreter {
  void interpretFromJwt(String jwtData) {
    final data = Jwt.parseJwt(jwtData);

    final eventType = DeepLinkEventType.fromString(data['eventType']);

    switch(eventType) {
      case DeepLinkEventType.hotelSuggestion:
        ProcessHotelSuggestionDeepLinkEventUseCase().call(data);
        break;
    }
  }
}