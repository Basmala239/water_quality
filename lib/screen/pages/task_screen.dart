import 'package:flutter/material.dart';

import '../../model/check_list_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<CheckListModel> checklistItems = [
    CheckListModel(title: 'Task 1', description: 'Description 1'),
    CheckListModel(title: 'Task 2', description: 'Description 2'),
    CheckListModel(title: 'Task 3', description: 'Description 3'),
    CheckListModel(title: 'Task 4', description: 'Description 4'),
    CheckListModel(title: 'Task 5', description: 'Description 5'),
  ];

  List<CheckListModel> uncheckedItems = [];

  bool showUncheckedItems = false;

  @override
  Widget build(BuildContext context) {
    int completedCount = checklistItems.where((item) => item.isChecked).length;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .7,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 16),
                child: Text(
                  'My checklist',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: showUncheckedItems
                      ? uncheckedItems.length
                      : checklistItems.length,
                  itemBuilder: (context, index) {
                    final item = showUncheckedItems
                        ? uncheckedItems[index]
                        : checklistItems[index];
                    return ListTile(
                      // onTap: () => editTitleAndDescription(index),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.expand_more),
                          SizedBox(width: 8),
                          Icon(Icons.expand_less),
                          SizedBox(width: 8),
                          Icon(Icons.density_medium),
                        ],
                      ),
                      title: GestureDetector(
                          onTap: () => editTitleAndDescription(index),
                          child: Text(item.title)),
                      subtitle: GestureDetector(
                          onTap: () => editTitleAndDescription(index),
                          child: Text(item.description)),
                      leading: Checkbox(
                        value: item.isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            item.isChecked = value ?? false;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showUncheckedItems = !showUncheckedItems;
                          if (showUncheckedItems) {
                            uncheckedItems = checklistItems
                                .where((item) => !item.isChecked)
                                .toList();
                          }
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                    Text(
                      'Completed $completedCount of ${checklistItems.length}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          checklistItems.add(CheckListModel(
                              title: 'New Task',
                              description: 'New Task Description'));
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                    const Text(
                      'Add task',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  editTitleAndDescription(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = checklistItems[index].title;
        String newDescription = checklistItems[index].description;
        return AlertDialog(
          title: const Text('Edit Title and Description'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  newDescription = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  checklistItems[index].title = newTitle;
                  checklistItems[index].description = newDescription;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
