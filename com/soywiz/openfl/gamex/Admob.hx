package com.soywiz.openfl.gamex;

import com.soywiz.openfl.gamex.Admob.Layout;
import flash.Lib;

class Admob {
	private static var LEFT : Int = 0;
	private static var RIGHT : Int = 1;
	private static var CENTER : Int = 2;
	private static var TOP : Int = 0;
	private static var BOTTOM : Int = 1;
	
	private static var BANNER_PORTRAIT : Int = 0;
	private static var BANNER_LANDSCAPE : Int = 1;
	
	private static var admobID : String;
	private static var originX : Int = 0;
	private static var originY : Int = 0;
	private static var bannerSize : Int = 0;
	private static var testMode : Bool = false;

	private static var admobInterstitialID:String;
	private static var testModeInterstitial:Bool;

	private static var _initAd_func : Dynamic;
	private static var _hideAd_func : Dynamic;
	private static var _showAd_func : Dynamic;
	private static var _initInterstitial_func : Dynamic;
	private static var _showInterstitial_func : Dynamic;

	private static inline var GamexExtension:String = "com.soywiz.openfl.gamex.GamexExtension";
	
	public function new(id : String, layout: Layout, test : Bool = false) {
		var x = CENTER;
		var y = BOTTOM;
		var size = BANNER_PORTRAIT;

		switch (layout) {
			case Layout.TOP_LEFT: y = TOP; x = LEFT;
			case Layout.TOP_CENTER: y = TOP; x = CENTER;
			case Layout.TOP_RIGHT: y = TOP; x = RIGHT;

			case Layout.CENTER_LEFT: y = CENTER; x = LEFT;
			case Layout.CENTER_CENTER: y = CENTER; x = CENTER;
			case Layout.CENTER_RIGHT: y = CENTER; x = RIGHT;

			case Layout.BOTTOM_LEFT: y = BOTTOM; x = LEFT;
			case Layout.BOTTOM_CENTER: y = BOTTOM; x = CENTER;
			case Layout.BOTTOM_RIGHT: y = BOTTOM; x = RIGHT;
		}

		#if android
			if (_initAd_func == null) _initAd_func = openfl.utils.JNI.createStaticMethod(GamexExtension, "initAd", "(Ljava/lang/String;IIZ)V", true);
			var args = new Array<Dynamic>();
			args.push(id);
			args.push(x);
			args.push(y);
			args.push(test);
			_initAd_func(args);
		#else
		#end
	}

	public function show() : Void {
		#if android
			if (_showAd_func == null) _showAd_func = openfl.utils.JNI.createStaticMethod(GamexExtension, "showAd", "()V", true);
			_showAd_func(new Array<Dynamic>());
		#else
		#end
	}
	
	public function hide() : Void {
		#if android
			if (_hideAd_func == null) _hideAd_func = openfl.utils.JNI.createStaticMethod(GamexExtension, "hideAd", "()V", true);
			_hideAd_func(new Array<Dynamic>());
		#else
		#end
	}

	public function refresh() : Void {
		#if android
		#else
		#end
	}

	/*
	public static function initInterstitial(id : String, test : Bool = false) {
		#if android
			admobInterstitialID = id;
			testModeInterstitial = test;

			// call API
			if (_initInterstitial_func == null) {
				_initInterstitial_func = openfl.utils.JNI.createStaticMethod(GamexExtension, "initInterstitial", "(Ljava/lang/String;Z)V", true);
			}

			var args = new Array<Dynamic>();
			args.push(admobInterstitialID);
			args.push(testModeInterstitial);
			_initInterstitial_func(args);
		#else
		#end
	}

	public static function showInterstitial() : Void {
		#if android
			if (_showInterstitial_func == null) {
				_showInterstitial_func = openfl.utils.JNI.createStaticMethod(GamexExtension, "showInterstitial", "()V", true);
			}

			_showInterstitial_func(new Array<Dynamic>());
		#else
		#end
	}
	*/
}

enum Layout {
	TOP_LEFT;
	TOP_CENTER;
	TOP_RIGHT;

	CENTER_LEFT;
	CENTER_CENTER;
	CENTER_RIGHT;
	
	BOTTOM_LEFT;
	BOTTOM_CENTER;
	BOTTOM_RIGHT;
}