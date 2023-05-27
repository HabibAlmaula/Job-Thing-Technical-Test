import 'package:bot_toast/bot_toast.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant/app_colors.dart';
import 'constant/app_text_style.dart';

class Utils {
  Utils._();

  static Future<void> sendMessageToWhatsApp(
      String phoneNumber, String message) async {
    try {
      String encodedMessage = Uri.encodeComponent(message);
      String formattedPhoneNumber =
          phoneNumber.replaceAll(RegExp(r'\s+|-'), '');

      Uri whatsappUrl = Uri.parse(
          'whatsapp://send?phone=$formattedPhoneNumber&text=$encodedMessage');

      Logger().i("WA_URL ==> $whatsappUrl");
      await launchUrl(whatsappUrl);
    } catch (e) {
      Logger().e('Could not launch WhatsApp.');
      BotToast.showSimpleNotification(
          title: "title: Could not launch WhatsApp",
          titleStyle:
              AppTextStyle.kSmallBodyText.copyWith(color: AppColors.prismWhite),
          backgroundColor: AppColors.prismRed_40,
          onlyOne: true);
    }

    // await canLaunchUrl(whatsappUrl).then((can) async => (can)
    //     ? await launchUrl(whatsappUrl)
    //     : {
    //         Logger().e('Could not launch WhatsApp.'),
    //         BotToast.showSimpleNotification(
    //             title: "title: Could not launch WhatsApp",
    //             titleStyle: AppTextStyle.kSmallBodyText
    //                 .copyWith(color: AppColors.prismWhite),
    //             backgroundColor: AppColors.prismRed_40,
    //             onlyOne: true),
    //       });
    // if (await canLaunchUrl(whatsappUrl)) {
    //   await launchUrl(whatsappUrl);
    // } else {
    //
    // }
  }
}
