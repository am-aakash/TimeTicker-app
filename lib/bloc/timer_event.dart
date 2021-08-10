part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

/*
Our TimerBloc will need to know how to process the following events:
    TimerStarted — informs the TimerBloc that the timer should be started.
    TimerPaused — informs the TimerBloc that the timer should be paused.
    TimerResumed — informs the TimerBloc that the timer should be resumed.
    TimerReset — informs the TimerBloc that the timer should be reset to the original state.
    TimerTicked — informs the TimerBloc that a tick has occurred 
    and that it needs to update its state accordingly.
*/

class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
