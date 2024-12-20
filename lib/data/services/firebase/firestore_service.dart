import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/user/user_dto.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/result.dart';

@singleton
class FireStoreServies {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<UserDto?> getUserFromFireStore() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final ref =
        db.collection(UserDto.usersCollection).doc(userId).withConverter(
              fromFirestore: UserDto.fromFirestore,
              toFirestore: (UserDto user, _) => user.toFirestore(),
            );
    final docSnap = await ref.get();
    return docSnap.data();
  }

  Future<void> saveUserToFireStore(UserDto user) async {
    final docRef = db
        .collection(UserDto.usersCollection)
        .withConverter(
          fromFirestore: UserDto.fromFirestore,
          toFirestore: (UserDto user, options) => user.toFirestore(),
        )
        .doc(user.id);
    await docRef.set(user);
  }

  Future<Result<String>> saveMovieToWishList(Movie movie) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      final docRef = db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.wishListCollection)
          .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, options) => movie.toFirestore(),
          )
          .doc('${movie.id}');
      await docRef.set(movie);
      await updateUserWishListCount(userId, 1);
      return Success(data: 'Added Successfully');
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<String>> removeMovieFromWishList(Movie movie) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      await db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.wishListCollection)
          .doc('${movie.id}')
          .delete();
      await updateUserWishListCount(userId, -1);
      return Success(data: 'Removed Successfully');
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<void> updateUserWishListCount(String userId, int updateValueBy) async {
    await db
        .collection(UserDto.usersCollection)
        .doc(userId)
        .update({'wishListCount': FieldValue.increment(updateValueBy)});
  }

  Future<void> updateUserHistoryCount(String userId, int updateValueBy) async {
    await db
        .collection(UserDto.usersCollection)
        .doc(userId)
        .update({'historyCount': FieldValue.increment(updateValueBy)});
  }

  Future<Result<bool>> isMovieInWishList(int movieId) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      final docRef = db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.wishListCollection)
          .doc('$movieId')
          .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, options) => movie.toFirestore(),
          );
      final docSnap = await docRef.get();
      bool isInWishList = movieId == docSnap.data()?.id;
      return Success(data: isInWishList);
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<List<Movie>>> getWishList() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      final ref = db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.wishListCollection)
          .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, _) => movie.toFirestore(),
          );
      QuerySnapshot<Movie> docSnap = await ref.get();
      List<QueryDocumentSnapshot<Movie>> docs = docSnap.docs;
      List<Movie> movies = docs
          .map(
            (movie) => movie.data(),
          )
          .toList();
      return Success(data: movies);
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<bool> isMovieInHistory(int movieId) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    final docRef = db
        .collection(UserDto.usersCollection)
        .doc(userId)
        .collection(Movie.historyCollection)
        .doc('$movieId')
        .withConverter(
          fromFirestore: Movie.fromFirestore,
          toFirestore: (Movie movie, options) => movie.toFirestore(),
        );
    final docSnap = await docRef.get();
    bool isInHistory = movieId == docSnap.data()?.id;
    return isInHistory;
  }

  Future<Result<String>> saveMovieToHistory(Movie movie) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      final docRef = db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.historyCollection)
          .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, options) => movie.toFirestore(),
          )
          .doc('${movie.id}');
      bool isInHistory = await isMovieInHistory(movie.id!);
      if (!isInHistory) {
        await docRef.set(movie);
        await updateUserHistoryCount(userId, 1);
      }
      return Success(data: 'Added Successfully');
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<String>> removeMovieFromHistory(Movie movie) async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      await db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.historyCollection)
          .doc('${movie.id}')
          .delete();
      await updateUserHistoryCount(userId, -1);
      return Success(data: 'Removed Successfully');
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  Future<Result<List<Movie>>> getHistory() async {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    try {
      final ref = db
          .collection(UserDto.usersCollection)
          .doc(userId)
          .collection(Movie.historyCollection)
          .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, _) => movie.toFirestore(),
          );
      QuerySnapshot<Movie> docSnap = await ref.get();
      List<QueryDocumentSnapshot<Movie>> docs = docSnap.docs;
      List<Movie> movies = docs
          .map(
            (movie) => movie.data(),
          )
          .toList();
      return Success(data: movies);
    } on FirebaseException catch (exception) {
      return ServerError(statusMessage: exception.message);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }
}
