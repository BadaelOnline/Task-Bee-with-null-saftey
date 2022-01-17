import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM task')
  Future<List<Task>?> findAllTasks();

  @Query('SELECT * FROM task WHERE id = :id')
  Future<Task?> findTaskById(int id);

  @Query('DELETE FROM task WHERE id = :id')
  Future<Task?> deleteTask(int id);

  @update
  Future<void> updateTask(Task task);

  @insert
  Future<int?> insertTask(Task task);
}
