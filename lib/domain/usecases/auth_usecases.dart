abstract class AuthUsecases {
  Future<void> signIn({required String email, required String password});
}

class AuthUsecasesImpl implements AuthUsecases {
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      return;
    } catch (e) {
      rethrow;
    }
  }
}
