import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'person.dart';
import 'person_form_screen.dart';

class PersonDetailScreen extends StatefulWidget {
  final Person person;
  final int index;
  final Function(int, Person) onUpdate;
  final Function(int) onDelete;

  const PersonDetailScreen({
    super.key,
    required this.person,
    required this.index,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  _PersonDetailScreenState createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  late Person _person;

  @override
  void initState() {
    super.initState();
    _person = widget.person;
  }

  void _launchURL(String url) async {
    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        debugPrint('Could not launch $url');
      }
    }
  }

  void _launchEmail(String email) async {
    if (email.isNotEmpty) {
      final uri = Uri(scheme: 'mailto', path: email);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        debugPrint('Could not launch $email');
      }
    }
  }

  Future<void> _confirmDelete() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${_person.name}?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                widget.onDelete(widget.index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_person.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedPerson = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonFormScreen(
                    onSave: (updatedPerson) {},
                    person: _person,
                    index: widget.index,
                  ),
                ),
              );
              if (updatedPerson != null && updatedPerson is Person) {
                setState(() {
                  _person = updatedPerson;
                });
                widget.onUpdate(widget.index, updatedPerson);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDelete,
            tooltip: 'Delete Person',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Relation:', _person.relation),
                    _buildDetailRow('How we met:', _person.howWeMet),
                    if (_person.dob != null && _person.dob!.isNotEmpty)
                      _buildDetailRow('Date of Birth:', _person.dob!),
                    if (_person.gender != null && _person.gender!.isNotEmpty)
                      _buildDetailRow('Gender:', _person.gender!),
                    if (_person.phoneNumbers.isNotEmpty)
                      _buildPhoneNumbers(),
                    if (_person.address != null && _person.address!.isNotEmpty)
                      _buildDetailRow('Address:', _person.address!),
                    if (_person.occupation != null && _person.occupation!.isNotEmpty)
                      _buildDetailRow('Occupation:', _person.occupation!),
                    if (_person.company != null && _person.company!.isNotEmpty)
                      _buildDetailRow('Company:', _person.company!),
                    if (_person.hobbies != null && _person.hobbies!.isNotEmpty)
                      _buildDetailRow('Hobbies:', _person.hobbies!),
                    if (_person.description != null && _person.description!.isNotEmpty)
                      _buildDetailRow('Description:', _person.description!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_person.gmail != null && _person.gmail!.isNotEmpty ||
                _person.instagram != null && _person.instagram!.isNotEmpty ||
                _person.twitter != null && _person.twitter!.isNotEmpty ||
                _person.linkedin != null && _person.linkedin!.isNotEmpty ||
                _person.github != null && _person.github!.isNotEmpty)
              const Text('Contact and Social Media Links', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildLinksSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumbers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phone Numbers:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _person.phoneNumbers
                .map(
                  (number) => Text(
                    number,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (_person.gmail != null && _person.gmail!.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.email, color: Colors.red, size: 30), // Gmail icon
            onPressed: () => _launchEmail(_person.gmail!),
            tooltip: 'Send Email',
          ),
        if (_person.instagram != null && _person.instagram!.isNotEmpty)
          _buildSocialIcon(
            'Instagram',
            _person.instagram,
            FontAwesomeIcons.instagram,
            const Color(0xFFE4405F),
          ),
        if (_person.twitter != null && _person.twitter!.isNotEmpty)
          _buildSocialIcon(
            'Twitter',
            _person.twitter,
            FontAwesomeIcons.twitter,
            const Color(0xFF1DA1F2),
          ),
        if (_person.linkedin != null && _person.linkedin!.isNotEmpty)
          _buildSocialIcon(
            'LinkedIn',
            _person.linkedin,
            FontAwesomeIcons.linkedinIn,
            const Color(0xFF0A66C2),
          ),
        if (_person.github != null && _person.github!.isNotEmpty)
          _buildSocialIcon(
            'Github',
            _person.github,
            FontAwesomeIcons.githubSquare,
            Colors.blueGrey,
          ), // Changed Github icon color to white
      ],
    );
  }

  Widget _buildSocialIcon(
      String platform, String? url, IconData icon, Color color) {
    final isLinkProvided = url != null && url.isNotEmpty;
    return IconButton(
      icon:
          FaIcon(
        icon,
        color: isLinkProvided ? color : Colors.grey,
        size: 30,
      ),
      onPressed: isLinkProvided ? () => _launchURL(url!) : null,
      tooltip: isLinkProvided ? 'Open $platform' : '$platform link not provided',
    );
  }
}
