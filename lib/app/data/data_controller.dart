import 'package:dein_app/app/data/message_parser.dart';
import 'package:dein_app/app/data/schedule_parser.dart';
import 'package:dein_app/app/data/user_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets_res.dart';
import 'document_parser.dart';

class DataController {
  static var avatar = "".obs;
  static var name = "".obs;
  static var document = "".obs;
  static var skills = <String>[].obs;
  static var birthday = DateTime.now().obs;
  static var userLocation = "".obs;
  static var userAbout = "".obs;
  static var userPhoneNumber = "".obs;
  static var documentList = <String?>[].obs;
  static var userDocument = <DocumentParser>[].obs;
  static var userSchedule = <ScheduleParser>[].obs;

  static void clearValues(){
    name("");
    avatar("");
    document("");
    skills([]);
    documentList([]);
    userDocument([]);
    userSchedule([]);
    matches([]);
    birthday(DateTime.now());
    userLocation("");
    userAbout("");
    userPhoneNumber("");
  }

  static var users = [
    {
      "id": 1,
      "name": "Julien Hirano",
      "active": false,
      "location": "Basel",
      "age": 30,
      "images": [AssetsRes.USER1],
      "about": """Personal Trainer/ Athletik- & Mentaltrainer
für Hobby- und Leistungssportler,
Sportwissenschaftler, Dozent am
Departement für Sport, Bewegung und
Gesundheit, Universität Basel
""",
      "time": "Mo - Fr 8:00 - 17:00",
      "services": [
        "Bodyweight Training",
        "Mobility",
        "TRX Training",
        "Functional Training"
      ],
      "is_job": false,
      "reviews": [
        {
          "rating": 4.0,
          "text": """Sed vitae arcu. Aliquam erat volutpat.
Praesent odio nisl, suscipit at, rhoncus sit
amet, porttitor sit amet, leo. Aenean""",
          "user": "Michael S."
        },
        {
          "rating": 3.0,
          "text": """Morbi pellentesque, mauris interdum porta
tincidunt, neque orci molestie mauris, vitae
iaculis dolor felis at nunc. Maecenas eu """,
          "user": "Michael S.",
        }
      ]
    },
    {
      "id": 2,
      "active": true,
      "name": "Käthi Preisig",
      "location": "Bern",
      "age": 37,
      "images": [AssetsRes.USER2],
      "mission": "Software developer",
      "about": """In eget sapien vitae massa rhoncus lacinia.
Nullam at leo nec metus aliquam semper.
Phasellus tincidunt, ante nec lacinia
ultrices, quam mi dictum libero, vitae
bibendum turpis elit ut lectus. Sed diam""",
      "requirements": """• 10+ years of experience as a developer
for digital services and products
• 5+ years of experience managing teams
• ability to inspire, lead and manage a
creative team, while supervising the
quality of output
• experience resolving complex design and
communication issues
""",
      "location_job": "Remote, Bern",
      "type_job": "Fulltime",
      "workload": "50-70%",
      "salary": "10-15,000 CHF",
      "is_job": true,
      "agent_name": "Swiss Digital AG",
      "agent_location": "Waaghaus-Passage 8\n3011 Bern, Switzerland"
    }
  ].map((e) => UserParser.fromJson(e));

  static var selectedFilterType = "doctor".obs;

  static var filterTypes = [
    {
      "name": "Doctor",
      "type": "doctor",
      "language": ["German", "Italian", "French"]
    },
    {
      "name": "Software developer",
      "type": "software_developer",
      "language": ["German", "Italian", "French"],
      "employment_type": ["Lehrstellen", "ktikum", "Studentenjobs"],
      "company_size": ["Startup", "Small", "Large"],
    },
    {
      "name": "Carpenter",
      "type": "carpenter",
      "branch": ["Handwerk"],
      "canton": ["Zürich"],
      "employment_type": ["Lehrstellen", "ktikum", "Studentenjobs"],
      "language": ["German", "Italian", "French"],
    }
  ];

  static var doctorExpSlider = 10.0.obs;
  static var softWorkSlider = const RangeValues(20, 60).obs;
  static var softEmpType = "Lehrstellen".obs;
  static var carpenterBranch = "Handwerk".obs;
  static var carpenterCanton = "Zürich".obs;

  static var messages = [
    {
      "date": "2023-07-01 02:18:26",
      "user": 2,
      "data": [
        {
          "user": 2,
          "message": "hello",
          "date": "2023-07-01 02:18:26",
        },
      ]
    },
    {
      "date": "2023-07-02 02:18:26",
      "user": 1,
      "data": [
        {
          "user": 1,
          "message": "hello",
          "date": "2023-07-02 02:18:26",
        },
        {
          "user": 1,
          "message": "how are you?",
          "date": "2023-07-02 02:20:40",
        },
        {
          "user": 0,
          "message": "hi",
          "date": "2023-07-02 02:19:40",
        },
        {
          "user": 0,
          "message": "fine",
          "date": "2023-07-02 02:25:40",
        },
      ]
    },
  ].map((e) => MessageParser.fromJson(e)).toList().obs;

  static var matches = <UserParser>[].obs;
}
