import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Student> data = [
    Student(
      name: "Worachot Thonglert",
      id: "653450299-0",
      image: "images/worachot.jpg",
      gender: "male",
    ),
    Student(
      name: "Thanachok Suwan",
      id: "653450287-7",
      image: "images/Thanachok.jpeg",
      gender: "male",
    ),
    Student(
      name: "Juntima Promwang",
      id: "	653450280-1",
      image: "images/juntima.jpg",
      gender: "female",
    ),
      Student(
      name: "Ramin Kaiyabut",
      id: "653450297-4",
      image: "images/ramin.jpg",
      gender: "female",
    ),
      Student(
      name: "Pathipat Mattra",
      id: "653450293-2",
      image: "images/pathipat.jpg",
      gender: "male",
    ),
      Student(
      name: "Panuwat Thammabut",
      id: "653450099-8",
      image: "images/Panuwat.jpg",
      gender: "male",
    ),
      Student(
      name: "Onpreeya Junthacot",
      id: "653450107-5",
      image: "images/onpreeya.jpg",
      gender: "female",
    ),
      Student(
      name: "Natnicha Prompik",
      id: "653450284-3",
      image: "images/Natnicha Prompik.JPG",
      gender: "female",
    ),
      Student(
      name: "Worachit Thonglert",
      id: "	653450298-2",
      image: "images/worachit.jpg",
      gender: "male",
    ),
      Student(
      name: "Metagorn Singkhan",
      id: "653450100-9",
      image: "images/Metagorn.jpg",
      gender: "male",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My CIS"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in data)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailPage(student: item),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: item.gender == "male"
                        ? const Color.fromARGB(255, 45, 153, 241)
                        : const Color.fromARGB(255, 246, 131, 17),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: item.id,
                        child: ClipOval(
                          child: Image.asset(
                            item.image ?? "images/kkulogo.png",
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item.id,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Detail"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: student.id,
              child: ClipOval(
                child: Image.asset(
                  student.image ?? "images/kkulogo.png",
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              student.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "ID: ${student.id}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "This is studen detail. "
                "Welcome to see more detail.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  String name;
  String id;
  String? image; // Nullable
  String gender;
  Student({
    required this.name,
    required this.id,
    this.image = "images/kkulogo.png",
    required this.gender,
  });
}
