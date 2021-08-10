import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/timer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class TimerText extends StatelessWidget {
//   const TimerText({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final duration = context.select((TimerBloc bloc) => bloc.state.duration);
//     print(duration);
//     //final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
//     final secondsStr = duration;
//     //(duration % 60).floor().toString().padLeft(2, '0');
//     return Text(
//       '$secondsStr s',
//       style: Theme.of(context).textTheme.headline1,
//     );
//   }
// }
