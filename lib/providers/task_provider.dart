import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskProvider with ChangeNotifier {
  final SupabaseRepository _repo = SupabaseRepository();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> listTasksByGroup(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _repo.listTasksByGroup(groupId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createTask(Task task) async {
    try {
      await _repo.createTask(task);
      _tasks.add(task);

      //para notificar a main e refazer a tela
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(String id) async {
    try{
      await _repo.deleteTask(id);

      //o q retorna true ele remove
      _tasks.removeWhere((task) => task.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
