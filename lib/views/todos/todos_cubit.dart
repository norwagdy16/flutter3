import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/models/todos_model.dart';
import 'package:flutter_application_2/services/todos_service.dart';
import 'package:meta/meta.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()) {
    getTodosData();
  }

  List<Welcome> todos = [];
  bool isLoading = true;

  getTodosData() async {
    emit(TodosLoading());
    try {
      todos = await TodosServices().getTodosData();
      isLoading = false;
      emit(TodosSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodosError());
    }
  }
}
