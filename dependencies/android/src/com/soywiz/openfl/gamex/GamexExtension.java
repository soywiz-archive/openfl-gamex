package com.soywiz.openfl.gamex;


import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.RelativeLayout;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import org.haxe.extension.Extension;

public class GamexExtension extends Extension {

	static RelativeLayout adLayout;
	static RelativeLayout.LayoutParams adMobLayoutParams;
	static AdView adView;
	static Boolean adVisible = false, adInitialized = false, adTestMode = false;
	static InterstitialAd interstitial;

	/**
	 * Called when an activity you launched exits, giving you the requestCode
	 * you started it with, the resultCode it returned, and any additional data
	 * from it.
	 */
	public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
		return true;
	}


	/**
	 * Called when the activity is starting.
	 */
	public void onCreate(Bundle savedInstanceState) {


	}


	/**
	 * Perform any final cleanup before an activity is destroyed.
	 */
	public void onDestroy() {


	}


	/**
	 * Called as part of the activity lifecycle when an activity is going into
	 * the background, but has not (yet) been killed.
	 */
	public void onPause() {


	}


	/**
	 * Called after {@link #onStop} when the current activity is being
	 * re-displayed to the user (the user has navigated back to it).
	 */
	public void onRestart() {


	}


	/**
	 * Called after {@link #onRestart}, or {@link #onPause}, for your activity
	 * to start interacting with the user.
	 */
	public void onResume() {
	}


	/**
	 * Called after {@link #onCreate} &mdash; or after {@link #onRestart} when
	 * the activity had been stopped, but is now again being displayed to the
	 * user.
	 */
	public void onStart() {
	}


	/**
	 * Called when the activity is no longer visible to the user, because
	 * another activity has been resumed and is covering this one.
	 */
	public void onStop() {


	}

	static public void loadAd() {
		AdRequest adRequest = new AdRequest.Builder().build();
		adView.loadAd(adRequest);
	}

	static public void initAd(final String id, final int x, final int y, final boolean testMode) {
		mainActivity.runOnUiThread(new Runnable() {
			public void run() {
				String adID = id;
				adTestMode = testMode;

				if (mainActivity == null) {
					return;
				}

				adView = new AdView(mainActivity);
				adView.setAdUnitId(adID);
				//adView.setAdSize(AdSize.SMART_BANNER);
				adView.setAdSize(AdSize.BANNER);

				loadAd();
				adMobLayoutParams = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.WRAP_CONTENT, RelativeLayout.LayoutParams.WRAP_CONTENT);

				switch (x) {
					case 0: adMobLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_LEFT); break;
					case 1: adMobLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_RIGHT); break;
					case 2: adMobLayoutParams.addRule(RelativeLayout.CENTER_HORIZONTAL); break;
				}

				switch (y) {
					case 0: adMobLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_TOP); break;
					case 1: adMobLayoutParams.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM); break;
					case 2: adMobLayoutParams.addRule(RelativeLayout.CENTER_VERTICAL); break;
				}

				adInitialized = true;
			}
		});
	}

	static public void showAd() {
		mainActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (adInitialized && !adVisible) {
					adLayout.removeAllViews();
					adView.setBackgroundColor(Color.BLACK);
					adLayout.addView(adView, adMobLayoutParams);
					adView.setBackgroundColor(0);
					adVisible = true;
				}
			}
		});
	}

	static public void hideAd() {
		mainActivity.runOnUiThread(new Runnable() {
			public void run() {
				if (adInitialized && adVisible) {
					adLayout.removeAllViews();
					loadAd();
					adVisible = false;
				}
			}
		});
	}
}