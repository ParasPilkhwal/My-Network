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
      howWeMet: 'CountryWide Public School, Garur',
      description: 'Rohit is a childhood friend from my hometown. We went to the same school and shared many memorable moments growing up. He is a talented software engineer currently working at Google.',
      dob: '21 May 1997',
      gender: 'Boy',
      phoneNumbers: ['123-456-7890', '987-654-3210'],
      address: '123 Main St, Anytown, CA 91234',
      occupation: 'Software Engineer',
      company: 'Google',
      hobbies: 'Reading, Hiking',
      gmail: 'rohit.pandey@example.com',
      instagram: 'https://www.instagram.com/noobiekode/',
      twitter: 'https://twitter.com/noobiekode',
      linkedin: 'https://www.linkedin.com/in/noobiekode/',
      github: 'https://github.com/noobiekode',
    ),
    Person(
      name: 'Himanshu Dubey',
      relation: 'Friend',
      howWeMet: 'Same hometown',
      description: 'Himanshu is a close friend from my hometown who shares my passion for technology. He is a data scientist working at Facebook and is always exploring new tech trends and gadgets.',
      dob: '14 May 2025',
      gender: 'Boy',
      phoneNumbers: ['555-123-4567'],
      address: '456 Oak Ave, Somewhere, NY 54321',
      occupation: 'Data Scientist',
      company: 'Facebook',
      hobbies: 'Gaming, Photography',
      gmail: 'himanshu.dubey@example.com',
      instagram: 'https://www.instagram.com/writer_on_the_hillock/',
      twitter: 'https://twitter.com/writer_on_the_hillock',
      linkedin: 'https://www.linkedin.com/in/writer_on_the_hillock/',
      github: 'https://github.com/writer_on_the_hillock',
    ),
     Person(
            name: 'Chandra Shekhar Pandey',
            relation: 'Friend',
            howWeMet: "Rohit's Brother",
            description: 'Chandra Shekhar is Rohit's brother and a friend from my hometown. He is known as the 'King Maker of Darshani' in our local community due to his entrepreneurial spirit and connections. He enjoys traveling and cooking.',
            dob: '14 Apr 2001',
            gender: 'Boy',
            phoneNumbers: ['111-222-3333', '444-555-6666', '777-888-9999'],
            address: '789 Pine Ln, Anywhere, TX 78901',
            occupation: 'Entrepreneur',
            company: 'Self-employed',
            hobbies: 'Traveling, Cooking',
            gmail: 'chandra.shekhar.pandey@example.com',
            instagram: 'https://www.instagram.com/sheakherpandey10/',
            twitter: 'https://twitter.com/sheakherpandey10',
            linkedin: 'https://www.linkedin.com/in/sheakherpandey10/',
            github: 'https://github.com/sheakherpandey10',
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

  void _deletePerson(int index) {
    setState(() {
      _people.removeAt(index);
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
            color: Colors.green[900], // Set card background color to green
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(person.name, style: TextStyle(color: Colors.white)),
              subtitle: Text('${person.relation} - ${person.howWeMet}', style: TextStyle(color: Colors.white70)),
              onTap: () async {
                final updatedPerson = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonDetailScreen(
                      person: person,
                      index: index,
                      onUpdate: _updatePerson,
                      onDelete: _deletePerson,
                    ),
                  ),
                );
                if (updatedPerson != null && updatedPerson is Person) {
                  _updatePerson(index, updatedPerson);
                }
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
