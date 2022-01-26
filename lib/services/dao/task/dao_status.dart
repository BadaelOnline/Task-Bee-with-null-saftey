import 'package:taskBee/models/task/task_status.dart';
import 'package:floor/floor.dart';

@dao
abstract class StatusDao {
  @Query('SELECT * FROM task_status')
  Future<List<TaskStatus>?> findAllStatus();

  @Query('SELECT * FROM task_status WHERE id = :id')
  Future<TaskStatus?> findStatusById(int id);

  @Query('DELETE FROM task_status WHERE id = :id')
  Future<TaskStatus?> deleteStatus(int id);

  @update
  Future<void> updateStatus(TaskStatus taskStatus);

  @insert
  Future<int?> insertStatus(TaskStatus taskStatus);
}
