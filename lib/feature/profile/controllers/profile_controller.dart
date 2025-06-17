import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iwalker/feature/profile/services/profile_service_interface.dart';
import '../../../helpers/remote/data/api_client.dart';
import '../domain/model/change_avatar_response_model.dart';
import '../domain/model/delete_avatar_response_model.dart';
import '../domain/model/get_user_by_id_response_model.dart';

class ProfileController extends GetxController implements GetxService {
  // final CommandersService commandersService;
  final ProfileServiceInterface profileServiceInterface;

  late DeleteAvatarResponseModel deleteAvatarResponseModel;

  late ChangeAvatarResponseModel changeAvatarResponseModel;

  late GetUserByIdResponseModel getUserByIdResponseModel;

  // late GetAllServicesResponseModel getAllServicesResponseModel;
  // late GetAllUnitResponseModel getAllUnitResponseModel;
  // late AddANewCommanderResponseModel addANewCommanderResponseModel;

  bool isLoading = false;

  get commandersList => null;

  XFile? _pickedProfileFile;
  XFile? _pickedProfileFile1;

  XFile? get pickedProfileFile => _pickedProfileFile;
  XFile? get pickedProfileFile1 => _pickedProfileFile1;

  XFile identityImage = XFile('');

  List<XFile> identityImages = [];

  List<MultipartBody> multipartList = [];

  ProfileController({required this.profileServiceInterface});

  void clearPickedImage() {
    _pickedProfileFile = null;
    update();
  }

