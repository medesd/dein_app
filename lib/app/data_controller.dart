import 'package:dein_app/app/user_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/assets_res.dart';

class DataController extends GetxController {
  var avatar = "".obs;
  var name = "medesd".obs;
  var document = "".obs;
  var skills = <String>[].obs;
  var birthday = DateTime.now().obs;

  var users = [
    {
      "id": 1,
      "name": "Julien Hirano",
      "active":false,
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
      "active":true,
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

  var selectedFilterType = "doctor".obs;

  var filterTypes = [
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

  var doctorExpSlider = 10.0.obs;
  var softWorkSlider = const RangeValues(20, 60).obs;
  var softEmpType = "Lehrstellen".obs;
  var carpenterBranch = "Handwerk".obs;
  var carpenterCanton = "Zürich".obs;
}
