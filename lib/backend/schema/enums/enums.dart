import 'package:collection/collection.dart';

enum Gender {
  male,
  female,
  other,
}

enum AuthMethods {
  email,
  google,
  discord,
  ludopedia,
}

enum RentalStatus {
  initiated,
  rented,
  deliveryRented,
  received,
  deliveryReturned,
  returned,
  timeAdded,
  cancelled,
}

enum NotificationTypes {
  NEW_FOLLOWER,
  GAME_AVAILABLE,
  GAME_RENTED,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (AuthMethods):
      return AuthMethods.values.deserialize(value) as T?;
    case (RentalStatus):
      return RentalStatus.values.deserialize(value) as T?;
    case (NotificationTypes):
      return NotificationTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
