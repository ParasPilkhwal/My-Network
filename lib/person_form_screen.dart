import 'package:flutter/material.dart';
import 'person.dart';
import 'package:intl/intl.dart';

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
  late List<TextEditingController> _phoneControllers;
  late TextEditingController _addressController;
  late TextEditingController _occupationController;
  late TextEditingController _companyController;
  late TextEditingController _hobbiesController;
  late TextEditingController _instagramController;
  late TextEditingController _twitterController;
  late TextEditingController _linkedinController;
  late TextEditingController _githubController;
  late TextEditingController _gmailController;


  String _selectedRelation = 'Friends';
  final List<String> _relations = [
    'Friends',
    'family member',
    'Batchmates',
    'Colleague',
    'neighbour',
    'others',
  ];

  String _selectedGender = 'Boy';
  final List<String> _genders = [
    'Boy',
    'Girl',
    'Other',
  ];

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.person?.name);
    _howWeMetController = TextEditingController(text: widget.person?.howWeMet);
    _descriptionController = TextEditingController(text: widget.person?.description);
    _dobController = TextEditingController(text: widget.person?.dob);
     _phoneControllers = (widget.person?.phoneNumbers ?? [''])
        .map((number) => TextEditingController(text: number))
        .toList();
    _addressController = TextEditingController(text: widget.person?.address);
    _occupationController = TextEditingController(text: widget.person?.occupation);
    _companyController = TextEditingController(text: widget.person?.company);
    _hobbiesController = TextEditingController(text: widget.person?.hobbies);
    _instagramController = TextEditingController(text: widget.person?.instagram);
    _twitterController = TextEditingController(text: widget.person?.twitter);
    _linkedinController = TextEditingController(text: widget.person?.linkedin);
    _githubController = TextEditingController(text: widget.person?.github);
    _gmailController = TextEditingController(text: widget.person?.gmail);

    if (widget.person != null) {
      _selectedRelation = widget.person!.relation;
       _selectedGender = widget.person!.gender ?? 'Boy';
      if (widget.person!.dob != null && widget.person!.dob!.isNotEmpty) {
        try {
          _selectedDate = DateFormat('dd MMM yyyy').parse(widget.person!.dob!);
        } catch (e) {
          // Handle parsing errors if the existing date format is unexpected
          print('Error parsing date: ${widget.person!.dob!}');
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _howWeMetController.dispose();
    _descriptionController.dispose();
    _dobController.dispose();
    for (var controller in _phoneControllers) {
      controller.dispose();
    }
    _addressController.dispose();
    _occupationController.dispose();
    _companyController.dispose();
    _hobbiesController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _gmailController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('dd MMM yyyy').format(_selectedDate!);
      });
    }
  }

  void _addPhoneNumberField() {
    if (_phoneControllers.length < 5) {
      setState(() {
        _phoneControllers.add(TextEditingController());
      });
    }
  }

  void _removePhoneNumberField(int index) {
    setState(() {
      _phoneControllers[index].dispose();
      _phoneControllers.removeAt(index);
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newPerson = Person(
        name: _nameController.text,
        relation: _selectedRelation,
        howWeMet: _howWeMetController.text,
        description: _descriptionController.text,
        dob: _dobController.text,
        gender: _selectedGender,
        phoneNumbers: _phoneControllers.map((controller) => controller.text).toList(),
        address: _addressController.text,
        occupation: _occupationController.text,
        company: _companyController.text,
        hobbies: _hobbiesController.text,
        gmail: _gmailController.text,
        instagram: _instagramController.text,
        twitter: _twitterController.text,
        linkedin: _linkedinController.text,
        github: _githubController.text,
         reminders: widget.person?.reminders ?? [], // Preserve existing reminders for now
      );
      // If editing an existing person, pop with the updated person
      if (widget.person != null && widget.index != null) {
        // Instead of popping with a result, we'll just pop.
        // The detail screen will handle updating its state.
        widget.onSave(newPerson); // Call onSave to update in HomeScreen's list
        Navigator.pop(context, newPerson); // Pop with the updated person

      } else {
        // If adding a new person, call onSave and then pop
        widget.onSave(newPerson);
        Navigator.pop(context);
      }
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
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true, // Make the text field read-only
                onTap: () => _selectDate(context), // Open date picker on tap
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: _genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  }
                },
              ),
              
              // Phone Numbers Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Phone Numbers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _phoneControllers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _phoneControllers[index],
                          decoration: InputDecoration(labelText: 'Phone Number ${index + 1}'),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      if (_phoneControllers.length > 1)
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removePhoneNumberField(index),
                        ),
                      if (index == _phoneControllers.length - 1 && _phoneControllers.length < 5)
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: _addPhoneNumberField,
                        ),
                    ],
                  );
                },
              ),

              // Other Details Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Other Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                maxLines: 2,
              ),
               TextFormField(
                controller: _occupationController,
                decoration: const InputDecoration(labelText: 'Occupation'),
              ),
               TextFormField(
                controller: _companyController,
                decoration: const InputDecoration(labelText: 'Company'),
              ),
               TextFormField(
                controller: _hobbiesController,
                decoration: const InputDecoration(labelText: 'Hobbies'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),

              // Links Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Links', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: _gmailController,
                decoration: const InputDecoration(labelText: 'Gmail'),
                keyboardType: TextInputType.emailAddress,
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
