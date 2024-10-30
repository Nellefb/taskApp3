import 'package:flutter/material.dart';

class TaskGroupCreatePage extends StatefulWidget {
  const TaskGroupCreatePage({super.key});

  @override
  State<TaskGroupCreatePage> createState() => _TaskGroupCreatePageState();
}

class _TaskGroupCreatePageState extends State<TaskGroupCreatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task Group'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              Text('Select Color',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              // Color Picker
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          await _submitForm();
        },
        label: const Text('Add Task Group'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _submitForm() async {}
}
