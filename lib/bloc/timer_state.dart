part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();
  
  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {}
