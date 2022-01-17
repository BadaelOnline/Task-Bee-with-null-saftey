import 'package:taskBee/models/task/task_note.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskNoteDao {
  @Query('SELECT * FROM task_note')
  Future<List<TaskNote>?> findAllNotes();

  @Query('SELECT * FROM task_note WHERE id = :id')
  Future<TaskNote?> findNoteById(int id);

  @Query('DELETE FROM task_note WHERE id = :id')
  Future<TaskNote?> deleteNote(int id);

  @update
  Future<void> updateNote(TaskNote taskNote);

  @insert
  Future<int?> insertNote(TaskNote taskNote);
}
