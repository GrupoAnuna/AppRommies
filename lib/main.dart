import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const EventsPage(),
    const TasksPage(),
    const ExpensesPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green.shade200,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Eventos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tareas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: "Gastos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  Widget _buildEventItem(String imageUrl, String title, String time) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title),
      subtitle: Text(time, style: const TextStyle(color: Colors.green)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Events", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Today",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          _buildEventItem(
            "https://images.unsplash.com/photo-1528712306091-ed0763094c98",
            "Cena con amigos",
            "6:00 PM",
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Tomorrow",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          _buildEventItem(
            "https://images.unsplash.com/photo-1524985069026-dd778a71c7b4",
            "Noche de películas",
            "7:30 PM",
          ),
          _buildEventItem(
            "https://images.unsplash.com/photo-1524985069026-dd778a71c7b4",
            "Noche de películas",
            "7:30 PM",
          ),
          _buildEventItem(
            "https://images.unsplash.com/photo-1524985069026-dd778a71c7b4",
            "Noche de películas",
            "7:30 PM",
          ),
          _buildEventItem(
            "https://images.unsplash.com/photo-1524985069026-dd778a71c7b4",
            "Noche de películas",
            "7:30 PM",
          ),
        ],
      ),
    );
  }
}

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
              // Acción para agregar nueva tarea
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

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  Widget _buildExpenseItem(String title, String paidBy, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Pagado por: $paidBy",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Text(
            "\$$amount",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Gastos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildExpenseItem("Electricidad", "Omar", "120.00"),
            _buildExpenseItem("Agua", "Omar", "85.50"),
            _buildExpenseItem("Gas", "Saul", "45.75"),
            _buildExpenseItem("Wifi", "Omar", "1500.00"),
            _buildExpenseItem("Spotify", "Dani", "60.00"),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Página de Chat")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Página de Perfil")),
    );
  }
}
