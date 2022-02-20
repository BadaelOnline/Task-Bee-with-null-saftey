import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'task_note',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    )
  ],)
class TaskNote {
  final int id;

  @ColumnInfo(name: 'note')
  final String note;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'state')
  final int state;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  TaskNote(this.id, this.isActive, this.isAppear,this.taskId, this.note, this.state);
}
