abstract class BaseEvent<OwnerId, EventId> {
  final EventId? id;
  final OwnerId? senderId;
  final OwnerId? receiverId;
  final EventId? preconditionedEventId;
  bool _preconditionsMet = false;

  BaseEvent({this.id, this.senderId, this.receiverId, this.preconditionedEventId});

  void setPreconditionsMet(bool value) {
    _preconditionsMet = value;
  }

  bool get isPreconditionsMet => _preconditionsMet;
}

abstract class BaseDataEvent<Data, OwnerId, EventId> extends BaseEvent<OwnerId, EventId> {
  final Data data;

  BaseDataEvent({required this.data, super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}
