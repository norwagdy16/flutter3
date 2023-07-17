import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/todos_model.dart';
import 'package:flutter_application_2/services/todos_service.dart';
import 'package:flutter_application_2/views/todos/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: BlocConsumer<TodosCubit, TodosState>(
        builder: (context, State) {
          if (State is TodosLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (State is TodosSuccess) {
            return ListView.builder(
              itemCount: context.watch<TodosCubit>().todos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(context.watch<TodosCubit>().todos[index].id.toString()),
                  title: Text(context.watch<TodosCubit>().todos[index].title ?? "--"),
                  subtitle: Text(context.watch<TodosCubit>().todos[index].completed.toString()),
                  trailing: Icon(Icons.adjust),
                ); 
            },
            );
          }else {
            return Center(
              child: Text("there is error in this screen"),
            );
          }
        },
        listener: (context, State) {},
      ),
    );
  }
}

//     return isLoading? Center( child:CircularProgressIndicator(),
//     )
//       :ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: Text(todos[index].id.toString()),
//             title: Text(todos[index].title ?? "--"),
//             subtitle: Text(todos[index].completed.toString()),
//             trailing: Icon(Icons.adjust),
//           );
//         });
//   }
// }
