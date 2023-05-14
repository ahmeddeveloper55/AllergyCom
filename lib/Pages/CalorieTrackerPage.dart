import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart';
class CalorieTrackerPage extends StatefulWidget {

  @override
  State<CalorieTrackerPage> createState() => _CalorieTrackerPageState();
}

class _CalorieTrackerPageState extends State<CalorieTrackerPage> {
  SpeechToText speechToText = SpeechToText();

  Future<int> getCalories(String meal) async {
    final prompt = "\"${meal}.\" based on this estimate the calories consumed and return on the number of calories only";
    print(prompt);
    final apiKey = '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';
    final apiUrl =
        'https://api.openai.com/v1/engines/text-davinci-003/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        'prompt': prompt,
        'temperature': 0.7,
        'max_tokens': 20,
        'top_p': 1,
        'frequency_penalty': 0,
        'presence_penalty': 0,
      }),
    );

    final data = jsonDecode(response.body);
    final text = data['choices'][0]['text'];
    final regex = RegExp(r'(\d+) calories', caseSensitive: false);
    final match = regex.firstMatch(text);

    if (match != null) {
      return int.parse(match.group(1));
    } else {
      print(text);
      return -1; // or any other default value
    }
  }

  // Map<String, String> extractMealNamesWithTypes(String input) {
  //   RegExp regExp = RegExp(
  //     r"I had ((\w).*)* for (breakfast|lunch|dinner)",
  //     multiLine: true,
  //     caseSensitive: false,
  //     dotAll: true,
  //   );
  //   Iterable<Match> matches = regExp.allMatches(input);
  //   Map<String, String> mealNamesWithTypes = {};
  //   for (Match match in matches) {
  //     String mealName = match.group(1);
  //     String mealType = match.group(3);
  //     mealNamesWithTypes[mealType] = mealName;
  //   }
  //   return mealNamesWithTypes;
  // }

  var text = "Hold the button and start speaking";
  Map<String, String> res = {"":""};
  int res_calorie = 0;
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75,
        animate: isListening,
        duration: Duration(seconds: 20),
        glowColor: Colors.deepPurpleAccent,
        repeat: true,
        repeatPauseDuration: Duration(seconds: 10),
        showTwoGlows: true,
        child: GestureDetector(
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.deepPurple[500],
            child: isListening
                ? Icon(
              Icons.mic,
              color: Colors.white,
            )
                : Icon(
              Icons.mic_none,
              color: Colors.white,
            ),
          ),
          onLongPress: () async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                    });
                  });
                });
              }
            }
          },
          onLongPressEnd: (details) async {
            if (isListening) {
              setState(() {
                isListening = false;
              });
              speechToText.stop();

              // res = extractMealNamesWithTypes(text);
              print(res);
              // final meal = {'breakfast': res.toString()};
              final calories = await getCalories(text);
              if (calories != null) {
                setState(() {
                  print('Estimated calories: $calories');
                  res_calorie = calories;
                });
              } else {
                print('Unable to estimate calories');
              }
            }
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to AllergyCom Calorie Voice Detector",
              style: GoogleFonts.aldrich(
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Palatino',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 0.2,
                  letterSpacing: 0.2,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 115),
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "\nCalories: $res_calorie Calories",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
