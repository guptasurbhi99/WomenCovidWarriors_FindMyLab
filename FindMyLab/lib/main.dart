// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import './screens/login.dart';
import './screens/user_dashboard.dart';
import './screens/owner_dashboard.dart';
import './screens/loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/user_dashboard': (context) => UserDashboard(),
      '/owner_dashboard': (context) => OwnerDashboard()
    }
));