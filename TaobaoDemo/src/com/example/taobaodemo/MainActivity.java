package com.example.taobaodemo;

import com.taobao.top.android.TopAndroidClient;
import android.os.Bundle;
import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.view.View.OnClickListener;

public class MainActivity extends Activity {

	private Button button;
	private TopAndroidClient client;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		button = (Button) findViewById(R.id.button1);
		TopAndroidClient.registerAndroidClient(getApplicationContext(),
				"appkey", "appsecret", "callbackUrl");
		client = TopAndroidClient.getAndroidClientByAppKey("appkey");
		button.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				client.authorize(MainActivity.this);
				// client.api(params, userId, listener, async);
				System.out.println(client.getContext());
				finish();
			}
		});
	}

}
