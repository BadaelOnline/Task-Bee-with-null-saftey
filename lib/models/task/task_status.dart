import 'package:floor/floor.dart';


@Entity(tableName: 'task_status',
  primaryKeys: ['id'],

)

class TaskStatus {
  final int id;

  @ColumnInfo(name: 'state')
  final String state;

  @ColumnInfo(name: 'is_active')
  final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;



  TaskStatus(this.id,  this.isActive,  this.isAppear, this.state, );
}