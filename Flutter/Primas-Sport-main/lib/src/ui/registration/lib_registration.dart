library lib_registration;

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:primas_sport/src/data/models/account.dart';
import 'package:primas_sport/src/data/services/accountsService.dart';

import 'shared/builder.dart';
import 'shared/primary_button.dart';

import '../../data/ultis/ultis.dart';
import '../../ui/bottom_navigation/lib_botnav.dart';

part 'components/signup.dart';
part 'components/login.dart';
