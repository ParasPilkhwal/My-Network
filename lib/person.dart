
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
  DateTime createdDate;
  DateTime lastModifiedDate;

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
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) : phoneNumbers = phoneNumbers ?? [],
       reminders = reminders ?? [],
       createdDate = createdDate ?? DateTime.now(),
       lastModifiedDate = lastModifiedDate ?? DateTime.now();

  Person copyWith({
    String? name,
    String? relation,
    String? howWeMet,
    String? description,
    String? dob,
    String? gender,
    List<String>? phoneNumbers,
    String? address,
    String? occupation,
    String? company,
    List<Reminder>? reminders,
    String? hobbies,
    String? gmail,
    String? instagram,
    String? twitter,
    String? linkedin,
    String? github,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) {
    return Person(
      name: name ?? this.name,
      relation: relation ?? this.relation,
      howWeMet: howWeMet ?? this.howWeMet,
      description: description ?? this.description,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      address: address ?? this.address,
      occupation: occupation ?? this.occupation,
      company: company ?? this.company,
      reminders: reminders ?? this.reminders,
      hobbies: hobbies ?? this.hobbies,
      gmail: gmail ?? this.gmail,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      github: github ?? this.github,
      createdDate: createdDate ?? this.createdDate,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
    );
  }
}

class Reminder {
  DateTime date;
  String purpose;

  Reminder({
    required this.date,
    required this.purpose,
  });
}
