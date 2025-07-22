import 'package:flutter/material.dart';
import 'person.dart';
import 'person_form_screen.dart';
import 'person_detail_screen.dart';

enum SortOrder {
  none,
  nameAscending,
  nameDescending,
  createdDateAscending,
  createdDateDescending,
}

enum SearchFilterCriteria {
  name,
  relation,
}

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
      createdDate: DateTime(2023, 10, 26, 10, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 15, 12, 30, 0),
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
      twitter: 'https://twitter.com/writer_on_the_hillock/',
      linkedin: 'https://www.linkedin.com/in/writer_on_the_hillock/',
      github: 'https://github.com/writer_on_the_hillock',
      createdDate: DateTime(2023, 10, 25, 11, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 14, 13, 0, 0),
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
            twitter: 'https://twitter.com/sheakherpandey10/',
            linkedin: 'https://www.linkedin.com/in/sheakherpandey10/',
            github: 'https://github.com/sheakherpandey10',
            createdDate: DateTime(2023, 10, 24, 12, 0, 0),
            lastModifiedDate: DateTime(2023, 11, 13, 14, 30, 0),
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
      createdDate: DateTime(2023, 10, 23, 13, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 12, 15, 0, 0),
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
      createdDate: DateTime(2023, 10, 22, 14, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 11, 16, 30, 0),
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
      createdDate: DateTime(2023, 10, 21, 15, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 10, 17, 0, 0),
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
      createdDate: DateTime(2023, 10, 20, 16, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 9, 18, 30, 0),
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
      createdDate: DateTime(2023, 10, 19, 17, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 8, 19, 0, 0),
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
      createdDate: DateTime(2023, 10, 18, 18, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 7, 20, 30, 0),
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
       createdDate: DateTime(2023, 10, 17, 19, 0, 0),
       lastModifiedDate: DateTime(2023, 11, 6, 21, 0, 0),
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
       createdDate: DateTime(2023, 10, 16, 20, 0, 0),
       lastModifiedDate: DateTime(2023, 11, 5, 22, 30, 0),
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
      createdDate: DateTime(2023, 10, 15, 21, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 4, 23, 0, 0),
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
      createdDate: DateTime(2023, 10, 14, 22, 0, 0),
      lastModifiedDate: DateTime(2023, 11, 3, 23, 59, 59),
    ),
  ];

  String? _selectedRelationFilter;
   SortOrder _sortOrder = SortOrder.none;

  void _addPerson(Person person) {
    setState(() {
      // When adding a new person, set both createdDate and lastModifiedDate to now
      _people.add(person.copyWith(
        createdDate: DateTime.now(),
        lastModifiedDate: DateTime.now(),
      ));
    });
  }

  void _updatePerson(int index, Person person) {
    setState(() {
      // Create a new Person object with updated details and original createdDate
      final updatedPerson = person.copyWith(
        createdDate: _people[index].createdDate, // Keep the original createdDate
        lastModifiedDate: DateTime.now(), // Update lastModifiedDate
      );
      _people[index] = updatedPerson;
    });
  }

  void _deletePerson(int index) {
    setState(() {
      _people.removeAt(index);
    });
  }

  List<Person> get _filteredPeople {
    List<Person> filteredList = _people.toList();
    if (_selectedRelationFilter != null) {
      filteredList = filteredList.where((person) => person.relation == _selectedRelationFilter).toList();
    }

    if (_sortOrder == SortOrder.nameAscending) {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    } else if (_sortOrder == SortOrder.nameDescending) {
      filteredList.sort((a, b) => b.name.compareTo(a.name));
    } else if (_sortOrder == SortOrder.createdDateAscending) {
       filteredList.sort((a, b) => a.createdDate.compareTo(b.createdDate));
    } else if (_sortOrder == SortOrder.createdDateDescending) {
       filteredList.sort((a, b) => b.createdDate.compareTo(a.createdDate));
    }

    return filteredList;
  }

   void _showSortOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sort By'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Name (A-Z)'),
                onTap: () {
                  setState(() {
                    _sortOrder = SortOrder.nameAscending;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Name (Z-A)'),
                onTap: () {
                  setState(() {
                    _sortOrder = SortOrder.nameDescending;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Created Date (Oldest First)'),
                onTap: () {
                  setState(() {
                    _sortOrder = SortOrder.createdDateAscending;
                  });
                  Navigator.of(context).pop();
                },
              ),
               ListTile(
                title: const Text('Created Date (Newest First)'),
                onTap: () {
                  setState(() {
                    _sortOrder = SortOrder.createdDateDescending;
                  });
                  Navigator.of(context).pop();
                },
              ),
               ListTile(
                title: const Text('None'),
                onTap: () {
                  setState(() {
                    _sortOrder = SortOrder.none;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getSortIcon() {
    if (_sortOrder == SortOrder.nameAscending) {
      return Icons.sort_by_alpha;
    } else if (_sortOrder == SortOrder.nameDescending) {
      return Icons.sort_by_alpha;
    } else if (_sortOrder == SortOrder.createdDateAscending || _sortOrder == SortOrder.createdDateDescending) {
      return Icons.calendar_today;
    } else {
      return Icons.sort;
    }
  }

   String _getSortTooltip() {
    if (_sortOrder == SortOrder.nameAscending) {
      return 'Sorted by Name (A-Z)';
    } else if (_sortOrder == SortOrder.nameDescending) {
      return 'Sorted by Name (Z-A)';
    } else if (_sortOrder == SortOrder.createdDateAscending) {
      return 'Sorted by Created Date (Oldest First)';
    } else if (_sortOrder == SortOrder.createdDateDescending) {
      return 'Sorted by Created Date (Newest First)';
    } else {
      return 'Sort';
    }
  }

  void _showRelationFilterDialog() {
    // Get all unique relations from the _people list
    final uniqueRelations = _people.map((person) => person.relation).toSet().toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter by Relation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                // Option to show all
                ListTile(
                  title: const Text('Show All'),
                  onTap: () {
                    setState(() {
                      _selectedRelationFilter = null; // Clear the filter
                    });
                    Navigator.of(context).pop();
                  },
                ),
                // List of unique relations as filter options
                ...uniqueRelations.map((relation) {
                  return ListTile(
                    title: Text(relation),
                    onTap: () {
                      setState(() {
                        _selectedRelationFilter = relation; // Set the selected filter
                      });
                      Navigator.of(context).pop();
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     final uniqueRelations = _people.map((person) => person.relation).toSet().toList(); // Get unique relations here

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Networks'),
        actions: [
           IconButton(
            icon: Icon(_getSortIcon()),
            onPressed: _showSortOptionsDialog,
            tooltip: _getSortTooltip(),
          ),
          // Combined filter and search functionality in one icon/widget
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch<void>(
                context: context,
                delegate: PersonSearchDelegate(
                  _people,
                  uniqueRelations,
                ),
              );
            },
             tooltip: 'Search or Filter',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredPeople.length,
        itemBuilder: (context, index) {
          final person = _filteredPeople[index];
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
                      index: _people.indexOf(person), // Pass the index from the original list
                      onUpdate: _updatePerson,
                      onDelete: _deletePerson,
                    ),
                  ),
                );
                if (updatedPerson != null && updatedPerson is Person) {
                  _updatePerson(_people.indexOf(updatedPerson), updatedPerson);
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
  final List<String> uniqueRelations; // Receive unique relations

  // Add variables to hold the selected criteria and relation filter
  SearchFilterCriteria _selectedCriteria = SearchFilterCriteria.name; // State for selected criteria
  String? _selectedRelationFilter; // State for relation filter within delegate

  PersonSearchDelegate(this.people, this.uniqueRelations);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      // Customize the app bar theme for the search page if needed
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the search bar (e.g., clear query button)
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
           // Clear the selected relation filter as well if applicable
          if (_selectedCriteria == SearchFilterCriteria.relation) {
             _selectedRelationFilter = null;
          }
           // Manually trigger a rebuild of the suggestions
           showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon (e.e., back button)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Display search results based on the query and selected criteria
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display search suggestions as the user types
    return _buildSearchResults(context);
  }

 @override
  String get searchFieldLabel => _selectedCriteria == SearchFilterCriteria.name ? 'Name / Description / Relation' : 'Select Relation';

  Widget _buildSearchResults(BuildContext context) {
    final results = people.where((person) {
      // Include relation in the search criteria for name/description search
      if (_selectedCriteria == SearchFilterCriteria.name) {
        return person.name.toLowerCase().contains(query.toLowerCase()) ||
               (person.description != null && person.description!.toLowerCase().contains(query.toLowerCase())) ||
               person.relation.toLowerCase().contains(query.toLowerCase());
      } else if (_selectedCriteria == SearchFilterCriteria.relation) {
        // Filter by selected relation (this part remains the same)
        return _selectedRelationFilter == null || person.relation == _selectedRelationFilter;
      }
      return false;
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
            },
          ),
        );
      },
    );
  }

   @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: buildLeading(context),
      title: Row(
        children: [
          // Dropdown for selecting criteria
          DropdownButton<SearchFilterCriteria>(
            value: _selectedCriteria,
            items: const [
              DropdownMenuItem(
                value: SearchFilterCriteria.name,
                child: Text('Name'),
              ),
              DropdownMenuItem(
                value: SearchFilterCriteria.relation,
                child: Text('Relation'),
              ),
            ],
            onChanged: (newValue) {
              if (newValue != null) {
                 _selectedCriteria = newValue;
                 // Clear the query when switching criteria
                query = '';
                 // Clear the selected relation filter when switching to name search
                if (_selectedCriteria == SearchFilterCriteria.name) {
                  _selectedRelationFilter = null;
                }
                 // Manually trigger a rebuild of the suggestions to update the input field/dropdown
               showSuggestions(context);
              }
            },
          ),
          const SizedBox(width: 8.0), // Add spacing between dropdown and input field/dropdown
          Expanded(
            child: _selectedCriteria == SearchFilterCriteria.name
                ? TextField(
                    controller: TextEditingController(text: query), // Use a new controller with the current query
                    decoration: InputDecoration(
                      hintText: searchFieldLabel,
                      border: InputBorder.none,
                    ),
                    textInputAction: textInputAction,
                     // Update the query as the user types
                    onChanged: (value) {
                      query = value;
                      showSuggestions(context); // Show suggestions as the user types
                    },
                  )
                : DropdownButton<String?>(
                    value: _selectedRelationFilter,
                    hint: Text(searchFieldLabel),
                    items: ['Show All', ...uniqueRelations]
                        .map((relation) => DropdownMenuItem(
                              value: relation == 'Show All' ? null : relation,
                              child: Text(relation),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      _selectedRelationFilter = newValue;
                       // Manually trigger a rebuild of the suggestions to update the results
                      showSuggestions(context);
                    },
                  ),
          ),
        ],
      ),
      actions: buildActions(context),
    );
  }

  // Override this to trigger a rebuild of the suggestions when state changes
  @override
  void showSuggestions(BuildContext context) {
    super.showSuggestions(context);
  }

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
  }
}
