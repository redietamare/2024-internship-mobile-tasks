import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}
class registering extends UserState {
  registering();

}
class registered extends UserState {
  registered();
}
class registerfailure extends UserState {
  final String message;
  registerfailure(this.message);
}
class logging extends UserState {
  logging();

}
class logged extends UserState {
  logged();
}
class logginfailure extends UserState {
  final String message;
  logginfailure(this.message);
}
