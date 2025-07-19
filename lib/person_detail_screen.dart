import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'person.dart';
import 'person_form_screen.dart';

class PersonDetailScreen extends StatelessWidget {
  final Person person;
  final int index;
  final Function(int, Person) onUpdate;

  const PersonDetailScreen({
    super.key,
    required this.person,
    required this.index,
    required this.onUpdate,
  });

  void _launchURL(String url) async {
    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Could not launch the URL
        print('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonFormScreen(
                    onSave: (updatedPerson) => onUpdate(index, updatedPerson),
                    person: person,
                    index: index,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailRow('Relation:', person.relation),
            _buildDetailRow('How we met:', person.howWeMet),
            if (person.description != null && person.description!.isNotEmpty)
              _buildDetailRow('Description:', person.description!),
            if (person.dob != null && person.dob!.isNotEmpty)
              _buildDetailRow('Date of Birth:', person.dob!),
            const SizedBox(height: 20),
            const Text('Social Media Links:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSocialMediaIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      children: [
        _buildSocialIcon('Instagram', person.instagram, 'instagram.png'), // Replace with actual icons
        _buildSocialIcon('Twitter', person.twitter, 'twitter.png'),       // Replace with actual icons
        _buildSocialIcon('LinkedIn', person.linkedin, 'linkedin.png'),     // Replace with actual icons
        _buildSocialIcon('Github', person.github, 'github.png'),         // Replace with actual icons
      ],
    );
  }

  Widget _buildSocialIcon(String platform, String? url, String iconAsset) {
    final isLinkProvided = url != null && url.isNotEmpty;
    return IconButton(
      icon:
          Icon(isLinkProvided ? Icons.link : Icons.link_off, color: isLinkProvided ? Colors.blue : Colors.grey),
      onPressed: isLinkProvided ? () => _launchURL(url!) : null,
      tooltip: isLinkProvided ? 'Open $platform' : '$platform link not provided',
    );
  }
}
