import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_bloc/data/models/todo_sq_lite.dart';
import 'package:todo_bloc/domain/models/todo_model.dart';
import 'package:todo_bloc/domain/repository/todo_repository.dart';

class SQLiteTodoRepository implements TodoRepository {
  Database? _database;

  Future<Database> get _db async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, isCompleted INTEGER)',
        );
      },
    );
  }

  @override
  Future<List<Todo>> getTodos() async {
    final List<Map<String, dynamic>> maps = await (await _db).query('todos');
    return List.generate(maps.length, (i) {
      return SQLiteTodo.fromMap(maps[i]).toDomain();
    });
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    final sqliteTodo = SQLiteTodo.fromDomain(newTodo);
    await (await _db).insert(
      'todos',
      sqliteTodo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final sqliteTodo = SQLiteTodo.fromDomain(todo);
    await (await _db).update(
      'todos',
      sqliteTodo.toMap(),
      where: 'id = ?',
      whereArgs: [sqliteTodo.id],
    );
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await (await _db).delete(
      'todos',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
