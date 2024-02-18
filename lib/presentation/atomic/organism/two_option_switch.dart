import 'package:flutter/material.dart';

class TwoOptionSwitcher extends StatefulWidget {
  const TwoOptionSwitcher({
    super.key,
    required this.isFirstItemSelected,
    required this.onPressed,
    required this.options,
  });

  final bool isFirstItemSelected;
  final VoidCallback onPressed;
  final List<String> options;

  @override
  State<TwoOptionSwitcher> createState() => _TwoOptionSwitcherState();
}

class _TwoOptionSwitcherState extends State<TwoOptionSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        key: Key(
          widget.options.toString() + widget.isFirstItemSelected.toString(),
        ),
        children: [
          Flexible(
            child: OptionSwitcherButton(
              labelText: '',
              isSelected: widget.isFirstItemSelected,
              onPressed: () {
                if (!widget.isFirstItemSelected) {
                  widget.onPressed();
                }
              },
              icon: Icons.alarm_outlined,
              text: widget.options.first,
            ),
          ),
          Flexible(
            child: OptionSwitcherButton(
              isSelected: !widget.isFirstItemSelected,
              labelText: '',
              onPressed: () {
                if (widget.isFirstItemSelected) {
                  widget.onPressed();
                }
              },
              icon: Icons.history,
              text: widget.options.last,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionSwitcherButton extends StatelessWidget {
  const OptionSwitcherButton({
    super.key,
    required this.labelText,
    this.onPressed,
    required this.isSelected,
    required this.icon,
    required this.text,
  });

  final String labelText;
  final VoidCallback? onPressed;
  final bool isSelected;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final activePrimaryColor =
        isSelected ? const Color.fromRGBO(106, 77, 186, 1) : Colors.white;
    final activeTextColor = isSelected ? Colors.white : Colors.black;

    return Material(
      child: InkWell(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: activePrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: activeTextColor,
                ),
                const SizedBox(width: 6),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: activeTextColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
