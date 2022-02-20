import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'task_place',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    )
  ],)
class TaskPlace {
  final int id;

  @ColumnInfo(name: 'place')
  final String place;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'state')
  final int state;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  TaskPlace(this.id, this.isActive, this.isAppear,this.taskId, this.place, this.state);
}
