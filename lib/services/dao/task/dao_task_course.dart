import 'package:taskBee/models/task/task_course.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskCourseDao {
  @Query('SELECT * FROM task_course')
  Future<List<TaskCourse>?> findAllCourses();

  @Query('SELECT * FROM task_course WHERE id = :id')
  Future<TaskCourse?> findCourseById(int id);

  @Query('DELETE FROM task_course WHERE id = :id')
  Future<TaskCourse?> deleteCourse(int id);

  @update
  Future<void> updateCourse(TaskCourse taskCourse);

  @insert
  Future<int?> insertCourse(TaskCourse taskCourse);
}
