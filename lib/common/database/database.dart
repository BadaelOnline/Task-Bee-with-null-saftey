// database.dart

// required package imports
import 'dart:async';
import 'package:taskBee/models/bmi.dart';
import 'package:taskBee/models/contact.dart';
import 'package:taskBee/models/course.dart';
import 'package:taskBee/models/currency.dart';
import 'package:taskBee/models/exchange_category.dart';
import 'package:taskBee/models/financial_report.dart';
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
import 'package:taskBee/models/transaction.dart';
import 'package:taskBee/models/wallet.dart';
import 'package:taskBee/services/dao/dao_bmi.dart';
import 'package:taskBee/services/dao/dao_contact.dart';
import 'package:taskBee/services/dao/dao_course.dart';
import 'package:taskBee/services/dao/dao_exchange_category.dart';
import 'package:taskBee/services/dao/dao_transaction.dart';
import 'package:taskBee/services/dao/dao_wallet.dart';
import 'package:taskBee/services/dao/dao_currency.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
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

part 'database.g.dart'; // the generated code will be there

@Database(
    version: 1,
    entities: [Wallet, Currency, Transaction, Contact, ExchangeCategory, Bmi,Course,AttachmentForTask,Task,TaskAttachment,TaskContact,TaskCourse,TaskNote,TaskNotification,TaskPlace,TaskStatus,TaskType,TaskImportance,])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  CurrencyDao get currencyDao;
  TransactionDao get transactionDao;
  ExchangeCategoryDao get exchangeCategoryDao;
  ContactDao get contactDao;
  BmiDao get bmiDao;
  CourseDao get courseDao;
  AttachmentForTaskDao get attachmentForTaskDao;
  TaskPlaceDao get taskPlaceDao;
  StatusDao get statusDao;
  TaskDao get taskDao;
  TaskAttachmentDao get taskAttachmentDao;
  TaskContactDao get taskContactDao;
  TaskCourseDao get taskCourseDao;
  TaskNoteDao get taskNoteDao;
  TaskNotificationDao get taskNotificationDao;
  TaskTypeDao get taskTypeDao;
  TaskImportanceDao get taskImportanceDao;

}
