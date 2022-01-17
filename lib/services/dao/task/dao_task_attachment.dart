import 'package:taskBee/models/task/task_attachment.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskAttachmentDao {
  @Query('SELECT * FROM task_attachment')
  Future<List<TaskAttachment>?> findAllAttachments();

  @Query('SELECT * FROM task_attachment WHERE id = :id')
  Future<TaskAttachment?> findAttachmentById(int id);

  @Query('DELETE FROM task_attachment WHERE id = :id')
  Future<TaskAttachment?> deleteAttachment(int id);

  @update
  Future<void> updateAttachment(TaskAttachment taskAttachment);

  @insert
  Future<int?> insertAttachment(TaskAttachment taskAttachment);
}
