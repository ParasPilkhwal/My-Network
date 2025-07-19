
class Person {
  String name;
  String relation;
  String howWeMet;
  String? description;
  String? dob;
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
    this.instagram,
    this.twitter,
    this.linkedin,
    this.github,
  });
}
