import '../../modal/url/url.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: ConstColor.white,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.045,
              ),
              child: Text(ConstString.messages,
                  style: textStyleW600(size.width * 0.065, ConstColor.primary)),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: message.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.045,
                      vertical: size.height * 0.02,
                    ),
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    width: double.infinity,
                    color: ConstColor.screenColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(message[index].avatarUrl),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            SizedBox(
                              width: size.width * 0.64,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message[index].name,
                                    style: customFontWeight(
                                        size.width * 0.055, FontWeight.w600, 1),
                                  ),
                                  Text(
                                    message[index].propertyTitle,
                                    style: customFontWeight(size.width * 0.04,
                                        FontWeight.w600, 0.6),
                                  ),
                                  // Text(
                                  //   message[index].propertyType,
                                  //   style: customFontWeight(size.width * 0.042, FontWeight.w600, 0.6),
                                  // ),
                                  Text(
                                    message[index].message,
                                    style: customFontWeight(size.width * 0.035,
                                        FontWeight.w400, 0.6),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              message[index].date,
                              style: customFontWeight(
                                size.width * 0.029,
                                FontWeight.w400,
                                0.4,
                              ),
                            ),
                            Text(
                              message[index].time,
                              style: customFontWeight(
                                size.width * 0.029,
                                FontWeight.w400,
                                0.4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
