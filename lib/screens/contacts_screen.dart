
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/contact_list.dart';
import '../view_model/contact_list_view_model.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  _ContactListPageState createState() => _ContactListPageState();
}
class _ContactListPageState extends State<ContactListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ContactListViewModel>(context, listen: false).fetchData("");
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ContactListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text("Contact List with MVVM Pattern")
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.fetchData(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),
                ),
              ),
              Expanded(
                  child: ContactList(contacts: vm.contacts, scrollController: vm.scrollController,))//we will create this further down
            ])
        )
    );
  }
}