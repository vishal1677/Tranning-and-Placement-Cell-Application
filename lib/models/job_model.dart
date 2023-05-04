// import 'dart:html';

class JobModel
{
  String? company;
  String? logoUrl;
  String? title;
  String? CTC;
  String? location;
  String? starttime;
  List<String>?req;
  bool? isMark;

  JobModel({ this.company, this.logoUrl, this.title, this.CTC, this.location, this.starttime, this.req,
    this.isMark}
      );

  factory JobModel.fromMap(map)
  {
    return JobModel(
        company: map['company'],
        logoUrl: map['logoUrl'],
        title: map['title'],
        CTC: map['CTC'],
        location: map['location'],
        starttime: map['starttime'],
        req: map['req'],
        isMark: map['isMark']
    );

  }
  Map<String,dynamic>toMap()
  {
    return
      {
        'company':company,
        'logoUrl':logoUrl,
        'title': title,
        'CTC':CTC,
        'location':location,
        'starttime':starttime,
        'req':req,
        'isMark':isMark,
      };
  }



}