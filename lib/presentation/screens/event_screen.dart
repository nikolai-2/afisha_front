import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oggetto_afisha_front/internal/colors.dart';
import 'package:oggetto_afisha_front/internal/text_styles.dart';
import 'package:oggetto_afisha_front/presentation/widgets/event_app_bar.dart';
import 'package:oggetto_afisha_front/presentation/widgets/follow_button.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    EventAppBar(title: 'Настольные игры'),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Играем в Dungeon&Dragons',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: enventCardColor,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '14 марта',
                                      style: whiteBold,
                                    ),
                                    const Text(
                                      '10:00-13:30',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: SvgPicture.asset(
                                              'assets/icons/geo_pin.svg',
                                            ),
                                          ),
                                          const TextSpan(
                                            text: 'Центральный холл',
                                          )
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: SvgPicture.asset(
                                              'assets/icons/url.svg',
                                            ),
                                          ),
                                          const TextSpan(
                                            text: 'https://t.me/elona',
                                            style: urlText,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    FollowButton(
                                      text: 'Пойду',
                                      onTap: () {},
                                    ),
                                    const SizedBox(height: 10),
                                    Stack(
                                      children: List.generate(
                                        5,
                                        (index) => Padding(
                                          padding: EdgeInsets.only(
                                            left: (16 * index).toDouble(),
                                          ),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 15.5,
                                            backgroundImage:
                                                AssetImage('assets/elon.jpg'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Идет ещё 25 человек',
                                      style: smallGreyText,
                                    ),
                                    const SizedBox(height: 15),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xFF454547),
                            height: 1,
                          ),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Приглашаем всех сотрудников поиграть в D&D, настольная ролевая игра, центральное место в которой занимает история, рассказываемая её участниками. Каждый игрок придумывает себе персонажа и отправляется в долгое и полное опасностей и сокровищ приключение. Прелесть игры в том, что конечный исход этой истории не предрешён заранее, и большая часть событий будет разворачиваться согласно действиям героев.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFA09FA3),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
