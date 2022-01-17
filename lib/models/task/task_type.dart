import 'package:floor/floor.dart';


@Entity(tableName: 'task_type',
  primaryKeys: ['id'],

)

class TaskType {
  final int id;

  @ColumnInfo(name: 'type')
  final String type;

  @ColumnInfo(name: 'image')
  final String image;

  @ColumnInfo(name: 'is_active')
  final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;



  TaskType(this.id,  this.isActive,  this.isAppear, this.type, this.image, );
}