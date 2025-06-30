import 'package:get/get_connect/http/src/response/response.dart';

import '../repositories/task_repository_interface.dart';
import 'task_service_interface.dart';

class TaskService implements TaskServiceInterface {
  final TaskRepositoryInterface taskRepositoryInterface;

  TaskService({required this.taskRepositoryInterface});

  @override
  Future<Response> addTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
  ) async {
    return await taskRepositoryInterface.addTask(
      name,
      date,
      startTime,
      endTime,
      location,
      isFullDay,
    );
  }

  @override
  Future<Response> deleteTask(String id) async {
    return await taskRepositoryInterface.deleteTask(id);
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
  ) async {
    return await taskRepositoryInterface.editTask(
      name,
      date,
      startTime,
      endTime,
      location,
      isFullDay,
      id,
    );
  }

  @override
  Future<Response> getAllTasks() async {
    return await taskRepositoryInterface.getAllTasks();
  }

  @override
  Future<Response> getRequestById(String id) async {
    return await taskRepositoryInterface.getRequestById(id);
  }
}
