abstract class TaskServiceInterface {
  Future<dynamic> addTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
  );
  Future<dynamic> getAllTasks();
  Future<dynamic> getRequestById(String id);
  Future<dynamic> editTask(
    String name,
    String date,
    String startTime,
    String endTime,
    String location,
    bool isFullDay,
    String id,
  );
  Future<dynamic> deleteTask(String id);
}
