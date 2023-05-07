import 'package:ielts_trainer/backend/models/pmaterial_model.dart';

class PMaterialDummy {
  static List<PMaterial> listeningpmaterialList = <PMaterial>[
    PMaterial(
        completed: 10,
        title: "Read ALoud",
        total: 200,
        done: 102,
        isAi: true,
        category: 0),
    PMaterial(
        completed: 100,
        title: "Repeat Sentence",
        total: 230,
        done: 12,
        isAi: true,
        category: 0),
    PMaterial(
        completed: 80,
        title: "Describe Image",
        total: 120,
        done: 25,
        isAi: true,
        category: 0),
  ];
  static List<PMaterial> readingpmaterialList = <PMaterial>[
    PMaterial(
        completed: 50,
        title: "Summarize Written Text",
        total: 200,
        done: 10,
        isAi: true,
        category: 1),
    PMaterial(
        completed: 10,
        title: "Write Essay",
        total: 200,
        done: 102,
        isAi: true,
        category: 1),
  ];
  static List<PMaterial> speakpmaterialList = <PMaterial>[
    PMaterial(
        completed: 70,
        title: "Reorder Paragraph",
        total: 200,
        done: 150,
        isAi: false,
        category: 2),
  ];

  static List<PMaterial> writingpmaterialList = <PMaterial>[
    PMaterial(
        completed: 70,
        title: "Reorder Paragraph",
        total: 200,
        done: 150,
        isAi: false,
        category: 3),
  ];
}
