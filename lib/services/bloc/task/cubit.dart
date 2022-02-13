import 'package:flutter/cupertino.dart';
import 'package:taskBee/common/database/database.dart';
import 'package:taskBee/models/contact.dart';
import 'package:taskBee/models/course.dart';
import 'package:taskBee/models/task/attachment_for_task.dart';
import 'package:taskBee/models/task/task.dart';
import 'package:taskBee/models/task/task_attachment.dart';
import 'package:taskBee/models/task/task_contact.dart';
import 'package:taskBee/models/task/task_course.dart';
import 'package:taskBee/models/task/task_importance.dart';
import 'package:taskBee/models/task/task_note.dart';
import 'package:taskBee/models/task/task_notification.dart';
import 'package:taskBee/models/task/task_place.dart';
import 'package:taskBee/models/task/task_status.dart';
import 'package:taskBee/models/task/task_type.dart';
import 'package:taskBee/services/bloc/task/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskBee/services/dao/dao_course.dart';
import 'package:taskBee/services/dao/task/dao_attachment_for_task.dart';
import 'package:taskBee/services/dao/task/dao_place.dart';
import 'package:taskBee/services/dao/task/dao_status.dart';
import 'package:taskBee/services/dao/task/dao_task.dart';
import 'package:taskBee/services/dao/task/dao_task_attachment.dart';
import 'package:taskBee/services/dao/task/dao_task_contact.dart';
import 'package:taskBee/services/dao/task/dao_task_course.dart';
import 'package:taskBee/services/dao/task/dao_task_importance.dart';
import 'package:taskBee/services/dao/task/dao_task_note.dart';
import 'package:taskBee/services/dao/task/dao_task_notification.dart';
import 'package:taskBee/services/dao/task/dao_task_type.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitialState());

  static TaskCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  TaskDao? taskDao;
  CourseDao? courseDao;
  AttachmentForTaskDao? attachmentForTaskDao;
  TaskPlaceDao? taskPlaceDao;
  StatusDao? statusDao;
  TaskAttachmentDao? taskAttachmentDao;
  TaskContactDao? taskContactDao;
  TaskCourseDao? taskCourseDao;
  TaskImportanceDao? taskImportanceDao;
  TaskNoteDao? taskNoteDao;
  TaskNotificationDao? taskNotificationDao;
  TaskTypeDao? taskTypeDao;
  List<Task>? tasks = [];
  List<Course>? course = [];
  List<AttachmentForTask>? attachmentForTask = [];
  List<TaskAttachment>? taskAttachments = [];
  List<TaskContact>? taskContacts = [];
  List<TaskCourse>? taskCourses = [];
  List<TaskImportance>? taskImportances = [];
  List<TaskNote>? taskNotes = [];
  List<TaskNotification>? taskNotifications = [];
  List<TaskPlace>? taskPlaces = [];
  List<TaskStatus>? taskStatuses = [];
  List<TaskType>? taskTypes = [];
  int? lastTaskId;
  int? lastCourseId;
  int? lastAttachmentForTaskId;
  int? lastTaskAttachmentId;
  int? lastTaskContactId;
  int? lastTaskCourseId;
  int? lastTaskImportanceId;
  int? lastTaskNoteId;
  int? lastTaskNotificationId;
  int? lastTaskPlaceId;
  int? lastTaskStatusId;
  int? lastTaskTypeId;
  Task? chosenWallet;

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      taskDao = database!.taskDao;
      courseDao = database!.courseDao;
      attachmentForTaskDao = database!.attachmentForTaskDao;
      taskPlaceDao = database!.taskPlaceDao;
      statusDao = database!.statusDao;
      taskAttachmentDao = database!.taskAttachmentDao;
      taskCourseDao = database!.taskCourseDao;
      taskContactDao = database!.taskContactDao;
      taskImportanceDao = database!.taskImportanceDao;
      taskNoteDao = database!.taskNoteDao;
      taskNotificationDao =database!.taskNotificationDao;
      taskTypeDao = database!.taskTypeDao;

      emit(TaskCreateDatabaseState());

      getAllTasks();
    });
  }

  void getTasksFromDatabase() {
    this.taskDao!.findAllTasks().then((value) {
      tasks = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskId = value[value.length - 1].id;
      } else {
        lastTaskId = 0;
      }
      print("11111111111111111111");

      emit(GetTasksFromDatabaseState());
    }).catchError((onError){
      print(onError);
    });
  }

  void getCoursesFromDatabase() {
    print("22222222222222222222222");
    this.courseDao!.findAllCourses().then((value) {
      print("333333333333333333333");
      course = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastCourseId = value[value.length - 1].id;
      } else {
        lastCourseId = 0;
      }

      emit(GetCoursesFromDatabaseState());
    }).catchError((onError){
      print(onError);
    });
  }

  void getAttachmentForTaskFromDatabase(){
    this.attachmentForTaskDao!.findAllAttachmentForTasks().then((value) {
      attachmentForTask = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastAttachmentForTaskId = value[value.length - 1].id;
      } else {
        lastAttachmentForTaskId = 0;
      }

      emit(GetAttachmentForTaskFromDatabaseState());
    });
  }

  void getTaskAttachmentFromDatabase(){
    this.taskAttachmentDao!.findAllAttachments().then((value) {
      taskAttachments = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskAttachmentId = value[value.length - 1].id;
      } else {
        lastTaskAttachmentId = 0;
      }

      emit(GetTaskAttachmentFromDatabaseState());
    });
  }

  void getTaskContactFromDatabase(){
    this.taskContactDao!.findAllContacts().then((value) {
      taskContacts = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskContactId = value[value.length - 1].id;
      } else {
        lastTaskContactId = 0;
      }

      emit(GetTaskContactFromDatabaseState());
    });
  }

  void getTaskCourseFromDatabase(){
    this.taskCourseDao!.findAllCourses().then((value) {
      taskCourses = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskCourseId = value[value.length - 1].id;
      } else {
        lastTaskCourseId = 0;
      }

      emit(GetTaskCoursesFromDatabaseState());
    });
  }

  void getTaskImportanceFromDatabase(){
    this.taskImportanceDao!.findAllImportance().then((value) {
      taskImportances = value;
      print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii: ${taskImportances!.length}');
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskImportanceId = value[value.length - 1].id;
      } else {
        insertTaskImportanceToDatabase(ads: 1 ,isActive: 1, isAppear: 1, importance: "very important", color: "red");
        insertTaskImportanceToDatabase(ads: 2 ,isActive: 1, isAppear: 1, importance: "important", color: "blue");
        insertTaskImportanceToDatabase(ads: 3 ,isActive: 1, isAppear: 1, importance: "Medium important", color: "green");
        insertTaskImportanceToDatabase(ads: 4 ,isActive: 1, isAppear: 1, importance: "low important", color: "yellow");
        insertTaskImportanceToDatabase(ads: 5 ,isActive: 1, isAppear: 1, importance: "not  important", color: "grey");
        lastTaskImportanceId = 0;
      }

      emit(GetTaskImportancesFromDatabaseState());
    });
  }

  void getTaskNoteFromDatabase(){
    this.taskNoteDao!.findAllNotes().then((value) {
      taskNotes = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskNoteId = value[value.length - 1].id;
      } else {
        lastTaskNoteId = 0;
      }

      emit(GetTaskNotesFromDatabaseState());
    });
  }

  void getTaskNotificationsFromDatabase(){
    this.taskNotificationDao!.findAllNotifications().then((value) {
      taskNotifications = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskNotificationId = value[value.length - 1].id;
      } else {
        lastTaskNotificationId = 0;
      }

      emit(GetTaskNotificationsFromDatabaseState());
    });
  }

  void getTaskPlacesFromDatabase(){
    this.taskPlaceDao!.findAllPlaces().then((value) {
      taskPlaces = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskPlaceId = value[value.length - 1].id;
      } else {
        lastTaskPlaceId = 0;
      }

      emit(GetTaskPlacesFromDatabaseState());
    });
  }

  void getTaskStatusFromDatabase(){
    this.statusDao!.findAllStatus().then((value) {
      taskStatuses = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskStatusId = value[value.length - 1].id;
      } else {
        lastTaskStatusId = 0;
      }

      emit(GetTaskStatusFromDatabaseState());
    });
  }

  void getTaskTypesFromDatabase(){
    this.taskTypeDao!.findAllTypes().then((value) {
      taskTypes = value;
      print('tttttttttttttttttttttttttttttt: ${taskTypes!.length}');
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastTaskTypeId = value[value.length - 1].id;
      } else {
        insertTaskTypeToDatabase(ids: 1, isActive: 1, isAppear: 1, type: "job", image: "");
        insertTaskTypeToDatabase(ids: 2,isActive: 1, isAppear: 1, type: "purchases", image: "");
        insertTaskTypeToDatabase(ids: 3,isActive: 1, isAppear: 1, type: "calls", image: "");
        insertTaskTypeToDatabase(ids: 4,isActive: 1, isAppear: 1, type: "treatment", image: "");
        insertTaskTypeToDatabase(ids: 5,isActive: 1, isAppear: 1, type: "Occasions", image: "");
        insertTaskTypeToDatabase(ids: 6,isActive: 1, isAppear: 1, type: "travel", image: "");
        insertTaskTypeToDatabase(ids: 7,isActive: 1, isAppear: 1, type: "Personal", image: "");
        insertTaskTypeToDatabase(ids: 8,isActive: 1, isAppear: 1, type: "entertainment", image: "");
        insertTaskTypeToDatabase(ids: 9,isActive: 1, isAppear: 1, type: "sport", image: "");
        insertTaskTypeToDatabase(ids: 10,isActive: 1, isAppear: 1, type: "exam", image: "");
        insertTaskTypeToDatabase(ids: 11,isActive: 1, isAppear: 1, type: "homework", image: "");
        insertTaskTypeToDatabase(ids: 12,isActive: 1, isAppear: 1, type: "Lectures", image: "");
        insertTaskTypeToDatabase(ids: 13,isActive: 1, isAppear: 1, type: "Study times", image: "");
        insertTaskTypeToDatabase(ids: 14,isActive: 1, isAppear: 1, type: "special lesson", image: "");
        insertTaskTypeToDatabase(ids: 15,isActive: 1, isAppear: 1, type: "Other dates", image: "");
        lastTaskTypeId = 0;
      }

      emit(GetTaskTypesFromDatabaseState());
    });
  }

  void getAllTasks(){
    getTasksFromDatabase();
    getCoursesFromDatabase();
    getAttachmentForTaskFromDatabase();
    getTaskAttachmentFromDatabase();
    getTaskContactFromDatabase();
    getTaskCourseFromDatabase();
    getTaskImportanceFromDatabase();
    getTaskNoteFromDatabase();
    getTaskNotificationsFromDatabase();
    getTaskPlacesFromDatabase();
    getTaskStatusFromDatabase();
    getTaskTypesFromDatabase();
    // insertTaskImportanceToDatabase(
    //     isActive: 1,
    //     isAppear: 1,
    //     importance: "high",
    //     color: "green");
  }

  Future<int?> insertTaskToDatabase(
      {@required String? taskName,
        @required String? stDate,
        @required String? enDate,
        @required String? stTime,
        @required String? enTime,
        @required int? isAllDay,
        @required int? isActive,
        @required int? isAppear,
        @required int? typeId,
        @required int? importanceId,
        @required int? statusId,}) async {
    int id = 0;
    if (tasks!.length == 0) {
      id = 1;
    } else {
      id = tasks![tasks!.length - 1].id + 1;
    }
    if (id > 0) {
       return taskDao!
          .insertTask(Task(
          id,taskName!, isActive!,isAppear!,typeId!,stDate!,enDate!,stTime!,enTime!,isAllDay!,importanceId!,statusId!))
          .then((value) {
        emit(InsertTaskToDatabaseState());
        getTasksFromDatabase();
      });
    }
  }

  Future<int?> insertCourseToDatabase(
      {@required String? name,
        @required String? color,
        @required int? isActive,
        @required int? isAppear,}) async {
    int id = 0;
    if (course!.length == 0) {
      id = 1;
    } else {
      id = course![course!.length - 1].id + 1;
    }
    if (id > 0) {
      courseDao!
          .insertCourse(Course(id, isActive!, isAppear!, name!, color!))
          .then((value) {
        emit(InsertCourseToDatabaseState());
        getCoursesFromDatabase();
      });
    }
  }

  Future<int?> insertAttachmentForTaskToDatabase(
      {@required String? attach,
        @required int? isActive,
        @required int? isAppear,}) async {
    int id = 0;
    if (attachmentForTask!.length == 0) {
      id = 1;
    } else {
      id = attachmentForTask![attachmentForTask!.length - 1].id + 1;
    }
    if (id > 0) {
      attachmentForTaskDao!
          .insertAttachmentForTask(AttachmentForTask(id, isActive!, isAppear!, attach!))
          .then((value) {
        emit(InsertAttachmentForTaskToDatabaseState());
        getAttachmentForTaskFromDatabase();
      });
    }
  }

  Future<int?> insertTaskAttachmentToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required int? attachmentId,}) async {
    int id = 0;
    if (taskAttachments!.length == 0) {
      id = 1;
    } else {
      id = taskAttachments![taskAttachments!.length - 1].id + 1;
    }
    if (id > 0) {
      taskAttachmentDao!
          .insertAttachment(TaskAttachment(id, isActive!, isAppear!, taskId!, attachmentId!))
          .then((value) {
        emit(InsertTaskAttachmentToDatabaseState());
        getTaskAttachmentFromDatabase();
      });
    }
  }

  Future<int?> insertTaskContactToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required int? contactId,}) async {
    int id = 0;
    if (taskContacts!.length == 0) {
      id = 1;
    } else {
      id = taskContacts![taskContacts!.length - 1].id + 1;
    }
    if (id > 0) {
      taskContactDao!
          .insertContact(TaskContact(id, isActive!, isAppear!, taskId!, contactId!))
          .then((value) {
        emit(InsertTaskContactToDatabaseState());
        getTaskContactFromDatabase();
      });
    }
  }

  Future<int?> insertTaskCourseToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required int? courseId,}) async {
    int id = 0;
    if (taskCourses!.length == 0) {
      id = 1;
    } else {
      id = taskCourses![taskCourses!.length - 1].id + 1;
    }
    if (id > 0) {
      taskCourseDao!
          .insertCourse(TaskCourse(id, isActive!, isAppear!, taskId!, courseId!))
          .then((value) {
        emit(InsertTaskCourseToDatabaseState());
        getTaskCourseFromDatabase();
      });
    }
  }

  Future<int?> insertTaskImportanceToDatabase(
      {
        @required int? ads,
        @required int? isActive,
        @required int? isAppear,
        @required String? importance,
        @required String? color,}) async {
    int id = 0;
    if (taskImportances!.length == 0) {
      id = 1;
    } else {
      id = taskImportances![taskImportances!.length - 1].id + 1;
    }
    if (id > 0) {
      taskImportanceDao!
          .insertImportance(TaskImportance(ads!, isActive!, isAppear!, importance!, color!))
          .then((value) {
        emit(InsertTaskImportanceToDatabaseState());
        getTaskImportanceFromDatabase();
      });
    }
  }

  Future<int?> insertTaskNoteToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required String? note,
        @required int? state,}) async {
    int id = 0;
    if (taskNotes!.length == 0) {
      id = 1;
    } else {
      id = taskNotes![taskNotes!.length - 1].id + 1;
    }
    if (id > 0) {
      taskNoteDao!
          .insertNote(TaskNote(id, isActive!, isAppear!, taskId!, note!, state!))
          .then((value) {
        emit(InsertTaskNoteToDatabaseState());
        getTaskNoteFromDatabase();
      });
    }
  }

  Future<int?> insertTaskNotificationToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required String? metaKey,
        @required String? metaValue,}) async {
    int id = 0;
    if (taskNotifications!.length == 0) {
      id = 1;
    } else {
      id = taskNotifications![taskNotifications!.length - 1].id + 1;
    }
    if (id > 0) {
      taskNotificationDao!
          .insertNotification(TaskNotification(id, isActive!, isAppear!, taskId!, metaKey!, metaValue!))
          .then((value) {
        emit(InsertTaskNotificationToDatabaseState());
        getTaskNotificationsFromDatabase();
      });
    }
  }

  Future<int?> insertTaskPlaceToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required int? taskId,
        @required String? place,
        @required int? state,}) async {
    int id = 0;
    if (taskPlaces!.length == 0) {
      id = 1;
    } else {
      id = taskPlaces![taskPlaces!.length - 1].id + 1;
    }
    if (id > 0) {
      taskPlaceDao!
          .insertPlace(TaskPlace(id, isActive!, isAppear!, taskId!, place!, state!))
          .then((value) {
        emit(InsertTaskPlaceToDatabaseState());
        getTaskPlacesFromDatabase();
      });
    }
  }

  Future<int?> insertTaskStatusToDatabase(
      {
        @required int? isActive,
        @required int? isAppear,
        @required String? state,}) async {
    int id = 0;
    if (taskStatuses!.length == 0) {
      id = 1;
    } else {
      id = taskStatuses![taskStatuses!.length - 1].id + 1;
    }
    if (id > 0) {
      statusDao!
          .insertStatus(TaskStatus(id, isActive!, isAppear!, state!))
          .then((value) {
        emit(InsertTaskStatusToDatabaseState());
        getTaskStatusFromDatabase();
      });
    }
  }

  Future<int?> insertTaskTypeToDatabase(
      {
        @required int? isActive,
        @required int? ids,
        @required int? isAppear,
        @required String? type,
        @required String? image,}) async {
    int id = 0;
    if (taskTypes!.length == 0) {
      id = 1;
    } else {
      id = taskTypes![taskTypes!.length - 1].id + 1;
    }
    if (id > 0) {
      taskTypeDao!
          .insertType(TaskType(ids!, isActive!, isAppear!, type!, image!))
          .then((value) {
        emit(InsertTaskTypeToDatabaseState());
        getTaskTypesFromDatabase();
      });
    }
  }


  Future<int?> deleteTaskFromDatabase(
      {@required Task? task,}) async {

    task!.isActive = 0;
      return taskDao!
          .updateTask(task)
          .then((value) {
        emit(DeleteTaskFromDatabaseState());
        getTasksFromDatabase();
      });

  }

  Future<int?> deleteCourseFromDatabase(
      {@required Course? course,}) async {
   course!.isActive = 0;

      courseDao!
          .updateCourse(course)
          .then((value) {
        emit(DeleteCourseFromDatabaseState());
        getCoursesFromDatabase();
      });

  }

  Future<int?> deleteAttachmentForTaskFromDatabase(
      {@required AttachmentForTask? attach,}) async {
    attach!.isActive = 0;
      attachmentForTaskDao!
          .updateAttachmentForTask(attach)
          .then((value) {
        emit(DeleteAttachmentForTaskFromDatabaseState());
        getAttachmentForTaskFromDatabase();
      });

  }

  Future<int?> deleteTaskAttachmentFromDatabase(
      {
        @required TaskAttachment? taskAttachment,}) async {

    taskAttachment!.isActive = 0;
      taskAttachmentDao!
          .updateAttachment(taskAttachment)
          .then((value) {
        emit(DeleteTaskAttachmentFromDatabaseState());
        getTaskAttachmentFromDatabase();
      });

  }

  Future<int?> deleteTaskContactFromDatabase(
      {
        @required TaskContact? taskContact,}) async {
   taskContact!.isActive = 0;
      taskContactDao!
          .updateContact(taskContact)
          .then((value) {
        emit(DeleteTaskContactFromDatabaseState());
        getTaskContactFromDatabase();
      });

  }

  Future<int?> deleteTaskCourseFromDatabase(
      {
        @required TaskCourse? taskCourse,}) async {
    taskCourse!.isActive = 0;
      taskCourseDao!
          .updateCourse(taskCourse)
          .then((value) {
        emit(DeleteTaskCourseFromDatabaseState());
        getTaskCourseFromDatabase();
      });

  }

  Future<int?> deleteTaskImportanceFromDatabase(
      {
        @required TaskImportance? taskImportance,}) async {
    taskImportance!.isActive = 0;
      taskImportanceDao!
          .updateImportance(taskImportance)
          .then((value) {
        emit(DeleteTaskImportanceFromDatabaseState());
        getTaskImportanceFromDatabase();
      });

  }

  Future<int?> deleteTaskNoteFromDatabase(
      {
        @required TaskNote? taskNote,}) async {
    taskNote!.isActive = 0;
      taskNoteDao!
          .updateNote(taskNote)
          .then((value) {
        emit(DeleteTaskNoteFromDatabaseState());
        getTaskNoteFromDatabase();
      });

  }

  Future<int?> deleteTaskNotificationFromDatabase(
      {
        @required TaskNotification? taskNotification,}) async {
    taskNotification!.isActive = 0;
      taskNotificationDao!
          .updateNotification(taskNotification)
          .then((value) {
        emit(DeleteTaskNotificationFromDatabaseState());
        getTaskNotificationsFromDatabase();
      });

  }

  Future<int?> deleteTaskPlaceFromDatabase(
      {
        @required TaskPlace? taskPlace,}) async {
    taskPlace!.isActive = 0 ;
      taskPlaceDao!
          .updatePlace(taskPlace)
          .then((value) {
        emit(DeleteTaskPlaceFromDatabaseState());
        getTaskPlacesFromDatabase();
      });

  }

  Future<int?> deleteTaskStatusFromDatabase(
      {
        @required TaskStatus? taskStats,}) async {
    taskStats!.isActive = 0;
      statusDao!
          .updateStatus(taskStats)
          .then((value) {
        emit(DeleteTaskStatusFromDatabaseState());
        getTaskStatusFromDatabase();
      });

  }

  Future<int?> deleteTaskTypeFromDatabase(
      {
        @required TaskType? taskType,}) async {
  taskType!.isActive = 0;
      taskTypeDao!
          .updateType(taskType)
          .then((value) {
        emit(DeleteTaskTypeFromDatabaseState());
        getTaskTypesFromDatabase();
      });

  }

  Future<int?> updateTaskFromDatabase(
      {@required Task? task,}) async {


    return taskDao!
        .updateTask(task!)
        .then((value) {
      emit(UpdateTaskFromDatabaseState());
      getTasksFromDatabase();
    });

  }

  Future<int?> updateCourseFromDatabase(
      {@required Course? course,}) async {
    courseDao!
        .updateCourse(course!)
        .then((value) {
      emit(UpdateCourseFromDatabaseState());
      getCoursesFromDatabase();
    });

  }

  Future<int?> updateAttachmentForTaskFromDatabase(
      {@required AttachmentForTask? attach,}) async {
    attachmentForTaskDao!
        .updateAttachmentForTask(attach!)
        .then((value) {
      emit(UpdateAttachmentForTaskFromDatabaseState());
      getAttachmentForTaskFromDatabase();
    });

  }

  Future<int?> updateTaskAttachmentFromDatabase(
      {
        @required TaskAttachment? taskAttachment,}) async {

    taskAttachmentDao!
        .updateAttachment(taskAttachment!)
        .then((value) {
      emit(UpdateTaskAttachmentFromDatabaseState());
      getTaskAttachmentFromDatabase();
    });

  }

  Future<int?> updateTaskContactFromDatabase(
      {
        @required TaskContact? taskContact,}) async {
    taskContactDao!
        .updateContact(taskContact!)
        .then((value) {
      emit(UpdateTaskContactFromDatabaseState());
      getTaskContactFromDatabase();
    });

  }

  Future<int?> updateTaskCourseFromDatabase(
      {
        @required TaskCourse? taskCourse,}) async {
    taskCourseDao!
        .updateCourse(taskCourse!)
        .then((value) {
      emit(UpdateTaskCourseFromDatabaseState());
      getTaskCourseFromDatabase();
    });

  }

  Future<int?> updateTaskImportanceFromDatabase(
      {
        @required TaskImportance? taskImportance,}) async {
    taskImportanceDao!
        .updateImportance(taskImportance!)
        .then((value) {
      emit(UpdateTaskImportanceFromDatabaseState());
      getTaskImportanceFromDatabase();
    });

  }

  Future<int?> updateTaskNoteFromDatabase(
      {
        @required TaskNote? taskNote,}) async {
    taskNoteDao!
        .updateNote(taskNote!)
        .then((value) {
      emit(UpdateTaskNoteFromDatabaseState());
      getTaskNoteFromDatabase();
    });

  }

  Future<int?> updateTaskNotificationFromDatabase(
      {
        @required TaskNotification? taskNotification,}) async {
    taskNotificationDao!
        .updateNotification(taskNotification!)
        .then((value) {
      emit(UpdateTaskNotificationFromDatabaseState());
      getTaskNotificationsFromDatabase();
    });

  }

  Future<int?> updateTaskPlaceFromDatabase(
      {
        @required TaskPlace? taskPlace,}) async {
    taskPlaceDao!
        .updatePlace(taskPlace!)
        .then((value) {
      emit(UpdateTaskPlaceFromDatabaseState());
      getTaskPlacesFromDatabase();
    });

  }

  Future<int?> updateTaskStatusFromDatabase(
      {
        @required TaskStatus? taskStats,}) async {
    statusDao!
        .updateStatus(taskStats!)
        .then((value) {
      emit(UpdateTaskStatusFromDatabaseState());
      getTaskStatusFromDatabase();
    });

  }

  Future<int?> updateTaskTypeFromDatabase(
      {
        @required TaskType? taskType,}) async {
    taskTypeDao!
        .updateType(taskType!)
        .then((value) {
      emit(UpdateTaskTypeFromDatabaseState());
      getTaskTypesFromDatabase();
    });

  }
}