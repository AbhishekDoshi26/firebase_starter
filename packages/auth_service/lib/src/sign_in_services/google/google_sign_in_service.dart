part of auth;

class GoogleSignInService implements ISignInService {
  GoogleSignInService({required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;

  Future<GoogleSignInAccount?> _getGoogleUser() async {
    final result = await _googleSignIn.signIn();
    return result;
  }

  Future<GoogleSignInAuthentication?> _getGoogleAuth(
    GoogleSignInAccount? googleUser,
  ) async {
    if (googleUser != null) {
      final result = await googleUser.authentication;
      return result;
    }

    return null;
  }

  auth.OAuthCredential _getUserCredentials(
      String? accessToken, String? idToken) {
    if (accessToken != null || idToken != null) {
      final credential = auth.GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );
      return credential;
    } else {
      throw auth.FirebaseAuthException(
        code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
        message: 'Missing Google Auth Token',
      );
    }
  }

  @override
  Future<auth.OAuthCredential?> getFirebaseCredential() async {
    try {
      final googleUser = await _getGoogleUser();

      final googleAuth = await _getGoogleAuth(googleUser);

      if (googleAuth != null) {
        return _getUserCredentials(googleAuth.accessToken, googleAuth.idToken);
      }

      return null;
    } on Exception {
      throw auth.FirebaseAuthException(code: 'ERROR_GOOGLE_LOGIN');
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
