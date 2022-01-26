import 'package:floor/floor.dart';


@Entity(tableName: 'course',
  primaryKeys: ['id'],

)

class Course {
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  @ColumnInfo(name: 'color')
  final String color;


  @ColumnInfo(name: 'is_active')
  final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;



  Course(this.id,  this.isActive,  this.isAppear, this.name, this.color,  );
}