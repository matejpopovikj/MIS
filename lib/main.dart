import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    home: const Subjects(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 200, 15, 100),
        title: const Text("201194"),

      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Subjects',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<String> subject = ["MIS","MIS","TP","AS","VNP","ADIS"];
  void addSubject(){
      showDialog(context: context, builder: (BuildContext context){
        String sub = "";
        return AlertDialog(
          title: const Text("Add new subject"),
          content: TextField(
            onChanged: (value){
              sub = value;
            },
          ),
          actions: [
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(sub.isNotEmpty){
                      subject.add(sub);
                    }
                    Navigator.pop(context);
                  });
                },
                child: const Text("Add")
            )
          ],
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Subjects'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ) ,
      body: ListView.builder(
          itemCount: subject.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(subject[index],style:const TextStyle(fontSize: 18),),
                trailing: IconButton(icon: const Icon(Icons.delete_rounded), onPressed: () {
                  setState(() {
                    subject.removeAt(index);
                  });
                },
                ),
              ),
            );
    },
    ),
      floatingActionButton: FloatingActionButton(onPressed: addSubject,
        backgroundColor: Colors.blue,
        child:const Icon(Icons.add),
      ),
    );
  }
}

