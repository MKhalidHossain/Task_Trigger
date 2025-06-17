abstract class ProfileServiceInterface {
  Future<dynamic> changeAvatar(
    String image,
  );
  Future<dynamic> deleteAvatar(
  );
  Future<dynamic> getUserById();
}