  void pickImage(bool isBack, bool isProfile) async {
    if (isProfile) {
      _pickedProfileFile =
          (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    } else {
      identityImage =
          (await ImagePicker().pickImage(source: ImageSource.gallery))!;
      identityImages.add(identityImage);
      multipartList.add(MultipartBody('identity_images[]', identityImage));
    }
    update();
  }

  Future<void> changeAvatar(String image) async {
    try {
      isLoading = true;
      print("Changeing the Avatar of the user\n\n\n");

      var response = await profileServiceInterface.changeAvatar(image);
      if (response.statusCode == 200) {
        print('Avater is  changed successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        changeAvatarResponseModel = ChangeAvatarResponseModel.fromJson(
          response.body,
        );
        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> deleteAvatar() async {
    try {
      isLoading = true;
      print("Deleting the Avatar of the user\n\n\n");

      var response = await profileServiceInterface.deleteAvatar();

      if (response.statusCode == 200) {
        print('Avatar are Deleted successfully.');

        print("HTTP Status: ${response.statusCode}");

        print("Raw Response: ${response.body}");

        deleteAvatarResponseModel = DeleteAvatarResponseModel.fromJson(
          response.body,
        );

        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getUserById() async {
    try {
      isLoading = true;
      print("Getting all User Info");

      var response = await profileServiceInterface.getUserById();

      if (response.statusCode == 200) {
        print('User Info are fetched successfully.');

        print("HTTP Status: ${response.statusCode}");

        print("Raw Response: ${response.body}");

        getUserByIdResponseModel = GetUserByIdResponseModel.fromJson(
          response.body,
        );

        print(getUserByIdResponseModel.user!.email);
        print('Call from Controller after model calls.');
      } else {
        // Get.find<AuthController>().logOut();
        // print(response.statusCode.toString());
        // throw Exception('Failed to load Users All Imported Route List');
      }
    } catch (e) {
      if (e is Exception) {
        // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
      } else {
        print(e);
      }
    }
    isLoading = false;
    update();
  }

  // Future<void> createCommander(
  //   String name,
  //   String yearOfExperience,
  //   String serviceBroad,
  //   String unit,
  //   String base,
  //   String rank,
  // ) async {
  //   try {
  //     isLoading = true;
  //     print("Getting all commanders\n\n\n");

  //     var response = await commandersServiceInterface.createCommander(
  //       name,
  //       yearOfExperience,
  //       serviceBroad,
  //       unit,
  //       base,
  //       rank,
  //       _pickedProfileFile,
  //     );
  //     if (response.statusCode == 201) {
  //       print('All Commanders are fetched successfully.');
  //       print("HTTP Status: ${response.statusCode}");
  //       print("Raw Response: ${response.body}");

  //       addANewCommanderResponseModel = AddANewCommanderResponseModel.fromJson(
  //         response.body,
  //       );
  //       print('Call from Controller after model calls.');
  //     } else {
  //       // Get.find<AuthController>().logOut();
  //       // print(response.statusCode.toString());
  //       // throw Exception('Failed to load Users All Imported Route List');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }

  // Future<void> reportABug(
  //   String projectName,
  //   String screenName,
  //   String messages,
  // ) async {
  //   isLoading = true;
  //   // var response = await settingsServiceInterface.reportABug(projectName, screenName, messages, pickedProfileFile1);
  //   //
  //   // if (response.statusCode == 200) {
  //   //   showCustomSnackBar('Your bug report successfully sent!!!');
  //   //   print('Your bug report successfully sent!!!');
  //   // }
  //   // else {
  //   //   // Get.find<AuthController>().logOut();
  //   // }
  //   isLoading = false;
  //   update();
  // }

  // Future<void> getACommander(String _id) async {
  //   try {
  //     isLoading = true;
  //     print("Getting a commander");

  //     var response = await commandersServiceInterface.getSpecificCommander(_id);
  //     if (response.statusCode == 200) {
  //       print('All Commanders are fetched successfully.');
  //       print("HTTP Status: ${response.statusCode}");
  //       print("Raw Response: ${response.body}");

  //       commander = SingleCommandersResponseModel.fromJson(response.body);
  //       print('Call from Controller after model calls.');
  //     } else {
  //       // Get.find<AuthController>().logOut();
  //       // print(response.statusCode.toString());
  //       // throw Exception('Failed to load Users All Imported Route List');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }

  // Future<void> getAllServices() async {
  //   try {
  //     isLoading = true;
  //     print("Getting all Services");

  //     var response = await commandersServiceInterface.getCommandersAllService();

  //     if (response.statusCode == 200) {
  //       print('All Services are fetched successfully.');

  //       print("HTTP Status: ${response.statusCode}");

  //       print("Raw Response: ${response.body}");

  //       getAllServicesResponseModel = GetAllServicesResponseModel.fromJson(
  //         response.body,
  //       );

  //       print('Call from Controller after model calls.');
  //     } else {
  //       // Get.find<AuthController>().logOut();
  //       // print(response.statusCode.toString());
  //       // throw Exception('Failed to load Users All Imported Route List');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }

  // Future<void> getAllUnits() async {
  //   try {
  //     isLoading = true;
  //     print("Getting all Units");

  //     var response = await commandersServiceInterface.getCommandersAllUnit();

  //     if (response.statusCode == 200) {
  //       print('All Units are fetched successfully.');

  //       print("HTTP Status: ${response.statusCode}");

  //       print("Raw Response: ${response.body}");

  //       getAllUnitResponseModel = GetAllUnitResponseModel.fromJson(
  //         response.body,
  //       );

  //       print('Call from Units after model calls.');
  //     } else {
  //       // Get.find<AuthController>().logOut();
  //       // print(response.statusCode.toString());
  //       // throw Exception('Failed to load Users All Imported Route List');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       // print('⚠️ Exception in getAllCommanders: $e dddddddddddd');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }

  // Future<void> getAllUnits() async{
  //   try {
  //     isLoading = true;
  //     update();
  //     print("Getting all Units\n\n\n");
  //     var response = await commandersServiceInterface.getCommandersAllUnit();
  //     print("HTTP Status: ${response.statusCode}");
  //     print("Raw Response: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       print('All Commanders Units are fetched successfully.');
  //     } else {
  //       getAllUnitResponseModel = GetAllUnitResponseModel.fromJson(
  //         json.decode(response["body"]),
  //       );
  //       Get.find<AuthController>().logOut();
  //       //print(response.statusCode.toString());
  //       throw Exception('Failed to load All Commanders Units');
  //     }
  //   } catch (e) {
  //     if (e is Exception) {
  //       print('⚠️ Exception in Commanders Units: $e');
  //     } else {
  //       print(e);
  //     }
  //   }
  //   isLoading = false;
  //   update();
  // }
}
