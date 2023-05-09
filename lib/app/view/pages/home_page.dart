import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/film_model.dart';
import '../../service/film_service.dart';

import '../widgets/likes_widget.dart';
import '../widgets/list_details_widget.dart';
import '../widgets/title_widget.dart';
import '../widgets/view_quatity_widget.dart';
import '../widgets/heart_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilmService filmService = Get.put(FilmService());

  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
    filmService.getFilm;
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      setState(() {
        isConnected = true;
      });
    } else {
      setState(() {
        isConnected = false;
      });

      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
                title: const Text('Sem internet!'),
                content: const Text('Confira sua conexão com a internet'),
                actions: [
                  CupertinoButton.filled(
                    child: const Text('Tente novamente'),
                    onPressed: () {
                      checkInternet();
                      filmService.getFilm;
                      Navigator.pop(context);
                    },
                  )
                ]));
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<FilmModel>(
      future: filmService.getFilm(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          final filmData = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7Hgiro8MGcfrHFi1ulgpmXaJhGV.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleWidget(title: filmData.title),
                          const HeartButtonWidget(),
                        ],
                      ),
                      Row(
                        children: [
                          LikesWidget(
                            vote_count: filmData.vote_count.toString(),
                          ),
                          const SizedBox(width: 32),
                          ViewQuantityWidget(
                            popularity: filmData.popularity.toString(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const ListDetailsWidget()
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          throw Exception('Algo de errado não está certo!');
        }
      },
    )));
  }
}
