class AllGigModel {
  bool? success;
  String? error;
  List<GigBody>? body;

  AllGigModel({this.success, this.error, this.body});

  AllGigModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['body'] != null) {
      body = <GigBody>[];
      json['body'].forEach((v) {
        body!.add(GigBody.fromJson(v));
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

class GigBody {
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
  String? image1;
  String? image2;
  String? cost;
  String? experienceLevel;
  String? jobType;
  String? ratings;
  int? reviewCount;
  String? status;
  String? createdAt;
  String? updatedAt;

  GigBody(
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
        this.image1,
        this.image2,
        this.cost,
        this.experienceLevel,
        this.jobType,
        this.ratings,
        this.reviewCount,
        this.status,
        this.createdAt,
        this.updatedAt});

  GigBody.fromJson(Map<String, dynamic> json) {
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
    image1 = json['image1'];
    image2 = json['image2'];
    cost = json['cost'];
    experienceLevel = json['experience_level'];
    jobType = json['job_type'];
    ratings = json['ratings'];
    reviewCount = json['review_count'];
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
    data['image1'] = image1;
    data['image2'] = image2;
    data['cost'] = cost;
    data['experience_level'] = experienceLevel;
    data['job_type'] = jobType;
    data['ratings'] = ratings;
    data['review_count'] = reviewCount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}