class UserModel {
  late String patientName;
  late int patientAge;
  late String diseaseName;
  late List<String> details;
  late List<String> time;



  UserModel(this.patientName, this.patientAge, this.diseaseName, this.details, this.time);

  UserModel.fromJson(Map<String, dynamic> json) {
    patientName = json['PatientName'];
    patientAge = json['PatientAge'];
    diseaseName = json['DiseaseName'];
    details = json['Details'].cast<String>();
    details = json['Time'].cast<String>();    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.patientName;
    data['UserAge'] = this.patientAge;
    data['DiseaseName'] = this.diseaseName;
    data['Details'] = this.details;
    data['Time'] = this.details;
   
    return data;
  }
}

