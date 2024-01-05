import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkmate/class/todos.dart';
import 'package:checkmate/components/tile.dart';
import 'package:checkmate/providers/providers.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todos> todos = Provider.of<Providers>(context, listen: true).todos;

    void onTileTapped(id) {
      Provider.of<Providers>(context, listen: false).toggleTaskCompletion(id);
    }

    void onDismissed(id) {
      Provider.of<Providers>(context, listen: false).deleteTask(id);
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All your todo(s)",
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text(
            "Slide to left or right to delete task",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (contexisCompletet, index) {
                  return Column(
                    children: [
                      tile(todos[index].id, todos[index].task,
                          todos[index].isComplete, onTileTapped, onDismissed),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
