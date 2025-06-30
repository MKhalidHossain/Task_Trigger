import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/urls.dart';
import '../../../helpers/remote/data/api_client.dart';
import 'task_repository_interface.dart';

class TaskRepository implements TaskRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TaskRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<Response> addTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
  ) {
    return apiClient.postData(Urls.addTask, {
      "name": name,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "location": location,
      "isFullDay": isFullDay,
    });
  }

  @override
  Future<Response> deleteTask(String id) {
    return apiClient.deleteData(Urls.deleteTask + id);
  }

  @override
  Future<Response> editTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
    String id,
  ) {
    return apiClient.putData(Urls.editTask + id, {
      "name": name,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
      "location": location,
      "isFullDay": isFullDay,
    });
  }

  @override
  Future<Response> getAllTasks() async {
    return await apiClient.getData(Urls.getAllTasks);
  }

  @override
  Future<Response> getRequestById(String id) {
    return apiClient.getData(Urls.getRequestById + id);
  }
}
