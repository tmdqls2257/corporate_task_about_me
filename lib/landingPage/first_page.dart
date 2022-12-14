import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/bottom_navigation_provider.dart';
import '../shared/shared.dart';
import '../utils/url_parser_route.dart';
import 'widget/widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  _sendEmail(BuildContext context,
      {String email = "", String subject = "", String body = ""}) async {
    try {
      String encodeEmail = Uri.encodeComponent(email);
      String encodeSubject = Uri.encodeComponent(subject);
      String encodeBody = Uri.encodeComponent(body);
      urlParserRoute(
          "mailto:$encodeEmail?subject=$encodeSubject&body=$encodeBody");
    } catch (err) {
      String title =
          "기본 메일 앱을 사용할 수 없기 때문에 앱에서 바로 문의를 전송하기 어려운 상황입니다.\n\n아래 이메일로 연락주시면 친절하게 답변해드릴게요 :)\n\ntmdqls2257@gmail.com";
      _showMyDialog(context, title);
    }
  }

  _onTapGithup(BuildContext context) {
    BottomNavigationProvider bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    bottomNavigationProvider.push(1);
  }

  Future<void> _showMyDialog(BuildContext context, String err) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(text: 'Error'),
          content: SingleChildScrollView(child: CustomText(text: err)),
          actions: <Widget>[
            TextButton(
              child: const Text('뒤로가기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onTapEdit(BuildContext context) {
    BottomNavigationProvider bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    bottomNavigationProvider.push(2);
  }

  Future<void> _onTapPopUp(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              width: 302,
              height: 108,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '이메일: tmdqls2257@gamil.com',
                    ),
                    CustomText(
                      text: '연락처: 010-8345-8387',
                    )
                  ]),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: '닫기',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    height: 50,
                    bgColor: CustomColor.lightgrey,
                    typoType: TypoType.h3,
                    textColor: CustomColor.grey,
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(5)),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    label: '연락하기',
                    onPressed: () async {
                      _sendEmail(context);
                    },
                    height: 50,
                    bgColor: CustomColor.green,
                    typoType: TypoType.h3,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5)),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _learnAboutMeList(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 19, 0, 19),
        child: Column(
          children: [
            LearnMoreAboutMe(listWidget: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: '개발 실력이 더 궁금하다면?',
                    typoType: TypoType.bodyBolder,
                  ),
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                    const Highlighter(
                      color: CustomColor.green,
                      width: 38,
                    ),
                    RichText(
                      text: CustomTextSpan(children: [
                        CustomTextSpan(text: '깃허브', color: CustomColor.green),
                        CustomTextSpan(
                          text: '에서 커밋로그를 보실 수 있어요!',
                        )
                      ]),
                    )
                  ])
                ],
              ),
              CircleButton(
                onTap: _onTapGithup,
              )
            ]),
            const Spacer(),
            LearnMoreAboutMe(listWidget: [
              LearnMoreAboutMeItem(
                listWidget: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      const Highlighter(color: CustomColor.blue, width: 66),
                      CustomText(
                        text: '연락처 보기',
                        typoType: TypoType.bodyBolder,
                        color: CustomColor.blue,
                      ),
                    ],
                  ),
                  CustomText(
                    text: '합격 결과는 여기로 통보해 주세요',
                    typoType: TypoType.bodyLight,
                    color: CustomColor.grey,
                  ),
                ],
                svgIconType: SvgIconType.lipIcon,
              ),
              CircleButton(
                onTap: _onTapPopUp,
              )
            ]),
            const Spacer(),
            LearnMoreAboutMe(crossAxis: CrossAxisAlignment.end, listWidget: [
              LearnMoreAboutMeItem(
                svgIconType: SvgIconType.feedingBottle,
                listWidget: [
                  CustomText(
                    text: '육아크루 지원동기',
                    typoType: TypoType.bodyBolder,
                  ),
                  CustomText(
                    textAlign: TextAlign.end,
                    text: '합류한다면 이런 일을 하고 싶습니다.',
                    typoType: TypoType.bodyLight,
                    color: CustomColor.grey,
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    _onTapEdit(context);
                  },
                  child: CustomText(
                    text: '수정',
                    typoType: TypoType.bodyLight,
                    color: CustomColor.grey,
                  ))
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onPressedHome: () {},
          widget: svgIcon[SvgIconType.logo] as Widget,
          isBackBtn: false,
          onPressedBack: () {}),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonApp(),
                svgIcon[SvgIconType.bellLight] as Widget
              ],
            ),
          ),
          AboutMe(context: context),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _learnAboutMeList(
                context,
              ),
              KeywordList(content: context)
            ]),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _sendEmail(
            context,
            email: 'tmdqls2257@gmail.com',
            subject: '안녕하세요 육아크루 여러분',
            body: '저는 홍승빈이라고 합니다.',
          );
        },
        backgroundColor: customColor[CustomColor.crimson],
        child: svgIcon[SvgIconType.editLight] as Widget,
      ),
    );
  }
}
