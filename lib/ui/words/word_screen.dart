import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/data/getx_controllers/words_controller.dart';
import 'package:english_words/ui/multiplication/multiplication_screen.dart';
import 'package:english_words/ui/widgets/global_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/network/api_service.dart';

class WordsScreen extends StatefulWidget {
  const WordsScreen({super.key});

  @override
  State<WordsScreen> createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WordsController wordsController =
    Get.put(WordsController(apiService: ApiService()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Words Screen"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MultiplicationScreen();
            }));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Stack(
        children: [
          Obx(
                () {
              return ListView(
                children: [
                  const SizedBox(height: 30,),
                  GlobalTextField(hintText: "Enter Text", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, textAlign: TextAlign.start, onChanged: (v){
                    wordsController.word = v;
                  }),
                  ...List.generate(wordsController.words.length, (index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(24),
                      title: Row(
                        children: [
                          const SizedBox(width: 5,),
                          Text(wordsController.words[index].word[0].toUpperCase()+wordsController.words[index].word.substring(1), style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600
                          ),),
                          IconButton(onPressed: ()async{
                            await player.play(UrlSource(wordsController.words[index].phonetics[0].audio));
                          }, icon: const Icon(Icons.music_note, color: Colors.redAccent,)),
                          const Spacer(),
                          TextButton(onPressed: () async{
                            Uri url = Uri.parse(wordsController.words[index].phonetics[0].sourceUrl);
                            if(wordsController.words[index].phonetics[0].sourceUrl.isNotEmpty){
                              await launchUrl(url);
                            }
                          }, child: const Text("Wikipedia"))
                        ],
                      ),
                      subtitle: Text(wordsController.words[index].meanings[0].definitions[0].definition),
                    );
                  })
                ],
              );
            },
          ),
          Align(
            child: Obx(() {
              return Visibility(
                visible: wordsController.isLoading.value,
                child: const CircularProgressIndicator(),
              );
            }),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            wordsController.getWordsAll();
          },
          child: const Icon(Icons.translate),
        ),
    );
  }
}
