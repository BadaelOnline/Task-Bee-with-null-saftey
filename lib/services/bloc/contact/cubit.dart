import 'package:taskBee/common/database/database.dart';
import 'package:taskBee/models/contact.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/services/dao/dao_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactCubit extends Cubit<ContactStates>{
  ContactCubit() : super(ContactIntialState());

  static ContactCubit get(context) => BlocProvider.of(context);

  AppDatabase? database ;
  ContactDao? dao  ;
  List<Contact>? contacts = [];
  int? lastId ;
  Contact? chosenContact;

  void createDatabase(){
    $FloorAppDatabase.databaseBuilder('database_wallet.db').build().then((value) {
      database = value;
      dao = database!.contactDao;
      emit(ContactCreateDatabaseState());

      getContactsFromDatabase();
    });
  }

  void getContactsFromDatabase(){
    this.dao!.retrieveContacts().then((value) {
      contacts = value;
      if(value!.length > 0){
        lastId = value[value.length -1].id;
      }else{
        lastId = 0;
      }

      emit(GetContactsFromDatabaseState());


    });
  }



  Future<void> insertToDatabase({
    @required String? contactName,
  })async {
    int id = 0 ;
    if (contacts!.length == 0){
      id = 1 ;
    }else{
      id = contacts![contacts!.length - 1].id + 1;
    }

    if(id > 0 ){
      dao!.insertContact(Contact(id, contactName!, 1, 1)).then((value) {
        emit(InsertContactsToDatabaseState());
        getContactsFromDatabase();

      });
    }

  }

  Future<void> updateContactDatabase({
    @required int? isId,
    @required String? contactName,
  })async {
    dao!.updateContact(Contact(isId!, contactName!, 1,1)).then((value) {
      emit(UpdateContactsToDatabaseState());
      getContactsFromDatabase();

    });
  }

  void deleteContactFromDatabase({
    @required int? id,
  }){
    dao!.deleteContact(id!).then((value)  {
      emit(DeleteContactsFromDatabaseState());
      getContactsFromDatabase();
    });
  }

  int getContactId({
    @required String? contactName,
  }){
    for(int i = 0 ; i <contacts!.length;i++){
      if(contacts![i].name == contactName){
        return contacts![i].id;
      }
    }
    return 0;
  }

  String getContactName({
    @required int? contactId,
  }){
    for(int i = 0 ; i <contacts!.length;i++){
      if(contacts![i].id == contactId){
        return contacts![i].name;
      }
    }
    return 'error';
  }

  void choseContact({
    @required Contact? contact,
  }){
    print('ooooooooooooooooooooooooooooooooo $contact');
    chosenContact = contact;
    emit(ChoseContactFromChooseContactPageState());
  }




}