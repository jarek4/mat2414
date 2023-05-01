package com.gmail.forin.mat2414

import android.content.*
import android.net.Uri
import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val HTTPS = "https://"
    private val HTTP = "http://"
    private val URL_LINK_CHANNEL = "com.gmail.forin.mat2414/url_link"
    private lateinit var channel: MethodChannel


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, URL_LINK_CHANNEL)
        // eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)

        // eventChannel.setStreamHandler(MyStreamHandler(context))

        // Receive data from Flutter
        channel.setMethodCallHandler { call, _ ->
            // listen to the method (name have to match!) invoked on the Flutter site
            // -> await batteryChannel.invokeMethod('method');
            when (call.method) {
                "openUrl" -> {
                    // access passed data
                    // val args = call.arguments() as Map<String, String>?
                    // var link = args?.get("link")
                    val link = call.argument<String>("link") ?: "https://www.jw.org/bg";
                    println("link6: $link")
                    openUrl(link);
                }
                "openMailTo" -> {
                    val to = call.argument<String>("mailTo") ?: "4forin@gmail.com";
                    val subject = call.argument<String>("subject") ?: "subject";
                    val from = call.argument<String>("from") ?: "_";
                    sendEmail(to, subject, from)
                }
                else -> {
                    print("native method not found")
                }
            }
        }
    }


    private fun openUrl(url: String) {
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

    private fun sendEmail(to: String, subject: String, from: String) {
        try {
//            val intent = Intent(Intent.ACTION_SENDTO)
//            intent.data = Uri.parse("mailto:") // only email apps should handle this
//            intent.putExtra(Intent.EXTRA_EMAIL, arrayOf("adt@wp.pl"))
//            intent.putExtra(Intent.EXTRA_SUBJECT, subject)
//            intent.putExtra(Intent.EXTRA_TEXT, from)
            val intent = Intent(Intent.ACTION_SENDTO).apply {
                type = "text/plain"
                data = Uri.parse("mailto:")
                putExtra(Intent.EXTRA_EMAIL, arrayOf(to))
                putExtra(Intent.EXTRA_SUBJECT, subject)
                putExtra(Intent.EXTRA_TEXT, from)
            }
            if (intent.resolveActivity(packageManager) != null) {
                startActivity(intent)
            }
        } catch (e: Exception) {
            println("MainActivity sendEmail Exception: $e")
        }
    }


}