package com.example.aaron.listview;

import android.os.StrictMode;
import android.util.Log;

public class Application extends android.app.Application{
  @Override
  public void onCreate() {
    Log.d("Application", "onCreate");
    StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder()
        .detectAll()
        .penaltyLog()
        .build()
    );
    StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder()
        .detectActivityLeaks()
        .penaltyLog()
        .penaltyDeath()
        .build()
    );

    super.onCreate();
  }
}
