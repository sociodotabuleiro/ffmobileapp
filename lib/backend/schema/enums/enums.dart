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
  paid,
  deliveryRented,
  received,
  deliveryReturned,
  returned,
  timeAdded,
  cancelled,
  denied,
}

enum NotificationTypes {
  NEW_FOLLOWER,
  GAME_AVAILABLE,
  GAME_RENTED,
  PAYMENT_CREATED,
  PAYMENT_CONFIRMED,
  PAYMENT_CREDIT_CARD_CAPTURE_REFUSED,
  PAYMENT_REFUND_IN_PROGRESS,
  PAYMENT_REFUNDED,
  PAYMENT_REFUND_DENIED,
  PAYMENT_DELETED,
  PAYMENT_UPDATED,
  ORDER_PAID,
  ORDER_CANCELLED,
  ORDER_ACCEPTED_BY_OWNER,
  SEARCHING_DRIVER,
  DRIVER_UNAVAILABLE,
  DRIVER_GOING_OWNER,
  DRIVER_GOING_RENTER,
  ORDER_DELIVERED_OWNER,
  ORDER_DELIVERED_RENTER,
  PROMOTIONAL_OFFER,
  ANNOUNCEMENT,
  GENERAL,
}

enum Categories {
  alocacao_de_trabalhadores,
  apostas_e_blefes,
  carteados,
  construcao_de_baralho,
  controle_de_area,
  cooperativo,
  familia,
  gerenciamento_de_maos,
  gerenciamento_de_recursos,
  narracao_de_historias,
  negociacao_e_leilao,
  rolagem_de_dados,
  wargame,
}

enum FilterType {
  value,
  age,
  distance,
  time,
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
    case (Categories):
      return Categories.values.deserialize(value) as T?;
    case (FilterType):
      return FilterType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
