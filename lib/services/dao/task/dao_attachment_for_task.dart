import 'package:taskBee/models/task/attachment_for_task.dart';
import 'package:floor/floor.dart';

@dao
abstract class AttachmentForTaskDao {
  @Query('SELECT * FROM attachment_for_task')
  Future<List<AttachmentForTask>?> findAllAttachmentForTasks();

  @Query('SELECT * FROM attachment_for_task WHERE id = :id')
  Future<AttachmentForTask?> findAttachmentForTaskById(int id);

  @Query('DELETE FROM attachment_for_task WHERE id = :id')
  Future<AttachmentForTask?> deleteAttachmentForTask(int id);

  @update
  Future<void> updateAttachmentForTask(AttachmentForTask attachmentForTask);

  @insert
  Future<int?> insertAttachmentForTask(AttachmentForTask attachmentForTask);
}
