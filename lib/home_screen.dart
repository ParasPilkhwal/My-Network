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
      relation: 'Friends',
      howWeMet: 'CountryWide Public School, Garur',
      description: "Rohit is a childhood friend from my hometown. We went to the same school and shared many memorable moments growing up. He is a talented software engineer currently working at Google.",
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
      relation: 'Friends',
      howWeMet: 'Same hometown',
      description: "Himanshu is a close friend from my hometown who shares my passion for technology. He is a data scientist working at Facebook and is always exploring new tech trends and gadgets.",
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
            relation: 'Friends',
            howWeMet: "Rohit's Brother",
            description: "Chandra Shekhar is Rohit's brother and a friend from my hometown. He is known as the 'King Maker of Darshani' in our local community due to his entrepreneurial spirit and connections. He enjoys traveling and cooking.",
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
          Person(
      name: 'Suman Devi',
      relation: 'family member',
      howWeMet: 'Born into family',
      description: "Suman is my mother, a loving and supportive figure. She is a homemaker with a knack for traditional Indian cooking.",
      dob: '10 Aug 1965',
      gender: 'Girl',
      phoneNumbers: ['999-888-7777'],
      address: 'Village Road, Near Temple, Kausani, Uttarakhand',
      occupation: 'Homemaker',
      company: '',
      hobbies: 'Cooking, Gardening',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
    Person(
      name: 'Anil Singh Rawat',
      relation: 'family member',
      howWeMet: 'Born into family',
      description: "Anil is my father, a retired government official. He enjoys reading and spending time in nature.",
      dob: '05 Apr 1960',
      gender: 'Boy',
      phoneNumbers: ['777-666-5555'],
      address: 'Village Road, Near Temple, Kausani, Uttarakhand',
      occupation: 'Retired',
      company: '',
      hobbies: 'Reading, Nature walks',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
     Person(
      name: 'Priya Sharma',
      relation: 'Batchmates',
      howWeMet: 'Uttarakhand Technical University',
      description: "Priya was my batchmate in college. She was an excellent student and is now a successful software engineer.",
      dob: '12 Jul 1998',
      gender: 'Girl',
      phoneNumbers: ['111-222-3333'],
      address: 'Dehradun, Uttarakhand',
      occupation: 'Software Engineer',
      company: 'Infosys',
      hobbies: 'Coding, Painting',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
    Person(
      name: 'Rahul Verma',
      relation: 'Batchmates',
      howWeMet: 'Uttarakhand Technical University',
      description: "Rahul was also my batchmate. He was known for his cricket skills and is now working in a tech company in Noida.",
      dob: '18 Sep 1997',
      gender: 'Boy',
      phoneNumbers: ['444-555-6666'],
      address: 'Noida, Uttar Pradesh',
      occupation: 'System Analyst',
      company: 'TCS',
      hobbies: 'Cricket, Traveling',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
    Person(
      name: 'Rajesh Gupta',
      relation: 'Colleague',
      howWeMet: 'Previous Job at Wipro',
      description: "Rajesh was a senior colleague at my previous job. He was a great mentor and helped me a lot during my initial days.",
      dob: '25 Jan 1985',
      gender: 'Boy',
      phoneNumbers: ['222-333-4444'],
      address: 'Bangalore, Karnataka',
      occupation: 'Project Manager',
      company: 'Wipro',
      hobbies: 'Mentoring, Photography',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
     Person(
      name: 'Deepa Negi',
      relation: 'Colleague',
      howWeMet: 'Current Job at Infosys',
      description: "Deepa is my current colleague. We work on the same team and she is very efficient and dedicated.",
      dob: '30 Mar 1990',
      gender: 'Girl',
      phoneNumbers: ['555-666-7777'],
      address: 'Pune, Maharashtra',
      occupation: 'Software Developer',
      company: 'Infosys',
      hobbies: 'Reading, Trekking',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
    Person(
      name: 'Manoj Joshi',
      relation: 'neighbour',
      howWeMet: 'Live in the same colony',
      description: "Manoj is my neighbour. He is a retired teacher and is very active in community events.",
      dob: '01 Feb 1955',
      gender: 'Boy',
      phoneNumbers: ['888-999-0000'],
      address: 'Nainital, Uttarakhand',
      occupation: 'Retired Teacher',
      company: '',
      hobbies: 'Social work, Reading',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
    Person(
      name: 'Shanti Devi',
      relation: 'neighbour',
      howWeMet: 'Live in the same colony',
      description: "Shanti Devi is also my neighbour. She is a homemaker and is known for her friendly nature.",
      dob: '20 Jun 1962',
      gender: 'Girl',
      phoneNumbers: ['333-444-5555'],
      address: 'Nainital, Uttarakhand',
      occupation: 'Homemaker',
      company: '',
      hobbies: 'Knitting, Gardening',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
       github: '',
    ),
    Person(
      name: 'Unknown Person',
      relation: 'others',
      howWeMet: 'Met at a conference',
      description: "Someone I met at a recent conference. Did not get many details.",
      dob: '',
      gender: 'Other',
      phoneNumbers: [''],
      address: '',
      occupation: '',
      company: '',
      hobbies: '',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
    ),
     Person(
      name: 'Another Contact',
      relation: 'others',
      howWeMet: 'Through a mutual friend',
      description: "A contact I got through a friend, but haven't interacted much with yet.",
      dob: '',
      gender: 'Other',
      phoneNumbers: [''],
      address: '',
      occupation: '',
      company: '',
      hobbies: '',
      gmail: '',
      instagram: '',
      twitter: '',
      linkedin: '',
      github: '',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch<void>(
                context: context,
                delegate: PersonSearchDelegate(_people),
              );
            },
          ),
        ],
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

// Define the SearchDelegate
class PersonSearchDelegate extends SearchDelegate<void> {
  final List<Person> people;

  PersonSearchDelegate(this.people);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the search bar (e.g., clear query button)
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon (e.g., back button)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Display search results based on the query
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display search suggestions as the user types
    return _buildSearchResults(context);
  }

 @override
  String get searchFieldLabel => 'Search by Name / Description';

  Widget _buildSearchResults(BuildContext context) {
    final results = people.where((person) {
      // Implement your search filtering logic here
      // For example, filter by name or relation
      return person.name.toLowerCase().contains(query.toLowerCase()) ||
             (person.description != null && person.description!.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final person = results[index];
        return Card(
          color: Colors.green[900],
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(person.name, style: TextStyle(color: Colors.white)),
            subtitle: Text('${person.relation} - ${person.howWeMet}', style: TextStyle(color: Colors.white70)),
            onTap: () {
              // When a search result is tapped, navigate to the detail screen
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonDetailScreen(
                      person: person,
                      index: people.indexOf(person), // Find the index of the person in the original list
                      onUpdate: (index, updatedPerson) {},
                      onDelete: (index) {},
                    ),
                  ),
                );
                // Close the search bar after navigating
                 close(context, null);
            },
          ),
        );
      },
    );
  }
}
