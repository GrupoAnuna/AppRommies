import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<Map<String, dynamic>> tasks = [
    {"title": "Limpiar cocina", "assigned": "Omar", "done": false},
    {"title": "Limpiar arenero", "assigned": "Daniel", "done": false},
    {"title": "Limpiar Baño", "assigned": "Omar", "done": false},
    {"title": "Desempolvar los muebles", "assigned": "Omar", "done": false},
    {"title": "Limpiar ventanas cocina", "assigned": "Omar", "done": false},
    {"title": "Limpiar TV", "assigned": "Saul", "done": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tareas",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {

            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: tasks[index]["done"],
            onChanged: (value) {
              setState(() {
                tasks[index]["done"] = value!;
              });
            },
            title: Text(tasks[index]["title"]),
            subtitle: Text(
              "Asignado a: ${tasks[index]["assigned"]}",
              style: TextStyle(color: Colors.green.shade400),
            ),
            activeColor: Colors.green,
          );
        },
      ),
    );
  }
}
