import '../repositories/task_repository_interface.dart';
import 'task_service_interface.dart';

class TaskService implements TaskServiceInterface{
  final TaskRepositoryInterface taskRepositoryInterface;

  TaskService({required this.taskRepositoryInterface});

 
  @override
  Future addTask(String name, String date, String startTime, String endTime, String location, bool isFullDay) async{
   return await taskRepositoryInterface.addTask(name, date, startTime, endTime, location, isFullDay);
  }
  
  @override
  Future deleteTask(String id) async{
    return await taskRepositoryInterface.deleteTask(id);
  }
  
  @override
  Future editTask(String name, String date, String startTime, String endTime, String location, bool isFullDay, String id) async {
    return await taskRepositoryInterface.editTask(name, date, startTime, endTime, location, isFullDay, id);
  }
  
  @override
  Future getAllTasks() async{
    return await taskRepositoryInterface.getAllTasks();
  }
  
  @override
  Future getRequestById(String id) async{
    return await taskRepositoryInterface.getRequestById(id);
  }
}