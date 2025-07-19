
class Person {
  String name;
  String relation;
  String howWeMet;
  String? description;
  String? dob;
  String? gender;
  List<String> phoneNumbers;
  String? address;
  String? occupation;
  String? company;
  List<Reminder> reminders;
  String? hobbies;
  String? gmail;
  String? instagram;
  String? twitter;
  String? linkedin;
  String? github;

  Person({
    required this.name,
    required this.relation,
    required this.howWeMet,
    this.description,
    this.dob,
    this.gender,
    List<String>? phoneNumbers,
    this.address,
    this.occupation,
    this.company,
    List<Reminder>? reminders,
    this.hobbies,
    this.gmail,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.github,
  }) : phoneNumbers = phoneNumbers ?? [],
       reminders = reminders ?? [];
}

class Reminder {
  DateTime date;
  String purpose;

  Reminder({
    required this.date,
    required this.purpose,
  });
}
