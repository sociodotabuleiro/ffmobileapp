import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/games_record.dart';
import 'schema/achievements_record.dart';
import 'schema/cart_record.dart';
import 'schema/my_games_record.dart';
import 'schema/rentals_record.dart';
import 'schema/users_rental_record.dart';
import 'schema/featured_games_record.dart';
import 'schema/contact_messages_record.dart';
import 'schema/users_contact_responses_record.dart';
import 'schema/params_record.dart';
import 'schema/notifications_record.dart';
import 'schema/users_favorited_ref_record.dart';
import 'schema/users_wishlisted_ref_record.dart';
import 'schema/users_rented_ref_record.dart';
import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/games_record.dart';
export 'schema/achievements_record.dart';
export 'schema/cart_record.dart';
export 'schema/my_games_record.dart';
export 'schema/rentals_record.dart';
export 'schema/users_rental_record.dart';
export 'schema/featured_games_record.dart';
export 'schema/contact_messages_record.dart';
export 'schema/users_contact_responses_record.dart';
export 'schema/params_record.dart';
export 'schema/notifications_record.dart';
export 'schema/users_favorited_ref_record.dart';
export 'schema/users_wishlisted_ref_record.dart';
export 'schema/users_rented_ref_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UsersRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query GamesRecords (as a Stream and as a Future).
Future<int> queryGamesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GamesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GamesRecord>> queryGamesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GamesRecord.collection,
      GamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GamesRecord>> queryGamesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GamesRecord.collection,
      GamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GamesRecord>> queryGamesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GamesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      GamesRecord.collection,
      GamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<GamesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query AchievementsRecords (as a Stream and as a Future).
Future<int> queryAchievementsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AchievementsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AchievementsRecord>> queryAchievementsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AchievementsRecord.collection,
      AchievementsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AchievementsRecord>> queryAchievementsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AchievementsRecord.collection,
      AchievementsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<AchievementsRecord>> queryAchievementsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, AchievementsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      AchievementsRecord.collection,
      AchievementsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<AchievementsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query CartRecords (as a Stream and as a Future).
Future<int> queryCartRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CartRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CartRecord>> queryCartRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CartRecord.collection(parent),
      CartRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CartRecord>> queryCartRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CartRecord.collection(parent),
      CartRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<CartRecord>> queryCartRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, CartRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      CartRecord.collection(parent),
      CartRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<CartRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query MyGamesRecords (as a Stream and as a Future).
Future<int> queryMyGamesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MyGamesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MyGamesRecord>> queryMyGamesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MyGamesRecord.collection(parent),
      MyGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MyGamesRecord>> queryMyGamesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MyGamesRecord.collection(parent),
      MyGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<MyGamesRecord>> queryMyGamesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, MyGamesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      MyGamesRecord.collection(parent),
      MyGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<MyGamesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query RentalsRecords (as a Stream and as a Future).
Future<int> queryRentalsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RentalsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RentalsRecord>> queryRentalsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RentalsRecord.collection(parent),
      RentalsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RentalsRecord>> queryRentalsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RentalsRecord.collection(parent),
      RentalsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<RentalsRecord>> queryRentalsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, RentalsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      RentalsRecord.collection(parent),
      RentalsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<RentalsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UsersRentalRecords (as a Stream and as a Future).
Future<int> queryUsersRentalRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRentalRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRentalRecord>> queryUsersRentalRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRentalRecord.collection,
      UsersRentalRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRentalRecord>> queryUsersRentalRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRentalRecord.collection,
      UsersRentalRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersRentalRecord>> queryUsersRentalRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersRentalRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UsersRentalRecord.collection,
      UsersRentalRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UsersRentalRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query FeaturedGamesRecords (as a Stream and as a Future).
