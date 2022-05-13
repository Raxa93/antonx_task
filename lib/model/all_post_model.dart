
class AllPostModel {
  bool? success;
  String? error;
  List<Body>? body;

  AllPostModel({this.success, this.error, this.body});

  AllPostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['error'] = error;
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  int? userId;
  String? firstName;
  String? lastName;
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
  String? longitude;
  String? latitude;
  String? profileImage;
  int? id;
  String? category;
  String? tags;
  String? title;
  String? description;
  String? cost;
  int? status;
  String? createdAt;
  String? updatedAt;

  Body(
      {this.userId,
        this.firstName,
        this.lastName,
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
        this.longitude,
        this.latitude,
        this.profileImage,
        this.id,
        this.category,
        this.tags,
        this.title,
        this.description,
        this.cost,
        this.status,
        this.createdAt,
        this.updatedAt});

  Body.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
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
    longitude = json['longitude'];
    latitude = json['latitude'];
    profileImage = json['profile_image'];
    id = json['id'];
    category = json['category'];
    tags = json['tags'];
    title = json['title'];
    description = json['description'];
    cost = json['cost'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
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
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['profile_image'] = profileImage;
    data['id'] = id;
    data['category'] = category;
    data['tags'] = tags;
    data['title'] = title;
    data['description'] = description;
    data['cost'] = cost;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}