import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iwalker/feature/task/domain/model/add_task_response_model.dart';
import 'package:iwalker/feature/task/domain/model/edit_task_response_model.dart';
import 'package:iwalker/feature/task/domain/model/get_all_tasks_response_model.dart';
import 'package:iwalker/feature/task/services/task_service_interface.dart';
import '../../../helpers/remote/data/api_client.dart';

class TaskController extends GetxController implements GetxService {
  // final CommandersService commandersService;
  final TaskServiceInterface taskServiceInterface;
  TaskController({required this.taskServiceInterface});

  late AddTaskResponseModel addTaskResponseModel;

  late EditTaskResponseModel editTaskResponseModel;

  // late SingleCommandersResponseModel commander;

  // late GetAllServicesResponseModel getAllServicesResponseModel;
  // late GetAllUnitResponseModel getAllUnitResponseModel;
  // late AddANewCommanderResponseModel addANewCommanderResponseModel;

  late GetAllTasksResponseModel getAllTasksResponseModel;

  bool isloading = false;

  bool getAllTasksIsLoading = false;

  bool addTaskIsLoading = false;

  get commandersList => null;

  XFile? _pickedProfileFile;
  XFile? _pickedProfileFile1;

  XFile? get pickedProfileFile => _pickedProfileFile;
  XFile? get pickedProfileFile1 => _pickedProfileFile1;

  XFile identityImage = XFile('');

  List<XFile> identityImages = [];

  List<MultipartBody> multipartList = [];

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

  Future<void> addTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
  ) async {
    try {
      addTaskIsLoading = true;
      print("Getting all commanders\n\n\n");

      var response = await taskServiceInterface.addTask(
        name,
        date,
        startTime,
        endTime,
        location,
        isFullDay,
      );
      if (response.statusCode == 200) {
        print('All Commanders are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        addTaskResponseModel = AddTaskResponseModel.fromJson(response.body);
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
    addTaskIsLoading = false;
    update();
  }

  Future<void> editTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
    String id,
  ) async {
    try {
      addTaskIsLoading = true;
      print("Getting all commanders\n\n\n");

      var response = await taskServiceInterface.editTask(
        name,
        date,
        startTime,
        endTime,
        location,
        isFullDay,
        id,
      );
      if (response.statusCode == 200) {
        print('All Commanders are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        editTaskResponseModel = EditTaskResponseModel.fromJson(response.body);
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
    addTaskIsLoading = false;
    update();
  }

  Future<void> getAllTasks() async {
    try {
      getAllTasksIsLoading = true;
      print("Getting all Task");

      var response = await taskServiceInterface.getAllTasks();

      if (response.statusCode == 200) {
        print('All Task are fetched successfully.');
        print("HTTP Status: ${response.statusCode}");
        print("Raw Response: ${response.body}");

        getAllTasksResponseModel = GetAllTasksResponseModel.fromJson(
          response.body,
        );

        print('Call from Task after model calls.');
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
    getAllTasksIsLoading = false;
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
