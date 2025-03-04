import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool _isPending = true; // true = Pending, false = Completed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPending = true;
                    });
                  },
                  child: Text(
                    "Pending",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isPending ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPending = false;
                    });
                  },
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: !_isPending ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children:
                    _isPending
                        ? [
                          TaskCard(
                            title: "Design Homepage",
                            deadline: "25 Feb",
                            priority: "High",
                          ),
                          TaskCard(
                            title: "Fix login bug",
                            deadline: "26 Feb",
                            priority: "Medium",
                          ),
                          TaskCard(
                            title: "Update database",
                            deadline: "27 Feb",
                            priority: "Low",
                          ),
                        ]
                        : [
                          TaskCard(
                            title: "Setup project",
                            deadline: "10 Jan",
                            priority: "Completed",
                          ),
                          TaskCard(
                            title: "Create UI wireframe",
                            deadline: "15 Jan",
                            priority: "Completed",
                          ),
                        ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String priority;

  const TaskCard({
    super.key,
    required this.title,
    required this.deadline,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.black54),
              SizedBox(width: 4),
              Text(deadline, style: TextStyle(color: Colors.black54)),
              Spacer(),
              Text(
                priority,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      priority == "High"
                          ? Colors.red
                          : priority == "Medium"
                          ? Colors.orange
                          : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
