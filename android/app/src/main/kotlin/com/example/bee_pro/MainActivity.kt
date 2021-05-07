package com.example.bee_pro

import android.content.ActivityNotFoundException
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val CHANNEL = "uz.colibrisoft.beepro/ussd_call"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val mFilter = IntentFilter("REFRESH")
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "ussd_request" -> {
                    val ussdCode = call.argument<String>("ussd_text")
                    USSD_Call(ussdCode)
                    //result.success(batteryLevel)
                }
                "app_intent" -> {
                    try {
                        val packageName = call.argument<String>("pack_name")
                        openAppIntent(packageName)
                    }catch (e: Exception){
                        Log.i("TypeCasting","Type exception caught")
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun USSD_Call(ussd_code: String?): Unit {
        val encodedHash: String = Uri.encode("#")
        when {
            !ussd_code.equals("") -> {
                startActivityForResult(Intent("android.intent.action.CALL",
                        Uri.parse("tel:$ussd_code$encodedHash")), 1)
            }
        }
    }
    private fun openAppIntent(package_name: String?): Unit {
        when {
            package_name != "" -> {
                try {
                    val openAppIntent = packageManager.getLaunchIntentForPackage(package_name.toString())
                    openAppIntent?.addCategory(Intent.CATEGORY_LAUNCHER)
                    if(openAppIntent != null){
                        startActivity(openAppIntent)
                    }else {
                        throw ActivityNotFoundException()
                    }
                }catch (e: ActivityNotFoundException){
                    Log.i("open Intent Error", "Error: $e")
                    startActivity(Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=$package_name")))
                }
            }
        }
    }
}
