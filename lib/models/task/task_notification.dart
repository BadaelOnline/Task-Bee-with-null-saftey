import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'task_notification',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    )
  ],)
class TaskNotification {
  final int id;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  @ColumnInfo(name: 'meta_key')
  final String metaKey;

  @ColumnInfo(name: 'meta_vlaue')
  final String metaValue;

  TaskNotification(this.id, this.isActive, this.isAppear,this.taskId, this.metaKey, this.metaValue,);
}
