import 'package:taskBee/models/course.dart';
import 'package:floor/floor.dart';

@dao
abstract class CourseDao {
  @Query('SELECT * FROM course')
  Future<List<Course>?> findAllCourses();

  @Query('SELECT * FROM course WHERE id = :id')
  Future<Course?> findCourseById(int id);

  @Query('DELETE FROM course WHERE id = :id')
  Future<Course?> deleteCourse(int id);

  @update
  Future<void> updateCourse(Course course);

  @insert
  Future<int?> insertCourse(Course course);
}
