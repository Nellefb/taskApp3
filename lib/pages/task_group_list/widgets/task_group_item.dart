import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';

class TaskGroupItem extends StatelessWidget {
  const TaskGroupItem({
    super.key,
    required this.taskGroupWithCount,
  });

  final TaskGroupWithCounts taskGroupWithCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskGroupWithCount.taskGroup.name,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      subtitle: Text(
          '${taskGroupWithCount.completedTasks}/${taskGroupWithCount.totalTasks} tasks'),
      trailing: CircularProgressIndicator(
        strokeWidth: 5,
        valueColor:
            AlwaysStoppedAnimation(Color(taskGroupWithCount.taskGroup.color)),
        backgroundColor: Colors.grey,
        value: taskGroupWithCount.totalTasks > 0
            ? (taskGroupWithCount.completedTasks /
                taskGroupWithCount.totalTasks)
            : 0,
      ),
      onTap: () {},
    );
  }
}
