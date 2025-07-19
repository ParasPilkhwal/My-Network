import 'package:flutter/material.dart';
import 'person.dart';
import 'person_form_screen.dart';
import 'person_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Person> _people = [
    Person(
      name: 'Rohit Pandey',
      relation: 'Friend',
      howWeMet: 'school',
      description: 'Hapsy dost',
      dob: '21/05/1997',
      instagram: 'https://www.instagram.com/noobiekode/',
    ),
    Person(
      name: 'Himanshu Dubey',
      relation: 'Friend',
      howWeMet: 'Same hometown',
      description: 'tech enthusiast',
      dob: '14 May 2025',
      instagram: 'https://www.instagram.com/writer_on_the_hillock/',
    ),
  ];

  void _addPerson(Person person) {
    setState(() {
      _people.add(person);
    });
  }

  void _updatePerson(int index, Person person) {
    setState(() {
      _people[index] = person;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Networks'),
      ),
      body: ListView.builder(
        itemCount: _people.length,
        itemBuilder: (context, index) {
          final person = _people[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(person.name),
              subtitle: Text('${person.relation} - ${person.howWeMet}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonDetailScreen(
                      person: person,
                      index: index,
                      onUpdate: _updatePerson,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonFormScreen(onSave: _addPerson),
            ),
          );
        },
        tooltip: 'Add New Person',
        child: const Icon(Icons.add),
      ),
    );
  }
}
