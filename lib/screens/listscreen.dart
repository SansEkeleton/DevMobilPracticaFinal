
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Todo {
  final String name;
  final String imageUrl;

  Todo({
    required this.name,
    required this.imageUrl,
  });
}

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        todo.imageUrl,
        width: 50,
        height: 50,
      ),
      title: Text(todo.name),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final void Function(int) onRemove;

  const TodoList({required this.todos, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(todos[index].name),
          onDismissed: (direction) {
            onRemove(index);
          },
          child: TodoItem(todo: todos[index]),
        );
      },
    );
  }
}

class AddTodo extends StatefulWidget {
  final void Function(String, String) onAdd;

  const AddTodo({required this.onAdd});

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void _submitTodo() {
    final name = _nameController.text;
    final imageUrl = _imageUrlController.text;
    if (name.isEmpty || imageUrl.isEmpty) {
      return;
    }
    widget.onAdd(name, imageUrl);
    _nameController.text = '';
    _imageUrlController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nombre de Tarea',
            ),
          ),
          TextField(
            controller: _imageUrlController,
            decoration: InputDecoration(
              labelText: 'Image URL',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: _submitTodo,
            child: Text('Crear Tarea'),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Todo> todos = [ 

    Todo (name: "Chimi", imageUrl: "https://www.cocinadominicana.com/wp-content/uploads/2011/01/dominican-chimi-recipe-CG10101.jpg"),
    Todo (name: "papas", imageUrl: "https://www.cocinacaserayfacil.net/wp-content/uploads/2014/12/patatas-fritas-crujientes.jpg"),
    Todo (name: "Coca-Cola", imageUrl: "http://cdn.shopify.com/s/files/1/0279/8151/2798/products/7441003500907-1-scaled_1200x1200.jpg?v=1639607192"),
    Todo (name: "Hot-Dog", imageUrl: "https://www.vvsupremo.com/wp-content/uploads/2016/02/900X570_Mexican-Style-Hot-Dogs.jpg"),
    
    

   ];

  void _addTodo(String name, String imageUrl) {
    setState(() {
      todos.add(Todo(
        name: name,
        imageUrl: imageUrl,
      ));
    });
  }

  void _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('To Do App'),
        ),
        body: Column(
          children: [
            Expanded(
              child: TodoList(
                todos: todos,
                onRemove: _removeTodo,
              ),
            ),
            AddTodo(
              onAdd: _addTodo,
            ),
          ],
        ),
      ),
    );
  }
}