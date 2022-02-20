import 'package:floor/floor.dart';



@Entity(tableName: 'task_importance',
  primaryKeys: ['id'],

)

class TaskImportance {
  final int id;

  @ColumnInfo(name: 'importance')
  final String importance;

  @ColumnInfo(name: 'color')
  final String color;

  @ColumnInfo(name: 'is_active')
  late final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;



  TaskImportance(this.id,  this.isActive,  this.isAppear, this.importance, this.color, );
}