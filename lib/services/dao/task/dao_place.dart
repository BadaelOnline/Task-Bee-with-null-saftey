import 'package:taskBee/models/task/task_place.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskPlaceDao {
  @Query('SELECT * FROM task_place')
  Future<List<TaskPlace>?> findAllPlaces();

  @Query('SELECT * FROM task_place WHERE id = :id')
  Future<TaskPlace?> findPlaceById(int id);

  @Query('DELETE FROM task_place WHERE id = :id')
  Future<TaskPlace?> deletePlace(int id);

  @update
  Future<void> updatePlace(TaskPlace taskPlace);

  @insert
  Future<int?> insertPlace(TaskPlace taskPlace);
}
