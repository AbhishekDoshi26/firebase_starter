part of auth;

enum SocialMediaMethod { google, facebook, apple }

abstract class AuthService {
  Stream<UserEntity?> get onAuthStateChanged;

  Future<UserEntity?> currentUser();

  Future<UserEntity?> signInAnonymously();

  Future<UserEntity?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void>? sendPasswordResetEmail({required String email});

  Future<UserEntity?> signInWithSocialMedia({
    required SocialMediaMethod method,
  });

  Future<void>? signOut();

  Future<bool>? changeProfile({
    String? firstName,
    String? lastName,
    String? photoURL,
  });

  Future<void>? deleteAccount();
}
