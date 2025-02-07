abstract class AuthInterface {
  Future<void> googleSignIn();
  Future<void> googleSignOut();
  Future<void> setPrimaryEmail();
  Future<void> getPrimaryEmail();
  // Future<List<Email>> getAllEmails();
}