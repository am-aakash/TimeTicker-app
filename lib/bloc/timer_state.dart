part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [];
}

/*
  States for the app:
  - TimerInitial — ready to start counting down from the specified duration.
  - TimerRunInProgress — actively counting down from the specified duration.
  - TimerRunPause — paused at some remaining duration.
  - TimerRunComplete — completed with a remaining duration of 0.
*/
class TimerInitial extends TimerState {
  //if the state is TimerInitial the user will be able to start the timer
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunPause extends TimerState {
  //if the state is TimerRunInProgress the user will be able to pause and reset the timer as well as see the remaining duration
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgress extends TimerState {
  //if the state is TimerRunPause the user will be able to resume the timer and reset the timer
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunComplete extends TimerState {
  //if the state is TimerRunComplete the user will be able to reset the timer
  const TimerRunComplete() : super(0);
}


/* 
Note that all of the TimerStates extend the abstract base class TimerState 
which has a duration property.
This is because no matter what state our TimerBloc is in, we want to know how much time is remaining. 

Additionally, TimerState extends Equatable to optimize our code 
by ensuring that our app does not trigger rebuilds if the same state occurs. 
*/