import 'package:taskBee/models/task/task_contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskContactDao {
  @Query('SELECT * FROM task_contact')
  Future<List<TaskContact>?> findAllContacts();

  @Query('SELECT * FROM task_contact WHERE id = :id')
  Future<TaskContact?> findContactById(int id);

  @Query('DELETE FROM task_contact WHERE id = :id')
  Future<TaskContact?> deleteContact(int id);

  @update
  Future<void> updateContact(TaskContact taskContact);

  @insert
  Future<int?> insertContact(TaskContact taskContact);
}
