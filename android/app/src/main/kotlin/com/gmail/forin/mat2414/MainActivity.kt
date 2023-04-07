package com.gmail.forin.mat2414

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val HTTPS = "https://"
    private val HTTP = "http://"
    private val URL_LINK_CHANNEL = "com.gmail.forin.mat2414/url_link"
    private val EVENT_CHANNEL = "com.gmail.forin.mat2414/openLink"
    private lateinit var channel: MethodChannel
    private lateinit var eventChannel: EventChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        println("MainActivity :4 FlutterActivity() configureFlutterEngine")

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, URL_LINK_CHANNEL)
        // eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)

        // eventChannel.setStreamHandler(MyStreamHandler(context))

        // Receive data from Flutter
        channel.setMethodCallHandler { call, _ ->
            // listen to the method (name have to match!) invoked on the Flutter site
            // -> await batteryChannel.invokeMethod('method');
            println("MainActivity :5 FlutterActivity() channel.setMethodCallHandler ${call.arguments()  as Map<String, String>?}")
            if (call.method == "openUrl") {
                // access passed data
                val args = call.arguments() as Map<String, String>?
                // var link = args?.get("link")
                val link = call.argument<String>("link") ?: "https://www.jw.org/bg";
                println("link6: $link")
//                if (!link.isNullOrEmpty() && !link.startsWith(HTTP) && !link.startsWith(HTTPS)) {
//                    link = HTTP + link;
//                }
            /*    val webpage: Uri = Uri.parse(link)
                println("webpage: $webpage")
                val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("http://www.jw.org/bg"))
                if (browserIntent.resolveActivity(packageManager) != null) {
                    startActivity(browserIntent)
                }*/
                // call Android native API
                openUrl(link);

                // use result to send data back to Flutter
            }
        }
    }


    private fun openUrl(url: String) {
        println("MainActivity :7 FlutterActivity() openUrl: $url")
//        println("MainActivity : FlutterActivity() openUrl $url")
        var link = url;
        if (!link.startsWith(HTTP) && !link.startsWith(HTTPS)) {
            link = HTTP + link;
        }
//        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("http://www.google.com"))
//        startActivity(browserIntent)
        val webpage: Uri = Uri.parse(link)
        val browserIntent = Intent(Intent.ACTION_VIEW, webpage)
        //startActivity(browserIntent)
         if (browserIntent.resolveActivity(packageManager) != null) {
             startActivity(browserIntent)
         }

    }


}

class MyStreamHandler(private val context: Context) : EventChannel.StreamHandler {
    private var receiver: BroadcastReceiver? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        if (events == null) return
        receiver = initReceiver(events)
        // register receiver
        context.registerReceiver(receiver, IntentFilter(Intent.ACTION_VIEW))
    }

    override fun onCancel(arguments: Any?) {
        context.unregisterReceiver(receiver)
        receiver = null
    }

    private fun initReceiver(events: EventChannel.EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context?, intent: Intent) {

            }
        }
    }

}
