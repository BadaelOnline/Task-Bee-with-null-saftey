import 'package:taskBee/models/task/task_importance.dart';
import 'package:taskBee/models/task/task_status.dart';
import 'package:taskBee/models/task/task_type.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'task',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['type_id'],
      parentColumns: ['id'],
      entity: TaskType,
    ),
    ForeignKey(
      childColumns: ['importance_id'],
      parentColumns: ['id'],
      entity: TaskImportance,
    ),
    ForeignKey(
      childColumns: ['status_id'],
      parentColumns: ['id'],
      entity: TaskStatus,
    ),
  ],
  )

class Task {
  final int id;

  @ColumnInfo(name: 'name_task')
  final String name;

  @ColumnInfo(name: 'start_date')
  final String stDate;

  @ColumnInfo(name: 'end_date')
  final String enDate;

  @ColumnInfo(name: 'time')
  final String stTime;

  @ColumnInfo(name: 'end_time')
  final String enTime;

  @ColumnInfo(name: 'is_all_day')
  final int isAllDay;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;

  @ColumnInfo(name: 'type_id')
  final int typeId;

  @ColumnInfo(name: 'importance_id')
  final int importanceId;

  @ColumnInfo(name: 'status_id')
  final int statusId;

  Task(this.id, this.name, this.isActive,  this.isAppear,this.typeId, this.stDate, this.enDate, this.stTime, this.enTime, this.isAllDay, this.importanceId, this.statusId);
}