import 'package:get/get_connect/http/src/response/response.dart';

abstract class TaskServiceInterface {
  Future<Response> addTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
  );
  Future<Response> getAllTasks();
  Future<Response> getRequestById(String id);
  Future<Response> editTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
    String id,
  );
  Future<Response> deleteTask(String id);
}
