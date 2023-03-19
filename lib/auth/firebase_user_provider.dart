import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CarcutterFirebaseUser {
  CarcutterFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CarcutterFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CarcutterFirebaseUser> carcutterFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CarcutterFirebaseUser>(
      (user) {
        currentUser = CarcutterFirebaseUser(user);
        return currentUser!;
      },
    );
