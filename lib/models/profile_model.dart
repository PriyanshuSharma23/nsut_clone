class ProfileModel {
  final String studentName;
  final String studentID;
  final String dOB;
  final String brachName;
  final int section;
  final String gender;
  final String specialization;
  final String category;
  final String admission;
  final String degree;
  final String fTPT;

  ProfileModel(
      {required this.studentName,
      required this.studentID,
      required this.dOB,
      required this.brachName,
      required this.section,
      required this.gender,
      required this.specialization,
      required this.category,
      required this.admission,
      required this.degree,
      required this.fTPT});

  ProfileModel.fromJson(Map<String, dynamic> json)
      : studentName = json['Student Name'],
        studentID = json['Student ID'],
        dOB = json['DOB'],
        brachName = json['Brach Name'],
        section = json['Section'],
        gender = json['Gender'],
        specialization = json['Specialization'],
        category = json['Category'],
        admission = json['Admission'],
        degree = json['Degree'],
        fTPT = json['FT/PT'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Student Name'] = studentName;
    data['Student ID'] = studentID;
    data['DOB'] = dOB;
    data['Brach Name'] = brachName;
    data['Section'] = section;
    data['Gender'] = gender;
    data['Specialization'] = specialization;
    data['Category'] = category;
    data['Admission'] = admission;
    data['Degree'] = degree;
    data['FT/PT'] = fTPT;
    return data;
  }
}
