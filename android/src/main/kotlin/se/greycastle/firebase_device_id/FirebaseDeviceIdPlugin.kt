package se.greycastle.firebase_device_id

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import com.google.firebase.installations.FirebaseInstallations

/** FirebaseDeviceIdPlugin */
class FirebaseDeviceIdPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "firebase_device_id")
    channel.setMethodCallHandler(this)
  }

  private fun getDeviceToken(callback: (String?, String?) -> Unit) {
    // Based on:
    // https://firebase.google.com/docs/projects/manage-installations#retrieve-fis-token
    FirebaseInstallations.getInstance().getToken(/* force refresh */ true)
      .addOnCompleteListener { task ->
        if (task.isSuccessful) {
          callback(task.result?.token, null)
        } else {
          callback(null, "Unable to get token")
        }
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getDeviceToken") {
      getDeviceToken { token, error ->
        if (error != null) {
          result.error("1", error, null)
        } else {
          result.success(token)
        }
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
