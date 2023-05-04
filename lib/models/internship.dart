import 'package:flutter/foundation.dart';

class Internship
{
  String company;
  String logoUrl;
  String title;
  String stipend;
  String period;
  String location;
  String startTime;
  List<String>req;
  bool isMark;


  Internship(this.company,this.title,this.location, this.stipend, this.logoUrl, this.startTime,this.isMark, this.req, this.period);


  static List<Internship> generateInternship(){
    return [
      Internship(
          'Google',
          'SDE Summer Intern',
          'Poland Warshaw',
          '80K Per Month',
          'assets/images/google_logo.png',
          '1/1/2025',
          true,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ],
         "2 Months"

      ),
      Internship(
          'LinkedIn',
          'SDE Summer Intern',
          'New York, USA',
          '80K Per Month',
          'assets/images/linkedin_logo.png',
          '1/1/2025',
          false,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ],
        "2 Month"
      ),
      Internship(
          'Airbnb',
          'Flutter Developer Intern',
          'Tokyo, Japan',
          '70K Per Month',
          'assets/images/airbnb_logo.png',
          '1/1/2025',
          false,
          [
            'Problem Solving & DSA',
            'Flutter and Firebase',
            'Good Understanding of Core subjects'
          ],
         "2 Months"
      ),

    ];
  }

}