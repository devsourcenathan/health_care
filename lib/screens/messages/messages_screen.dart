import 'package:flutter/material.dart';
import 'package:medical_project/screens/messages/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor1.jpg",
    "doctor2.jpg",
  ];

  bool activeStatus = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Messages",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color(0xFF113953),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Center(
                        child: Container(
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "lib/images/doctors/${imgs[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(3),
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ));
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "lib/images/doctors/${imgs[index]}",
                  ),
                ),
                title: const Text(
                  "Doctor Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Bonjour Dr., Vous etes la ?",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                trailing: const Text(
                  "12:30",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
