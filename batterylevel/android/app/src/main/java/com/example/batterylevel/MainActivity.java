package com.example.batterylevel;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.content.ContextWrapper;

import io.flutter.Log;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "samples.flutter.io/battery";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    GeneratedPluginRegistrant.registerWith(this);
    MethodChannel channel =  new MethodChannel(getFlutterView(), CHANNEL);
    channel.setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
         if (methodCall.method.equals("getBatteryLevel")) {
           Log.d("***********","3333333333333333");
           int batteryLevel = getBatteryLevel();
           if (batteryLevel == -1) {
             Log.d("***********","4444444444444444444");
             result.success(batteryLevel);
           } else {
             Log.d("***********","555555555555555555");
             result.error("UNAVAILABLE","Battery level not available.",null);
           }
         } else {
           Log.d("***********","66666666666");
           result.notImplemented();
         }
      }
    });
  }

  private int getBatteryLevel(){
    int batteryLevel = -1;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager)getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
      Log.d("***********","11111111111111");
    } else {
      Intent intent = new ContextWrapper(getApplication())
              .registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE, - 1);
      Log.d("***********","22222222222222");
    }
    return  batteryLevel;
  }
}
