import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notif/presentation/atomic/atom/custom_outlined_button.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.dateTime,
    required this.description,
    required this.onTriggerOne,
    required this.onTriggerTwo,
    required this.onRemove,
  });

  final DateTime dateTime;
  final String description;

  final VoidCallback onTriggerOne;
  final VoidCallback onTriggerTwo;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Container(
        padding:
            const EdgeInsets.only(top: 14, left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(248, 250, 251, 1),
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: const Color.fromRGBO(106, 77, 186, 1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //todo: if hasIcon then show it
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Time: ',
                        style: Theme.of(context).textTheme.bodyMedium!,
                        children: [
                          TextSpan(
                            text: _formatDateTime(dateTime),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'Message: ',
                        style: Theme.of(context).textTheme.bodyMedium!,
                        children: [
                          TextSpan(
                            text: description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: onRemove,
                      child: SvgPicture.asset(
                        'assets/icons/delete.svg',
                        colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlinedButton(
                  textLabel: 'Select triger 1',
                  onPressed: onTriggerOne,
                ),
                CustomOutlinedButton(
                  textLabel: 'Select triger 2',
                  onPressed: onTriggerTwo,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime time) =>
      DateFormat(DateFormat.HOUR24_MINUTE).format(time);
}
