class UserParser {
  int? id;
  int? age;
  String? name;
  String? location;
  List<String>? images;
  String? about;
  String? time;
  String? mission;
  String? requirements;
  String? locationJob;
  String? typeJob;
  String? workload;
  String? salary;
  String? agentName;
  String? agentLocation;
  bool? isJob;
  bool? active;

  List<String>? services;
  List<UserReview>? reviews;

  UserParser({
    this.id,
    this.age,
    this.name,
    this.location,
    this.images,
    this.about,
    this.time,
    this.mission,
    this.requirements,
    this.locationJob,
    this.typeJob,
    this.workload,
    this.salary,
    this.agentName,
    this.agentLocation,
    this.isJob,
    this.active,
    this.services,
    this.reviews,
  });

  @override
  String toString() {
    return '$location $about $mission $requirements $locationJob $typeJob $workload $agentName $agentLocation $isJob,  ${services?.join(" ")}'
        .replaceAll(" ", "_");
  }

  factory UserParser.fromJson(Map<String, dynamic> json) {
    return UserParser(
      id: json['id'],
      age: json['age'],
      name: json['name'],
      location: json['location'],
      images: json['images'],
      about: json['about'],
      time: json['time'],
      mission: json['mission'],
      requirements: json['requirements'],
      locationJob: json['location_job'],
      typeJob: json['type_job'],
      workload: json['workload'],
      salary: json['salary'],
      agentName: json['agent_name'],
      agentLocation: json['agent_location'],
      isJob: json['is_job'],
      active: json['active'],
      services: json['services'],
      reviews: json['reviews'] == null
          ? List<UserReview>.from([])
          : List<UserReview>.from(
              json['reviews'].map((x) => UserReview.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'age': age,
        'name': name,
        'location': location,
        'images': images,
        'about': about,
        'time': time,
        'mission': mission,
        'requirements': requirements,
        'location_job': locationJob,
        'type_job': typeJob,
        'workload': workload,
        'salary': salary,
        'agent_name': agentName,
        'agent_location': agentLocation,
        'is_job': isJob,
        'active': active,
        'services': services,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}

class UserReview {
  double? rating;
  String? text;
  String? user;

  UserReview({
    this.rating,
    this.text,
    this.user,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      rating: json['rating'],
      text: json['text'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'text': text,
        'user': user,
      };
}