Future<int> queryFeaturedGamesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FeaturedGamesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FeaturedGamesRecord>> queryFeaturedGamesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FeaturedGamesRecord.collection,
      FeaturedGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FeaturedGamesRecord>> queryFeaturedGamesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FeaturedGamesRecord.collection,
      FeaturedGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<FeaturedGamesRecord>> queryFeaturedGamesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, FeaturedGamesRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      FeaturedGamesRecord.collection,
      FeaturedGamesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<FeaturedGamesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query ContactMessagesRecords (as a Stream and as a Future).
Future<int> queryContactMessagesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ContactMessagesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ContactMessagesRecord>> queryContactMessagesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ContactMessagesRecord.collection,
      ContactMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ContactMessagesRecord>> queryContactMessagesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ContactMessagesRecord.collection,
      ContactMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ContactMessagesRecord>> queryContactMessagesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ContactMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ContactMessagesRecord.collection,
      ContactMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ContactMessagesRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UsersContactResponsesRecords (as a Stream and as a Future).
Future<int> queryUsersContactResponsesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersContactResponsesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersContactResponsesRecord>> queryUsersContactResponsesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersContactResponsesRecord.collection(parent),
      UsersContactResponsesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersContactResponsesRecord>> queryUsersContactResponsesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersContactResponsesRecord.collection(parent),
      UsersContactResponsesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersContactResponsesRecord>>
    queryUsersContactResponsesRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersContactResponsesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          UsersContactResponsesRecord.collection(parent),
          UsersContactResponsesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<UsersContactResponsesRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query ParamsRecords (as a Stream and as a Future).
Future<int> queryParamsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ParamsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ParamsRecord>> queryParamsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ParamsRecord.collection,
      ParamsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ParamsRecord>> queryParamsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ParamsRecord.collection,
      ParamsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<ParamsRecord>> queryParamsRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, ParamsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      ParamsRecord.collection,
      ParamsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<ParamsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query NotificationsRecords (as a Stream and as a Future).
Future<int> queryNotificationsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotificationsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotificationsRecord>> queryNotificationsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotificationsRecord>> queryNotificationsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<NotificationsRecord>> queryNotificationsRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, NotificationsRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      NotificationsRecord.collection(parent),
      NotificationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<NotificationsRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query UsersFavoritedRefRecords (as a Stream and as a Future).
Future<int> queryUsersFavoritedRefRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersFavoritedRefRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersFavoritedRefRecord>> queryUsersFavoritedRefRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersFavoritedRefRecord.collection(parent),
      UsersFavoritedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersFavoritedRefRecord>> queryUsersFavoritedRefRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersFavoritedRefRecord.collection(parent),
      UsersFavoritedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersFavoritedRefRecord>>
    queryUsersFavoritedRefRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersFavoritedRefRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          UsersFavoritedRefRecord.collection(parent),
          UsersFavoritedRefRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<UsersFavoritedRefRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query UsersWishlistedRefRecords (as a Stream and as a Future).
Future<int> queryUsersWishlistedRefRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersWishlistedRefRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersWishlistedRefRecord>> queryUsersWishlistedRefRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersWishlistedRefRecord.collection(parent),
      UsersWishlistedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersWishlistedRefRecord>> queryUsersWishlistedRefRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersWishlistedRefRecord.collection(parent),
      UsersWishlistedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersWishlistedRefRecord>>
    queryUsersWishlistedRefRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersWishlistedRefRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          UsersWishlistedRefRecord.collection(parent),
          UsersWishlistedRefRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<UsersWishlistedRefRecord> data) {
              data.forEach((item) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query UsersRentedRefRecords (as a Stream and as a Future).
Future<int> queryUsersRentedRefRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRentedRefRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRentedRefRecord>> queryUsersRentedRefRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRentedRefRecord.collection(parent),
      UsersRentedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRentedRefRecord>> queryUsersRentedRefRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRentedRefRecord.collection(parent),
      UsersRentedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<UsersRentedRefRecord>> queryUsersRentedRefRecordPage({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, UsersRentedRefRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      UsersRentedRefRecord.collection(parent),
      UsersRentedRefRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<UsersRentedRefRecord> data) {
          data.forEach((item) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          });
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
