import '../../modal/url/url.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ConstColor.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
                child: Row(
                  children: [
                    CustomBackButton(
                      color: true,
                      onTap: () {
                        NavigationRoutes.pop(context);
                      },
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            ConstString.notification,
                            style: textStyleW600(
                              size.width * 0.06,
                              ConstColor.primary,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fromWhom.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.045,
                      vertical: size.height * 0.02,
                    ),
                    margin: EdgeInsets.only(bottom: size.height * 0.01),
                    width: double.infinity,
                    color: ConstColor.screenColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ConstString.from,
                                  style:
                                      TextStyle(fontSize: size.width * 0.055),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  fromWhom[index],
                                  style:
                                      TextStyle(fontSize: size.width * 0.055),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text("29 Sep"),
                                Text("15:20"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          width: size.width * 0.75,
                          child: Text(notificationMessage[index]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
