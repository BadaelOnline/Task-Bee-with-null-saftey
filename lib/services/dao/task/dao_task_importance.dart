
import 'package:floor/floor.dart';
import 'package:taskBee/models/task/task_importance.dart';

@dao
abstract class TaskImportanceDao {
  @Query('SELECT * FROM task_importance')
  Future<List<TaskImportance>?> findAllImportance();

  @Query('SELECT * FROM task_importance WHERE id = :id')
  Future<TaskImportance?> findImportanceById(int id);

  @Query('DELETE FROM task_importance WHERE id = :id')
  Future<TaskImportance?> deleteImportance(int id);

  @update
  Future<void> updateImportance(TaskImportance taskImportance);

  @insert
  Future<int?> insertImportance(TaskImportance taskImportance);
}
