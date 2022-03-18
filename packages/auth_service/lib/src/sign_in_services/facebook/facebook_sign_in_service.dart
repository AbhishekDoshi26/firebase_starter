part of auth;

class FacebookSignInService implements ISignInService {
  FacebookSignInService({
    required FacebookAuth facebookAuth,
  }) : _facebookAuth = facebookAuth;

  final FacebookAuth _facebookAuth;

  Future<LoginResult?> _facebookSignIn() async {
    final res = await _facebookAuth.login(
      loginBehavior: LoginBehavior.nativeWithFallback,
    );

    return res;
  }

  auth.OAuthCredential? _createCredential(String? facebookToken) {
    return auth.FacebookAuthProvider.credential(facebookToken!);
  }

  @override
  Future<auth.OAuthCredential?> getFirebaseCredential() async {
    try {
      final result = await _facebookSignIn();

      if (result!.status == LoginStatus.success) {
        return _createCredential(result.accessToken!.token);
      }

      if (result.status == LoginStatus.cancelled) return null;

      throw auth.FirebaseAuthException(
        code: 'ERROR_FACEBOOK_LOGIN_FAILED',
        message: result.message,
      );
    } on Exception {
      throw auth.FirebaseAuthException(code: 'ERROR_FACEBOOK_LOGIN_FAILED');
    }
  }

  @override
  Future<void>? signOut() async {
    await _facebookAuth.logOut();
  }
}
