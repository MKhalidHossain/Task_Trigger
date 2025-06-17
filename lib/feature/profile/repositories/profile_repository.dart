// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/urls.dart';
import '../../../helpers/remote/data/api_client.dart';
import 'profile_repository_interface.dart';

class ProfileRepository implements ProfileRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProfileRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future changeAvatar(String image) async {
    return await apiClient.postData(Urls.changeAvatar, {"image": image});
  }

  @override
  Future deleteAvatar() async {
    return await apiClient.deleteData(Urls.deleteAvatar);
  }

  @override
  Future getUserById() async {
    return await apiClient.getData(Urls.getUserById);
  }
}
