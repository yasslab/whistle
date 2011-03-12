/***
 * Excerpted from "Hello, Android! 3e",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/eband3 for more book information.
***/
package org.sorarier.whistle;

import android.app.Activity;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.KeyEvent;

public class Whistle extends Activity {
   private MediaPlayer mp;

   @Override
   public void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.main);
      setVolumeControlStream(AudioManager.STREAM_MUSIC);
   }

   @Override
   public boolean onKeyDown(int keyCode, KeyEvent event) {
      int resId;
      switch (keyCode) {
      case KeyEvent.KEYCODE_DPAD_UP:
         resId = R.raw.up;
         break;
      case KeyEvent.KEYCODE_DPAD_DOWN:
         resId = R.raw.down;
         break;
      case KeyEvent.KEYCODE_DPAD_LEFT:
         resId = R.raw.left;
         break;
      case KeyEvent.KEYCODE_DPAD_RIGHT:
         resId = R.raw.right;
         break;
      case KeyEvent.KEYCODE_DPAD_CENTER:
      case KeyEvent.KEYCODE_ENTER:
         resId = R.raw.enter;
         break;
      case KeyEvent.KEYCODE_A:
         resId = R.raw.a;
         break;
      case KeyEvent.KEYCODE_S:
         resId = R.raw.s;
         break;
      case KeyEvent.KEYCODE_D:
         resId = R.raw.d;
         break;
      case KeyEvent.KEYCODE_F:
         resId = R.raw.f;
         break;
      case KeyEvent.KEYCODE_W:
	resId = R.raw.whistle;
      default:
         return super.onKeyDown(keyCode, event);
      }

      // Release any resources from previous MediaPlayer
      if (mp != null) {
         mp.release(); 
      }

      // Create a new MediaPlayer to play this sound
      mp = MediaPlayer.create(this, resId); 
      mp.start();
      
      // Indicate this key was handled
      return true;
   }
}
