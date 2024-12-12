import 'package:logger/logger.dart';
import '../../../backend/backend.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../notifications/notification_util.dart';


final Logger _logger = Logger();

class RentsUtil {

  static Future<void> createRentalsRecord({
    required String rentalId,
    required DateTime rentalDate,
    required DateTime dueDate,
    required double pricePerDay,
    required RentalStatus status,
    required DateTime currentStatusTime,
    required bool isRenter,
    required QuotationsStruct quotation,
    required DocumentReference ownerID,
    required DocumentReference renterID,
    required List<DocumentReference> games,
    required double deliveryFee,
  }) async {
        await _createRentalRecord(
          rentalId: rentalId,
          rentalDate: rentalDate,
          dueDate: dueDate,
          pricePerDay: pricePerDay,
          status: status,
          currentStatusTime: currentStatusTime,
          isRenter: isRenter,
          ownerID: ownerID,
          renterID: renterID,
          games: games,
          deliveryFee: deliveryFee,
          quotation: quotation,
        );
  }

  static Future<void> jjupdateRentalsRecords({
     RentalStatus? status,
     DocumentReference? gameRef,
     String? gameName,
     DocumentReference? renterRef,
     DocumentReference? ownerRef,
     double? pricePerDay,
     DateTime? dueDate,
     List<DocumentReference>? selectedGames,
     List<DateTime>? selectedDates,
     double? deliveryFee,
     required DocumentReference rentalRef,
  }) async {

      final statusDate = DateTime.now();

      // Create records for renter and owner
      await _updateRentalRecord(
        rentalRef: rentalRef,
        dueDate: dueDate,
        pricePerDay: pricePerDay,
        status: status,
        currentStatusTime: statusDate,
        isRenter: true,
        ownerID: ownerRef,
        games: selectedGames,
        deliveryFee: deliveryFee,
      );

      await _updateRentalRecord(
        rentalRef: rentalRef,
        dueDate: dueDate,
        pricePerDay: pricePerDay,
        status: status,
        currentStatusTime: statusDate,
        isRenter: false,
        renterID: renterRef,
        games: selectedGames,
        deliveryFee: deliveryFee,
      );

      // Update available dates
      if (selectedDates != null && gameRef != null && ownerRef != null) {
        await _updateAvailableDates(gameRef, selectedDates, ownerRef);
      }

      if (status != null) {
      final rentingRecord = await rentalRef.get();
      final rentingData = rentingRecord.data()! as Map<String, dynamic>;
      gameRef ??= rentingData['games'][0]! as DocumentReference;
      gameName ??= rentingData['games'][0]! as String;
      renterRef ??= rentingData['renterID']! as DocumentReference;
      ownerRef ??= rentingData['ownerID']! as DocumentReference;
      await NotificationService.sendNotificationForRentalStatus(
        status: status,
        gameName: gameName,
        gameRef: gameRef,
        rentingUserRef: renterRef,
        ownerRef: ownerRef,
      );
    }
  }

  // static Future<void> _createOrUpdateRentalsRecord({
  //   required DocumentReference userRef,
  //   required String rentalId,
  //   required DateTime rentalDate,
  //   required DateTime dueDate,
  //   required double pricePerDay,
  //   required RentalStatus status,
  //   required DateTime currentStatusTime,
  //   required bool isRenter,
  //   QuotationsStruct? quotation,
  //   DocumentReference? ownerID,
  //   DocumentReference? renterID,
  //   List<DocumentReference>? games,
  //   double? deliveryFee,
  // }) async {
  //   final rentalData = {
  //     'rentalID': rentalId,
  //     'rentalDate': rentalDate,
  //     'dueDate': dueDate,
  //     'pricePerDay': pricePerDay,
  //     'status': status.toString(),
  //     'currentStatusTime': currentStatusTime,
  //     if (ownerID != null) 'ownerID': ownerID,
  //     if (renterID != null) 'renterID': renterID,
  //     if (games != null) 'games': games,
  //     if (deliveryFee != null) 'deliveryFee': deliveryFee,
  //     if (quotation != null) 'quotationId': quotation.quotationsData.quotationId,
  //   };

  //   final rentalRef = userRef.collection('rentals').doc(rentalId);
  //   await rentalRef.set(rentalData);
  // }

  // Function for creating a new rental record
  static Future<void> _createRentalRecord({
    required String rentalId,
    required DateTime rentalDate,
    required DateTime dueDate,
    required double pricePerDay,
    required RentalStatus status,
    required DateTime currentStatusTime,
    required bool isRenter,
    required QuotationsStruct quotation,
    required DocumentReference ownerID,
    required DocumentReference renterID,
    required List<DocumentReference>? games,
    required double? deliveryFee,
  }) async {
    final rentalData = {
      'rentalID': rentalId,
      'rentalDate': rentalDate,
      'dueDate': dueDate,
      'pricePerDay': pricePerDay,
      'status': status.toString(),
      'currentStatusTime': currentStatusTime,
      'ownerID': ownerID,
      'renterID': renterID,
      'games': games,
      'deliveryFee': deliveryFee,
      'quotationId': quotation.quotationsData.quotationId,
    };

    final rentalOwnerRef = ownerID.collection('rentals').doc(rentalId);
    final rentalRenterRef = renterID.collection('rentals').doc(rentalId);

    await rentalOwnerRef.set(rentalData);
    await rentalRenterRef.set(rentalData);

   

    final firestoreData = createUsersRentalRecordData(renterId: renterID , ownerId: ownerID, ownerRentalsId: rentalOwnerRef, renterRentalsId: rentalRenterRef);
    var collection = FirebaseFirestore.instance.collection('usersRental');
    await collection.doc(rentalId).set(
      firestoreData,
    );
    
  }

    // Function for updating an existing rental record
  static Future<void> _updateRentalRecord({
    required DocumentReference rentalRef,
    DateTime? dueDate,
    double? pricePerDay,
    RentalStatus? status,
    DateTime? currentStatusTime,
    bool? isRenter,
    DocumentReference? ownerID,
    DocumentReference? renterID,
    List<DocumentReference>? games,
    double? deliveryFee,
    QuotationsStruct? quotation,
  }) async {
    final updates = <String, dynamic>{};

    if (dueDate != null) updates['dueDate'] = dueDate;
    if (pricePerDay != null) updates['pricePerDay'] = pricePerDay;
    if (status != null) updates['status'] = status.toString();
    if (currentStatusTime != null) updates['currentStatusTime'] = currentStatusTime;
    if (ownerID != null) updates['ownerID'] = ownerID;
    if (renterID != null) updates['renterID'] = renterID;
    if (games != null) updates['games'] = games;
    if (deliveryFee != null) updates['deliveryFee'] = deliveryFee;
    if (quotation != null) updates['quotationId'] = quotation.quotationsData.quotationId;

    if (updates.isEmpty) {
      throw ArgumentError('No fields to update were provided.');
    }
    
    final rentalObject = await rentalRef.get();
    final rentalData = rentalObject.data()! as Map<String, dynamic>;
    final ownerIdRef = rentalData['ownerID']; 
    final renterIdRef = rentalData['renterID'];

    await ownerIdRef.collection('rentals').doc(rentalRef.id).update(updates);
    await renterIdRef.collection('rentals').doc(rentalRef.id).update(updates);

    //await rentalRef.update(updates);
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
