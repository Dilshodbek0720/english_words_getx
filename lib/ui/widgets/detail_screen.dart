import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.wordModel});
  final WordModel wordModel;
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Definitions"),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(24),
            title: Row(
              children: [
                const SizedBox(width: 10,),
                Text(wordModel.word[0].toUpperCase()+wordModel.word.substring(1), style: const TextStyle(
                    fontSize: 34, fontWeight: FontWeight.w600
                ),),
                IconButton(onPressed: ()async{
                  await player.play(UrlSource(wordModel.phonetics[0].audio));
                }, icon: const Icon(Icons.music_note, color: Colors.redAccent,)),
                const Spacer(),
                TextButton(onPressed: () async{
                  Uri url = Uri.parse(wordModel.phonetics[0].sourceUrl);
                  if(wordModel.phonetics[0].sourceUrl.isNotEmpty){
                    await launchUrl(url);
                  }
                }, child: const Text("Wikipedia"))
              ],
            ),
            // subtitle: Text(wordModel.meanings[0].definitions[0].definition),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                color: Colors.redAccent
                            ),
                            child: Text(wordModel.meanings[0].partOfSpeech)),
                      ],
                    ),
                    ...List.generate(wordModel.meanings[0].definitions.length, (index) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(wordModel.meanings[0].definitions[index].definition, style: const TextStyle(
                        fontSize: 15
                      ),))),
                    const SizedBox(height: 10,),
    ]
              ),
            ],
          )
        ],
      ),
    );
  }
}
