abstract class IAuthService<T extends IBaseModel<T>> {
  Future<T> registerWithEmailAndPassword(
      {required String email, required String password});
  Future<T> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Stream<T?> get currentUser;
}

abstract class IBaseModel<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
