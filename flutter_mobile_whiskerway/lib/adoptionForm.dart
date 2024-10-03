import 'package:flutter/material.dart';
//import 'package:flutter_mobile_whiskerway/dbHelper/mongodb.dart'; // Uncomment when MongoDB setup is complete

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({Key? key}) : super(key: key);

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers for main form
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  // Text controllers for questionnaire
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _plansController = TextEditingController();
  final TextEditingController _wellBeingController = TextEditingController();

  // Variables for radio buttons and checkboxes
  String? _status;
  String? _ownHome;
  String? _hasPermission;
  String? _hasFencedSpace;
  String? _livingSituation;
  bool _allergies = false;
  bool _adoptDog = false;
  bool _adoptCat = false;
  String? _petSize;
  String? _energyLevel;

  // Function to upload data to MongoDB
  Future<void> submitAdoptionRequest() async {
    if (_formKey.currentState!.validate()) {
      if (_petSize == null ||
          _livingSituation == null ||
          _energyLevel == null ||
          _hasFencedSpace == null ||
          _hasPermission == null ||
          _ownHome == null ||
          _status == null) {
        // If no pet size is selected, show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields.')),
        );
        return;
      }

      // Data structure
      var data = {
        "firstName": _firstNameController.text,
        "lastName": _lastNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "address": _addressController.text,
        "birthDate": _birthDateController.text,
        "occupation": _occupationController.text,
        "status": _status,
        "ownHome": _ownHome,
        "hasPermission": _hasPermission,
        "hasFencedSpace": _hasFencedSpace,
        "livingSituation": _livingSituation,
        "allergies": _allergies,
        "adoptDog": _adoptDog,
        "adoptCat": _adoptCat,
        "petSize": _petSize, // Include the pet size in the data
        "energyLevel": _energyLevel,
        "exercise": _exerciseController.text,
        "hobbies": _hobbiesController.text,
        "plans": _plansController.text,
        "wellBeing": _wellBeingController.text,
      };

      // Uncomment this when MongoDB is connected
      // await MongoDatabase.insertData(data);

      // For now, just print the data to console
      print('Adoption Request Submitted: ${data.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Adoption Request Submitted!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adoption Application",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color(0xffd9f1fd),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // First Name Field
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              // Last Name Field
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              // Phone Field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              // Birth Date Field
              TextFormField(
                controller: _birthDateController,
                decoration: const InputDecoration(labelText: 'Birth Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth date';
                  }
                  return null;
                },
              ),
              // Occupation Field
              TextFormField(
                controller: _occupationController,
                decoration: const InputDecoration(labelText: 'Occupation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your occupation';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Marital Status Radio Buttons
              Row(
                children: [
                  const Text("Status: "),
                  Radio(
                    value: 'Single',
                    groupValue: _status,
                    onChanged: (String? value) {
                      setState(() {
                        _status = value!;
                      });
                    },
                  ),
                  const Text("Single"),
                  Radio(
                    value: 'Married',
                    groupValue: _status,
                    onChanged: (String? value) {
                      setState(() {
                        _status = value!;
                      });
                    },
                  ),
                  const Text("Married"),
                  Radio(
                    value: 'Others',
                    groupValue: _status,
                    onChanged: (String? value) {
                      setState(() {
                        _status = value!;
                      });
                    },
                  ),
                  const Text("Others"),
                ],
              ),
              const Divider(),
              // Questionnaire Section
              const Text(
                'QUESTIONNAIRE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'About Your Living Situation:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Own or Rent Home
              const Row(
                children: [
                  Text("Do you own or rent your home?"),
                ],
              ),
              Row(children: [
                Radio<String>(
                  value: "Owned",
                  groupValue: _ownHome,
                  onChanged: (String? value) {
                    setState(() {
                      _ownHome = value!;
                    });
                  },
                ),
                const Text("Owned"),
                Radio<String>(
                  value: "Rent",
                  groupValue: _ownHome,
                  onChanged: (String? value) {
                    setState(() {
                      _ownHome = value!;
                    });
                  },
                ),
                const Text("Rent"),
              ]),
              // if (!_ownHome) // Only show if renting
              Row(
                children: [
                  const Text("Do you have permission to have a pet?"),
                ],
              ),
              // if (!_ownHome)
              Row(
                children: [
                  Radio<String>(
                    value: "Yes",
                    groupValue: _hasPermission,
                    onChanged: (String? value) {
                      setState(() {
                        _hasPermission = value!;
                      });
                    },
                  ),
                  const Text("Yes"),
                  Radio<String>(
                    value: "No",
                    groupValue: _hasPermission,
                    onChanged: (String? value) {
                      setState(() {
                        _hasPermission = value!;
                      });
                    },
                  ),
                  const Text("No"),
                ],
              ),

              Row(
                children: [
                  const Text("Do you have a fenced yard or space for a pet?"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Yes",
                    groupValue: _hasFencedSpace,
                    onChanged: (String? value) {
                      setState(() {
                        _hasFencedSpace = value!;
                      });
                    },
                  ),
                  const Text("Yes"),
                  Radio<String>(
                    value: "No",
                    groupValue: _hasFencedSpace,
                    onChanged: (String? value) {
                      setState(() {
                        _hasFencedSpace = value!;
                      });
                    },
                  ),
                  const Text("No"),
                ],
              ),
              Row(
                children: [
                  const Text("Who do you live with?"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _livingSituation == 'Family',
                    onChanged: (bool? value) {
                      setState(() {
                        _livingSituation = value! ? 'Family' : '';
                      });
                    },
                  ),
                  const Text("Family"),
                  Checkbox(
                    value: _livingSituation == 'Roommate(s)',
                    onChanged: (bool? value) {
                      setState(() {
                        _livingSituation = value! ? 'Roommate(s)' : '';
                      });
                    },
                  ),
                  const Text("Roommate(s)"),
                  Checkbox(
                    value: _livingSituation == 'Alone',
                    onChanged: (bool? value) {
                      setState(() {
                        _livingSituation = value! ? 'Alone' : '';
                      });
                    },
                  ),
                  const Text("Alone"),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Pets Preferences:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('Do you have any pet allergies?'),
                value: _allergies,
                onChanged: (bool? value) {
                  setState(() {
                    _allergies = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Are you interested in adopting a dog?'),
                value: _adoptDog,
                onChanged: (bool? value) {
                  setState(() {
                    _adoptDog = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Are you interested in adopting a cat?'),
                value: _adoptCat,
                onChanged: (bool? value) {
                  setState(() {
                    _adoptCat = value!;
                  });
                },
              ),
              const Divider(),
              // Pet Size Radio
              Row(
                children: [
                  const Text("What size pet do you prefer?"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Small',
                    groupValue: _petSize,
                    onChanged: (String? value) {
                      setState(() {
                        _petSize = value!;
                      });
                    },
                  ),
                  const Text("Small"),
                  Radio<String>(
                    value: 'Medium',
                    groupValue: _petSize,
                    onChanged: (String? value) {
                      setState(() {
                        _petSize = value!;
                      });
                    },
                  ),
                  const Text("Medium"),
                  Radio<String>(
                    value: 'Large',
                    groupValue: _petSize,
                    onChanged: (String? value) {
                      setState(() {
                        _petSize = value!;
                      });
                    },
                  ),
                  const Text("Large"),
                ],
              ),

              // Energy Level Radio
              Row(
                children: [
                  const Text("Preferred pet's energy level?"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Low',
                    groupValue: _energyLevel,
                    onChanged: (String? value) {
                      setState(() {
                        _energyLevel = value!;
                      });
                    },
                  ),
                  const Text("Low"),
                  Radio(
                    value: 'Medium',
                    groupValue: _energyLevel,
                    onChanged: (String? value) {
                      setState(() {
                        _energyLevel = value!;
                      });
                    },
                  ),
                  const Text("Medium"),
                  Radio(
                    value: 'High',
                    groupValue: _energyLevel,
                    onChanged: (String? value) {
                      setState(() {
                        _energyLevel = value!;
                      });
                    },
                  ),
                  const Text("High"),
                ],
              ),
              const Divider(),
              // Exercise and Hobbies
              const Text(
                'About You:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _exerciseController,
                decoration: const InputDecoration(
                  labelText: 'What kind of exercise do you do?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _hobbiesController,
                decoration: const InputDecoration(
                  labelText: 'What are your hobbies?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _plansController,
                decoration: const InputDecoration(
                  labelText: 'Any future plans that might affect pet care?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _wellBeingController,
                decoration: const InputDecoration(
                  labelText: 'How do you ensure your pet’s well-being?',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  width: 200, // Adjust the width here
                  padding: EdgeInsets.only(top: 3, right: 3),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 70,
                    onPressed: submitAdoptionRequest,
                    color: const Color(0xff4b92d4),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'Submit request',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
