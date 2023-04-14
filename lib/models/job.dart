class Job
{
  String company;
  String logoUrl;
  String title;
  String CTC;
  String location;
  String starttime;
  List<String>req;
  bool isMark;


  Job(this.company,this.title,this.location, this.CTC, this.logoUrl, this.starttime,this.isMark, this.req);
  static List<Job> generateJobs(){
    return [
      Job(
          'Google',
          'SDE 3',
          'Poland Warshaw',
          '40 LPA',
          'assets/images/google_logo.png',
          '1/1/2025',
          true,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ]
      ),
      Job(
          'LinkedIn',
          'SDE 3',
          'New York, USA',
          '40 LPA',
          'assets/images/linkedin_logo.png',
          '1/1/2025',
          false,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ]
      ),
      Job(
          'Airbnb',
          'SDE 3',
          'Tokyo, Japan',
          '40 LPA',
          'assets/images/airbnb_logo.png',
          '1/1/2025',
          false,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ]
      ),

    ];
  }

}