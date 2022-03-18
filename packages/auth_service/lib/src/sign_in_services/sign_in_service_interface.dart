part of auth;

abstract class ISignInService {
  Future<auth.OAuthCredential?> getFirebaseCredential();

  Future<void>? signOut();
}
