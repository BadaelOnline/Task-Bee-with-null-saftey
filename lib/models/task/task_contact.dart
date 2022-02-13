import 'package:taskBee/models/contact.dart';
import 'package:taskBee/models/task/task.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'task_contact',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['contact_id'],
      parentColumns: ['id'],
      entity: Contact,
    ),
    ForeignKey(
      childColumns: ['task_id'],
      parentColumns: ['id'],
      entity: Task,
    ),
  ],
)

class TaskContact {
  final int id;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'task_id')
  final int taskId;

  @ColumnInfo(name: 'contact_id')
  final int contactId;

  TaskContact(this.id, this.isActive, this.isAppear, this.taskId, this.contactId);
}