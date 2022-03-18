/// Support for doing something awesome.
///
/// More dartdocs go here.
library auth;

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'src/user_entity.dart';
part 'src/auth_service.dart';
part 'src/auth_error.dart';
part 'src/firebase_auth_service.dart';
part 'src/firebase_init_service.dart';
part 'src/sign_in_services/sign_in_services_factory.dart';
part 'src/sign_in_services/sign_in_service_interface.dart';
part 'src/sign_in_services/apple/apple_credentials.dart';
part 'src/sign_in_services/apple/apple_sign_in_service.dart';
part 'src/sign_in_services/facebook/facebook_sign_in_service.dart';
part 'src/sign_in_services/google/google_sign_in_service.dart';
part 'auth.g.dart';
