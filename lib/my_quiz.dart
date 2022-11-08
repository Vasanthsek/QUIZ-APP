import 'package:flutter/material.dart';

int score = 0;
int currentPage = 0;
String title = "";

class MyQuiz extends StatefulWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text("Creativity Quiz"),
        centerTitle: true,
      ),
      body: currentPage == 0
          ? quizPage(
              question: "What is the Capital of India ?",
              op1: "TamilNadu",
              op2: "Maharashtra",
              op3: "New Delhi",
              op4: "Rajasthan")
          : WillPopScope(
              onWillPop: () async {
                setState(() {
                  // currentPage -= currentPage;
                  currentPage = 0;
                  score = 0;
                  print(score);
                });
                return false;
              },
              child: currentPage == 1
                  ? quizPage(
                      question: "What is the name of our National Bird ?",
                      op1: "Pigeon",
                      op2: "Dove",
                      op3: "Sparrow",
                      op4: "Peacock")
                  : currentPage == 2
                      ? quizPage(
                          question: "What is the name of our National Animal ?",
                          op1: "Tiger",
                          op2: "Lion",
                          op3: "Elephant",
                          op4: "Dog")
                      : currentPage == 3
                          ? quizPage(
                              question:
                                  "How many continents are there in the world ?",
                              op1: "Six",
                              op2: "Ten",
                              op3: "Eight",
                              op4: "Seven")
                          : currentPage == 4
                              ? quizPage(
                                  question:
                                      "Who is called as the Father of Indian Nation ?",
                                  op1: "Gandhi",
                                  op2: "Patel",
                                  op3: "Nehru",
                                  op4: "Jhansi")
                              : currentPage == 5
                                  ? quizPage(
                                      question:
                                          "What is the Smallest State in India ?",
                                      op1: "TamilNadu",
                                      op2: "Goa",
                                      op3: "Karnataka",
                                      op4: "Punjab")
                                  : currentPage == 6
                                      ? quizPage(
                                          question:
                                              "What is the Capital Of South Korea ?",
                                          op1: "Seoul",
                                          op2: "Gangnam",
                                          op3: "Busan",
                                          op4: "Jeju")
                                      : currentPage == 7
                                          ? quizPage(
                                              question:
                                                  "Who is called as Superstar in Tamilnadu ?",
                                              op1: "Kamal",
                                              op2: "Rajini",
                                              op3: "Vijay",
                                              op4: "Ajith")
                                          : currentPage == 8
                                              ? quizPage(
                                                  question:
                                                      "Who coined the term Gravity ?",
                                                  op1: "Newton",
                                                  op2: "Pascal",
                                                  op3: "Edison",
                                                  op4: "Einstein")
                                              : currentPage == 9
                                                  ? quizPage(
                                                      question:
                                                          "Where is the Pyramid located ?",
                                                      op1: "France",
                                                      op2: "Greece",
                                                      op3: "Egypt",
                                                      op4: "America")
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            score >= 5
                                                                ? const Text(
                                                                    "Congratulations",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            35,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold))
                                                                : const Text(
                                                                    "Better luck Next Time",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                                "Your Score is $score / 10",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
            ),
    );
  }

  Widget customWidget({required String title, required Color colors}) =>
      ListTile(
        title: Text(title),
        tileColor: colors,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () {
          setState(() {
            if (title == "New Delhi" ||
                title == "Peacock" ||
                title == "Tiger" ||
                title == "Seven" ||
                title == "Gandhi" ||
                title == "Goa" ||
                title == "Rajini" ||
                title == "Seoul" ||
                title == "Newton" ||
                title == "Egypt") {
              score += 1;
              currentPage += 1;
              debugPrint("$score,$currentPage");
            } else {
              currentPage = currentPage + 1;
              debugPrint("$score,$currentPage");
            }
          });
        },
      );
  Widget quizPage({
    required String question,
    required String op1,
    required String op2,
    required String op3,
    required String op4,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, //  "Where is the Pyramid located ?",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          customWidget(title: op1, colors: Colors.red), //"France"
          const SizedBox(
            height: 10.0,
          ),
          customWidget(title: op2, colors: Colors.green), //"Greece"
          const SizedBox(
            height: 10.0,
          ),
          customWidget(title: op3, colors: Colors.yellow), //"Egypt"
          const SizedBox(
            height: 10.0,
          ),
          customWidget(title: op4, colors: Colors.orange), //"America"
        ],
      ),
    );
  }
}
