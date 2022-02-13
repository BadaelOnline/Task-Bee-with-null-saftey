import 'package:taskBee/models/course.dart';
import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'task_course',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['course_id'],
      parentColumns: ['id'],
      entity: Course,
    ),
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    ),
  ],
)

class TaskCourse {
  final int id;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  @ColumnInfo(name: 'course_id')
  final int courseId;

  TaskCourse(this.id, this.isActive, this.isAppear, this.taskId, this.courseId);
}