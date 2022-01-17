import 'package:floor/floor.dart';


@Entity(tableName: 'attachment_for_task',
  primaryKeys: ['id'],

)

class AttachmentForTask {
  final int id;

  @ColumnInfo(name: 'attach')
  final String attach;



  @ColumnInfo(name: 'is_active')
  final int isActive;

  @ColumnInfo(name: 'is_appear')
  final int isAppear;



  AttachmentForTask(this.id,  this.isActive,  this.isAppear, this.attach,  );
}