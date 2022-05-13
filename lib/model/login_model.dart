class LogInModel {
  User? user;
  String? accessToken;
  String? customToken;

  LogInModel({this.user, this.accessToken, this.customToken});

  LogInModel.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    customToken = json['customToken'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['customToken'] = customToken;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? userType;
  String? firebaseUserid;
  String? imageUrl;
  int? status;
  int? basicProfileDataProvided;
  String? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? firstName;
  String? lastName;
  String? title;
  int? phone;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? language;
  String? currency;
  String? studentId;
  String? instituteName;
  String? instituteYear;
  String? profileImage;
  String? latitude;
  String? longitude;
  int? status1;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.userType,
        this.firebaseUserid,
        this.imageUrl,
        this.status,
        this.basicProfileDataProvided,
        this.isBlocked,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.firstName,
        this.lastName,
        this.title,
        this.phone,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.language,
        this.currency,
        this.studentId,
        this.instituteName,
        this.instituteYear,
        this.profileImage,
        this.latitude,
        this.longitude,
        this.status1});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    firebaseUserid = json['firebase_userid'];
    imageUrl = json['image_url'];
    status = json['status'];
    basicProfileDataProvided = json['basic_profile_data_provided'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    title = json['title'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    language = json['language'];
    currency = json['currency'];
    studentId = json['student_id'];
    instituteName = json['institute_name'];
    instituteYear = json['institute_year'];
    profileImage = json['profile_image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status1 = json['status_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['user_type'] = userType;
    data['firebase_userid'] = firebaseUserid;
    data['image_url'] = imageUrl;
    data['status'] = status;
    data['basic_profile_data_provided'] = basicProfileDataProvided;
    data['is_blocked'] = isBlocked;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['title'] = title;
    data['phone'] = phone;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['country'] = country;
    data['language'] = language;
    data['currency'] = currency;
    data['student_id'] = studentId;
    data['institute_name'] = instituteName;
    data['institute_year'] = instituteYear;
    data['profile_image'] = profileImage;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status_1'] = status1;
    return data;
  }
}