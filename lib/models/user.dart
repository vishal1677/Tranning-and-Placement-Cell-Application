// import 'dart:html';

class UserModel
{
 String? uid;
 String? firstName;
 String? lastName;
 String? email;
 String? branch;
 String? year;
 String? gender;
 String? registrationId;
 String? rollNo;

UserModel({ this.uid, this.firstName, this.lastName, this.email, this.branch, this.year, this.gender,
  this.registrationId, this.rollNo}
    );

factory UserModel.fromMap(map)
{
 return UserModel(
     uid: map['uid'],
     firstName: map['firstName'],
     lastName: map['lastName'],
     email: map['email'],
     branch: map['branch'],
     year: map['year'],
     gender: map['gender'],
     registrationId: map['registrationId'],
     rollNo: map['rollNo']
 );

}
Map<String,dynamic>toMap()
{
    return
     {
       'uid':uid,
       'firstName':firstName,
       'lastName':lastName,
       'email':email,
       'branch':branch,
       'year':year,
       'gender':gender,
       'registrationId':registrationId,
       'rollNo':rollNo
     };
}



}