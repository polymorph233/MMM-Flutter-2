import '../models/contact.dart';

class ContactViewModel {
  final Contact contact;

  ContactViewModel({required this.contact});

  String get firstname {
    return contact.firstname;
  }

  String get lastname {
    return contact.lastname;
  }

  String get tel {
    return contact.tel;
  }
}