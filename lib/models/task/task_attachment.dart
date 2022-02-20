import 'package:taskBee/models/task/attachment_for_task.dart';
import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'task_attachment',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['attachment_id'],
      parentColumns: ['id'],
      entity: AttachmentForTask,
    ),
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    ),
  ],
)

class TaskAttachment {
  final int id;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  @ColumnInfo(name: 'attachment_id')
  final int attachmentId;

  TaskAttachment(this.id, this.isActive, this.isAppear, this.taskId, this.attachmentId);
}