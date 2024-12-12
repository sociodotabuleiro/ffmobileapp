import 'package:logger/logger.dart';
import '../../../backend/backend.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../notifications/notification_util.dart';


final Logger _logger = Logger();

class RentsUtil {
  static Future<void> updateRentalsRecords({
    required RentalStatus status,
    required DocumentReference gameRef,
    required String gameName,
    required DocumentReference renterRef,
    required DocumentReference ownerRef,
    required double pricePerDay,
    required DateTime dueDate,
    required List<DocumentReference> selectedGames,
    List<DateTime>? selectedDates,
    double? deliveryFee,
  }) async {
    final rentalId = DateTime.now().millisecondsSinceEpoch.toString();
    final rentalDate = DateTime.now();

    // Create records for renter and owner
    await _createOrUpdateRentalsRecord(
      userRef: renterRef,
      rentalId: rentalId,
      rentalDate: rentalDate,
      dueDate: dueDate,
      pricePerDay: pricePerDay,
      status: status,
      currentStatusTime: rentalDate,
      isRenter: true,
      ownerID: ownerRef,
      games: selectedGames,
      deliveryFee: deliveryFee,
    );

    await _createOrUpdateRentalsRecord(
      userRef: ownerRef,
      rentalId: rentalId,
      rentalDate: rentalDate,
      dueDate: dueDate,
      pricePerDay: pricePerDay,
      status: status,
      currentStatusTime: rentalDate,
      isRenter: false,
      renterID: renterRef,
      games: selectedGames,
      deliveryFee: deliveryFee,
    );

    // Update available dates
    if (selectedDates != null) {
      await _updateAvailableDates(gameRef, selectedDates, ownerRef);
    }

    // Send notification
    await NotificationService.sendNotificationForRentalStatus(
      status: status,
      gameName: gameName,
      gameRef: gameRef,
      rentingUserRef: renterRef,
      ownerRef: ownerRef,
    );
  }

  static Future<void> _createOrUpdateRentalsRecord({
    required DocumentReference userRef,
    required String rentalId,
    required DateTime rentalDate,
    required DateTime dueDate,
    required double pricePerDay,
    required RentalStatus status,
    required DateTime currentStatusTime,
    required bool isRenter,
    DocumentReference? ownerID,
    DocumentReference? renterID,
    List<DocumentReference>? games,
    double? deliveryFee,
  }) async {
    final rentalData = {
      'rentalID': rentalId,
      'rentalDate': rentalDate,
      'dueDate': dueDate,
      'pricePerDay': pricePerDay,
      'status': status.toString(),
      'currentStatusTime': currentStatusTime,
      if (ownerID != null) 'ownerID': ownerID,
      if (renterID != null) 'renterID': renterID,
      if (games != null) 'games': games,
      if (deliveryFee != null) 'deliveryFee': deliveryFee,
    };

    final rentalRef = userRef.collection('rentals').doc(rentalId);
    await rentalRef.set(rentalData);
  }

  static Future<void> _updateAvailableDates(
    DocumentReference gameRef,
    List<DateTime> selectedDates,
    DocumentReference ownerRef,
  ) async {
    final myGamesDocRef = ownerRef.collection('mygames').doc(gameRef.id);
    final snapshot = await myGamesDocRef.get();

    if (!snapshot.exists) return;

    final currentAvailableDates =
        (snapshot.data()?['availableDates'] as List<dynamic>?) ?? [];

    final updatedDates = currentAvailableDates
        .where((date) => !selectedDates.contains(DateTime.parse(date)))
        .toList();

    await myGamesDocRef.update({'availableDates': updatedDates});
  }

  Future<void> updateUserReferences(
    RentalsRecord ownerRentalsRef,
    RentalsRecord renterRentalsRef,
    DocumentReference ownerRef,
    DocumentReference renterRef,
  ) async {
        logFirebaseEvent('update_user_references');

        // Update current user's (renter's) document
        await renterRef.update({
          'rentedFromCount': FieldValue.increment(1),
          'rentedFrom': FieldValue.arrayUnion([ownerRef]),
          'rentedFromIds': FieldValue.arrayUnion([ownerRentalsRef]),
        });

        // Update owner's document
        await ownerRef.update({
          'rentedToCount': FieldValue.increment(1),
          'rentedTo': FieldValue.arrayUnion([renterRef]),
          'rentedToIds': FieldValue.arrayUnion([renterRentalsRef]),
        });
      }

}
