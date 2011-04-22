package org.sorarier.whistle;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.media.AudioManager;
import android.content.Context;

public class Whistle extends Activity implements OnClickListener{
    private MediaPlayer mp;
    private int resId;
    private boolean whistling;
    private View whistleBtn;
    private AudioManager audio;
    private int maxVol;
    private int currentVol;
    
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        // var setting
        resId = R.raw.whistle;
        whistling = false;
        
        // Set up click listeners for all the buttons.
        whistleBtn = findViewById(R.id.whistle_button);
        whistleBtn.setOnClickListener(this);   
        whistleBtn.setBackgroundResource(R.drawable.btn_on);
        
        // This is corresponding to the side buttons.
        setVolumeControlStream(AudioManager.STREAM_MUSIC);
        
        // audio setting
        audio = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        currentVol = audio.getStreamVolume(AudioManager.STREAM_MUSIC);
        maxVol = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        audio.setStreamVolume(AudioManager.STREAM_MUSIC, maxVol, AudioManager.FLAG_SHOW_UI);
        audio.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
    }
    
    @Override
    public void onStop(){ // This method is called when rotating portrait to landscape and vice versa.
	    super.onStop();
	    //Toast.makeText(this, "onStop", Toast.LENGTH_LONG).show();
	    if(mp != null){
		mp.release();
		whistleBtn.setBackgroundResource(R.drawable.btn_on);
		whistling = false;
	    }
	    audio.setStreamVolume(AudioManager.STREAM_MUSIC, currentVol, 0);
	    return;
    }
    
    
    public void onClick(View v){
	    // Release any resources from previous MediaPlayer
	    if(mp != null){
		mp.release();
	    }
	    switch (v.getId()){
	    case R.id.whistle_button:
		    if(whistling == false){
			    v.setBackgroundResource(R.drawable.btn_off);
			    // Create a new MediaPlayer to play this sound
			    mp = MediaPlayer.create(this, resId);
			    mp.setVolume(1.0f, 1.0f);
			    mp.setLooping(true);			    
			    mp.start();			    
			    
			    whistling = true;
			    return;
		    }else{
			    v.setBackgroundResource(R.drawable.btn_on);
			    whistling = false;
			    return;
		    }
	    default:
		return;
	    }
    }
}
