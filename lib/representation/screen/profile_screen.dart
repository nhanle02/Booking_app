import 'package:booking_app_source/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_source/components/text_box.dart';
import 'package:booking_app_source/representation/widgets/app_bar_container.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late String _fullName;
  late String _phoneNumber;
  late String _bio;

  @override
  void initState() {
    super.initState();
    _fullName = AuThen.currentUser?['fullName'] ?? '';
    _phoneNumber = AuThen.currentUser?['phoneNumber'] ?? '';
    _bio = AuThen.currentUser?['bio'] ?? '';
  }

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.black),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                // Cập nhật giá trị mới cho các biến và AuThen
                if (field == 'Full name') {
                  _fullName = newValue;
                  AuThen.currentUser?['fullName'] = newValue;
                } else if (field == 'Phone number') {
                  _phoneNumber = newValue;
                  AuThen.currentUser?['phoneNumber'] = newValue;
                } else if (field == 'Bio') {
                  _bio = newValue;
                  AuThen.currentUser?['bio'] = newValue;
                }
              });
              Navigator.of(context).pop(newValue);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: const Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'P R O F I L E',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.person,
              size: 72,
            ),
            const SizedBox(height: 10),
            Text(
              AuThen.currentUser?['username'] ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                "My Details",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            MyTextBox(
              text: _fullName,
              sectionName: 'Full name',
              onPressed: () => editField('Full name'),
            ),
            MyTextBox(
              text: _phoneNumber,
              sectionName: 'Phone number',
              onPressed: () => editField('Phone number'),
            ),
            MyTextBox(
              text: _bio,
              sectionName: 'Bio',
              onPressed: () => editField('Bio'),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                "My Post",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            const MyTextBox(
              text: 'You: Need to find a hotel with sea view',
              sectionName: 'Post on Date: 06/08/2023',
            ),
          ],
        ),
      ),
    );
  }
}
