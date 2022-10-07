// Service to simulate fetching

import '../models/contact.dart';

class ContactListService {

  static List<Contact> queue = <Contact>[];

  static Future<void> insert(Contact c) async {
    queue.add(c);
  }

  Future<List<Contact>> fetch() async {
    return queue;
  }
}