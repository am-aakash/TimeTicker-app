import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timer_bloc.dart';
import 'package:flutter_timer/src/ticker.dart';
import 'background.dart';
import 'timer_text.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      child: TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    print(duration);
    //final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = duration;
    //(duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$secondsStr s',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

/*
The Actions widget is just another StatelessWidget which uses a BlocBuilder to rebuild the UI every time we get a new TimerState. 
Actions uses context.read<TimerBloc>() to access the TimerBloc instance 
and returns different FloatingActionButtons based on the current state of the TimerBloc. 
Each of the FloatingActionButtons adds an event in its onPressed callback to notify the TimerBloc.

If you want fine-grained control over when the builder function is called you can provide an optional buildWhen to BlocBuilder. 
The buildWhen takes the previous bloc state and current bloc state and returns a boolean. 
If buildWhen returns true, builder will be called with state and the widget will rebuild. 
If buildWhen returns false, builder will not be called with state and no rebuild will occur.
In this case, we don’t want the Actions widget to be rebuilt on every tick because that would be inefficient. 
Instead, we only want Actions to rebuild if the runtimeType of the TimerState changes 
(TimerInitial => TimerRunInProgress, TimerRunInProgress => TimerRunPause, etc...).
*/

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
          ],
        );
      },
    );
  }
}
