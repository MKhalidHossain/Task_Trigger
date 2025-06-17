// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:image_picker/image_picker.dart';

abstract class ProfileRepositoryInterface {
  Future<dynamic> changeAvatar(
    String image, 
  );
  Future<dynamic> deleteAvatar(

  );
  Future<dynamic> getUserById();
}
