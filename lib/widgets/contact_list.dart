
import 'package:flutter/material.dart';

import '../view_model/contact_view_model.dart';

class ContactList extends StatelessWidget {

  final List<ContactViewModel> contacts;

  final ScrollController scrollController;

  const ContactList({super.key, required this.contacts, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contacts.length,
        controller: scrollController,
        itemBuilder: (context, index) {

          final item = contacts[index];

          return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(item.firstname[0] + item.lastname[0]),
                ),
                title: Text("${item.firstname} ${item.lastname}"),
                subtitle: Text(item.tel),
              ));
        });
  }
}