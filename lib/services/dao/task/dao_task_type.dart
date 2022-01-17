import 'package:taskBee/models/task/task_type.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskTypeDao {
  @Query('SELECT * FROM task_type')
  Future<List<TaskType>?> findAllTypes();

  @Query('SELECT * FROM task_type WHERE id = :id')
  Future<TaskType?> findTypeById(int id);

  @Query('DELETE FROM task_type WHERE id = :id')
  Future<TaskType?> deleteType(int id);

  @update
  Future<void> updateType(TaskType taskType);

  @insert
  Future<int?> insertType(TaskType taskType);
}
