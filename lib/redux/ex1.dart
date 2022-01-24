// part of 'my_form_bloc.dart';

// class MyFormState extends Equatable {
//   const MyFormState({
//     this.email = const Email.pure(),
//     this.password = const Password.pure(),
//     this.status = FormzStatus.pure,
//   });

//   final Email email;
//   final Password password;
//   final FormzStatus status;

//   MyFormState copyWith({
//     Email? email,
//     Password? password,
//     FormzStatus? status,
//   }) {
//     return MyFormState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object> get props => [email, password, status];
// }
// part of 'my_form_bloc.dart';

// abstract class MyFormEvent extends Equatable {
//   const MyFormEvent();

//   @override
//   List<Object> get props => [];
// }

// class EmailChanged extends MyFormEvent {
//   const EmailChanged({required this.email});

//   final String email;

//   @override
//   List<Object> get props => [email];
// }

// class EmailUnfocused extends MyFormEvent {}

// class PasswordChanged extends MyFormEvent {
//   const PasswordChanged({required this.password});

//   final String password;

//   @override
//   List<Object> get props => [password];
// }

// class PasswordUnfocused extends MyFormEvent {}

// class FormSubmitted extends MyFormEvent {}
// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_form_validation/models/models.dart';
// import 'package:formz/formz.dart';

// part 'my_form_event.dart';
// part 'my_form_state.dart';

// class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
//   MyFormBloc() : super(const MyFormState()) {
//     on<EmailChanged>(_onEmailChanged);
//     on<PasswordChanged>(_onPasswordChanged);
//     on<EmailUnfocused>(_onEmailUnfocused);
//     on<PasswordUnfocused>(_onPasswordUnfocused);
//     on<FormSubmitted>(_onFormSubmitted);
//   }

//   @override
//   void onTransition(Transition<MyFormEvent, MyFormState> transition) {
//     print(transition);
//     super.onTransition(transition);
//   }

//   void _onEmailChanged(EmailChanged event, Emitter<MyFormState> emit) {
//     final email = Email.dirty(event.email);
//     emit(state.copyWith(
//       email: email.valid ? email : Email.pure(event.email),
//       status: Formz.validate([email, state.password]),
//     ));
//   }

//   void _onPasswordChanged(PasswordChanged event, Emitter<MyFormState> emit) {
//     final password = Password.dirty(event.password);
//     emit(state.copyWith(
//       password: password.valid ? password : Password.pure(event.password),
//       status: Formz.validate([state.email, password]),
//     ));
//   }

//   void _onEmailUnfocused(EmailUnfocused event, Emitter<MyFormState> emit) {
//     final email = Email.dirty(state.email.value);
//     emit(state.copyWith(
//       email: email,
//       status: Formz.validate([email, state.password]),
//     ));
//   }

//   void _onPasswordUnfocused(
//       PasswordUnfocused event,
//       Emitter<MyFormState> emit,
//       ) {
//     final password = Password.dirty(state.password.value);
//     emit(state.copyWith(
//       password: password,
//       status: Formz.validate([state.email, password]),
//     ));
//   }

//   void _onFormSubmitted(FormSubmitted event, Emitter<MyFormState> emit) async {
//     final email = Email.dirty(state.email.value);
//     final password = Password.dirty(state.password.value);
//     emit(state.copyWith(
//       email: email,
//       password: password,
//       status: Formz.validate([email, password]),
//     ));
//     if (state.status.isValidated) {
//       emit(state.copyWith(status: FormzStatus.submissionInProgress));
//       await Future<void>.delayed(const Duration(seconds: 1));
//       emit(state.copyWith(status: FormzStatus.submissionSuccess));
//     }
//   }
// }