import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Corregidor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamScreen(),
    );
  }
}

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final Map<String, List<String>> examAnswers = {
    'Diarias 2': [
      'c',
      'a',
      'd',
      'b',
      'c',
      'c',
      'c',
      'c',
      'b',
      'd',
      'd',
      'b',
      'b',
      'c',
      'a',
      'c',
      'b',
      'a',
      'd',
      'b',
      'c',
      'c',
      'a',
      'd',
      'c',
      'b',
      'b',
      'c',
      'a',
      'a',
      'd',
      'b',
      'b',
      'a',
      'c',
      'a',
      'c',
      'd',
      'b',
      'd',
      'a',
      'b',
      'd',
      'a',
      'c',
      'd',
      'd',
      'a',
      'b',
      'd',
      'a',
      'a',
      'a',
      'a',
      'b',
      'b',
      'c',
      'c',
      'b',
      'a',
      'd',
      'a',
      'a',
      'd',
      'c',
      'c',
      'd',
      'b',
      'a',
      'd',
    ],
    'Diarias 3': [
      'a',
      'a',
      'b',
      'c',
      'a',
      'b',
      'c',
      'a',
      'a',
      'd',
      'd',
      'c',
      'b',
      'c',
      'a',
      'c',
      'd',
      'b',
      'c',
      'a',
      'c',
      'd',
      'b',
      'c',
      'c',
      'c',
      'd',
      'c',
      'b',
      'c',
      'a',
      'c',
      'c',
      'c',
      'b',
      'd',
      'b',
      'c',
      'c',
      'b',
      'c',
      'b',
      'c',
      'a',
      'b',
      'b',
      'c',
      'b',
      'b',
      'd',
      'd',
      'a',
      'a',
      'c',
      'b',
      'a',
      'c',
      'd',
      'c',
      'd',
      'c',
      'b',
      'd',
      'b',
      'c',
      'd',
      'b',
      'a',
      'd',
      'b',
    ],
    'Diarias 4': [
      'a',
      'a',
      'd',
      'a',
      'b',
      'a',
      'b',
      'c',
      'c',
      'c',
      'a',
      'a',
      'b',
      'a',
      'd',
      'a',
      'c',
      'd',
      'd',
      'b',
      'd',
      'c',
      'd',
      'c',
      'd',
      'b',
      'c',
      'd',
      'a',
      'b',
      'a',
      'a',
      'b',
      'd',
      'd',
      'd',
      'b',
      'c',
      'd',
      'a',
      'd',
      'a',
      'a',
      'a',
      'd',
      'd',
      'b',
      'b',
      'c',
      'b',
      'b',
      'c',
      'c',
      'd',
      'd',
      'a',
      'd',
      'a',
      'b',
      'b',
      'd',
      'a',
      'd',
      'a',
      'd',
      'd',
      'c',
      'c',
      'c',
      'b',
    ]
  };

  String? selectedExam = 'Diarias 2';
  List<String> userAnswers = List.filled(70, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corregir Examen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedExam,
              items: examAnswers.keys.map((String examName) {
                return DropdownMenuItem<String>(
                  value: examName,
                  child: Text(examName),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedExam = newValue;
                  userAnswers = List.filled(70, '');
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 70,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pregunta ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: ['a', 'b', 'c', 'd'].map((String answer) {
                              return Expanded(
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: answer,
                                      groupValue: userAnswers[index],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          userAnswers[index] = newValue!;
                                        });
                                      },
                                    ),
                                    Text(
                                      answer.toUpperCase(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _checkAnswers();
                },
                child: Text('Corregir Examen'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkAnswers() {
    if (selectedExam != null) {
      List<String> correctAnswers = examAnswers[selectedExam!]!;
      int correctCount = 0;
      List<int> incorrectQuestions = [];

      for (int i = 0; i < userAnswers.length; i++) {
        if (userAnswers[i] == correctAnswers[i]) {
          correctCount++;
        } else {
          incorrectQuestions.add(i + 1);
        }
      }

      double percentage = (correctCount / 70) * 100;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Resultados'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Has acertado $correctCount de 70 preguntas.'),
                Text(
                    'Porcentaje de aciertos: ${percentage.toStringAsFixed(2)}%'),
                if (incorrectQuestions.isNotEmpty)
                  Text(
                      'Respuestas incorrectas: ${incorrectQuestions.join(', ')}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
