import 'package:taskBee/models/task/task_notification.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskNotificationDao {
  @Query('SELECT * FROM task_notification')
  Future<List<TaskNotification>?> findAllNotifications();

  @Query('SELECT * FROM task_notification WHERE id = :id')
  Future<TaskNotification?> findNotificationById(int id);

  @Query('DELETE FROM task_notification WHERE id = :id')
  Future<TaskNotification?> deleteNotification(int id);

  @update
  Future<void> updateNotification(TaskNotification taskNotification);

  @insert
  Future<int?> insertNotification(TaskNotification taskNotification);
}
