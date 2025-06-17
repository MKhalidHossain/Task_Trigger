import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/urls.dart';
import '../../../helpers/remote/data/api_client.dart';
import 'task_repository_interface.dart';

class TaskRepository implements TaskRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  TaskRepository({required this.apiClient, required this.sharedPreferences});
  
  @override
  Future addTask(
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
  Future deleteTask(String id) {
    return apiClient.deleteData(Urls.deleteTask + id);
  }

  @override
  Future editTask(
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
  Future getAllTasks() {
    return apiClient.getData(Urls.getAllTasks);
  }

  @override
  Future getRequestById(String id) {
    return apiClient.getData(Urls.getRequestById + id);
  }
}