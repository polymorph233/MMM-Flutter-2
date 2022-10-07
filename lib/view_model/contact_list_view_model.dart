// View Model

import 'package:flutter/material.dart';

import '../services/contact_list_service.dart';
import 'contact_view_model.dart';

class ContactListViewModel extends ChangeNotifier {
  List<ContactViewModel> contacts = <ContactViewModel>[];

  ScrollController scrollController = ScrollController();

  Future<void> fetchData(String keyword) async {
    final results = await ContactListService().fetch();
    contacts = results.map((item) => ContactViewModel(contact: item)).toList();
    notifyListeners();
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }
}

// Idea of automatic scrolling was taken from:
// https://smarx.com/posts/2020/08/automatic-scroll-to-bottom-in-flutter/