import 'package:flutter/material.dart';
import 'person.dart';

class PersonFormScreen extends StatefulWidget {
  final Function(Person) onSave;
  final Person? person;
  final int? index;

  const PersonFormScreen({
    super.key,
    required this.onSave,
    this.person,
    this.index,
  });

  @override
  _PersonFormScreenState createState() => _PersonFormScreenState();
}

class _PersonFormScreenState extends State<PersonFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _howWeMetController;
  late TextEditingController _descriptionController;
  late TextEditingController _dobController;
  late TextEditingController _instagramController;
  late TextEditingController _twitterController;
  late TextEditingController _linkedinController;
  late TextEditingController _githubController;

  String _selectedRelation = 'Friend';
  final List<String> _relations = [
    'Friend',
    'Teacher',
    'Student',
    'Relative',
    'Colleague',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.person?.name);
    _howWeMetController = TextEditingController(text: widget.person?.howWeMet);
    _descriptionController = TextEditingController(text: widget.person?.description);
    _dobController = TextEditingController(text: widget.person?.dob);
    _instagramController = TextEditingController(text: widget.person?.instagram);
    _twitterController = TextEditingController(text: widget.person?.twitter);
    _linkedinController = TextEditingController(text: widget.person?.linkedin);
    _githubController = TextEditingController(text: widget.person?.github);

    if (widget.person != null) {
      _selectedRelation = widget.person!.relation;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _howWeMetController.dispose();
    _descriptionController.dispose();
    _dobController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newPerson = Person(
        name: _nameController.text,
        relation: _selectedRelation,
        howWeMet: _howWeMetController.text,
        description: _descriptionController.text,
        dob: _dobController.text,
        instagram: _instagramController.text,
        twitter: _twitterController.text,
        linkedin: _linkedinController.text,
        github: _githubController.text,
      );
      widget.onSave(newPerson);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person == null ? 'Add New Person' : 'Edit Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name*'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedRelation,
                decoration: const InputDecoration(labelText: 'Relation*'),
                items: _relations.map((String relation) {
                  return DropdownMenuItem<String>(
                    value: relation,
                    child: Text(relation),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedRelation = newValue;
                    });
                  }
                },
              ),
              TextFormField(
                controller: _howWeMetController,
                decoration: const InputDecoration(labelText: 'How we met*'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe how you met';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(labelText: 'Date of Birth'),
              ),
              TextFormField(
                controller: _instagramController,
                decoration: const InputDecoration(labelText: 'Instagram Link'),
              ),
              TextFormField(
                controller: _twitterController,
                decoration: const InputDecoration(labelText: 'Twitter Link'),
              ),
              TextFormField(
                controller: _linkedinController,
                decoration: const InputDecoration(labelText: 'LinkedIn Link'),
              ),
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(labelText: 'Github Link'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
