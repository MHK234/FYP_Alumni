import 'package:flutter/material.dart';

// Mock job data
class Job {
  final String title;
  final String company;
  final String location;

  Job({required this.title, required this.company, required this.location});
}

class JobSearchPage extends StatefulWidget {
  const JobSearchPage({super.key});

  @override
  _JobSearchPageState createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  // Mock job listings
  List<Job> jobListings = [
    Job(
        title: 'Flutter Developer',
        company: 'PakTech Solutions',
        location: 'Karachi'),
    Job(
        title: 'Software Engineer',
        company: 'Lahore Innovations',
        location: 'Lahore'),
    Job(
        title: 'Mobile App Developer',
        company: 'Islamabad Technologies',
        location: 'Islamabad'),
    Job(
        title: 'Backend Developer',
        company: 'Rawalpindi Systems',
        location: 'Rawalpindi'),
    Job(
        title: 'UI/UX Designer',
        company: 'Faisalabad Designs',
        location: 'Faisalabad'),
    Job(
        title: 'Data Scientist',
        company: 'Multan Analytics',
        location: 'Multan'),
    Job(
        title: 'Frontend Developer',
        company: 'Quetta Solutions',
        location: 'Quetta'),
    Job(
        title: 'Network Engineer',
        company: 'Peshawar Networks',
        location: 'Peshawar'),
    Job(
        title: 'Database Administrator',
        company: 'Gujranwala Databases',
        location: 'Gujranwala'),
    Job(
        title: 'Cybersecurity Analyst',
        company: 'Sialkot Secure',
        location: 'Sialkot'),
    Job(
        title: 'IT Support Specialist',
        company: 'Hyderabad IT Support',
        location: 'Hyderabad'),
    Job(
        title: 'Full Stack Developer',
        company: 'Bahawalpur Tech',
        location: 'Bahawalpur'),
    Job(
        title: 'AI/Machine Learning Engineer',
        company: 'Sargodha AI Labs',
        location: 'Sargodha'),
    Job(
        title: 'Quality Assurance Tester',
        company: 'Abbottabad QA',
        location: 'Abbottabad'),
    Job(
        title: 'Cloud Solutions Architect',
        company: 'Gujrat Cloud',
        location: 'Gujrat'),
    Job(
        title: 'Mobile Game Developer',
        company: 'Mardan Games',
        location: 'Mardan'),
    Job(
        title: 'E-commerce Specialist',
        company: 'Sukkur E-commerce',
        location: 'Sukkur'),
    Job(
        title: 'Web Content Writer',
        company: 'Larkana Content',
        location: 'Larkana'),
    Job(
        title: 'Project Manager',
        company: 'Mirpur Projects',
        location: 'Mirpur'),
    Job(
        title: 'Business Analyst',
        company: 'Kohat Analytics',
        location: 'Kohat'),
  ];
  // Filtered job listings based on search query
  List<Job> filteredListings = [];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search bar
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search Jobs',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                // Filter job listings based on search query
                filterJobs(query);
              },
            ),
            const SizedBox(height: 16.0),
            // Display filtered job listings
            Expanded(
              child: ListView.builder(
                itemCount: filteredListings.length,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(filteredListings[index].title),
                        subtitle: Text(
                            '${filteredListings[index].company} - ${filteredListings[index].location}'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            print(
                                'Button clicked for job: ${filteredListings[index].title}');
                          },
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter job listings based on the search query
  void filterJobs(String query) {
    setState(() {
      filteredListings = jobListings
          .where((job) =>
              job.title.toLowerCase().contains(query.toLowerCase()) ||
              job.company.toLowerCase().contains(query.toLowerCase()) ||
              job.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: JobSearchPage(),
  ));
}
