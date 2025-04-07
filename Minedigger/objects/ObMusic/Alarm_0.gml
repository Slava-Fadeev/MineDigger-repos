if ObPlayer.Depth >= 0 and ObPlayer.Depth <= 10{audio_sound_gain(global.musCave,ObPlayer.Depth / 10,500)}
if ObPlayer.Depth <= 0{audio_sound_gain(global.musCave,0,500)}
if ObPlayer.Depth >= 10{audio_sound_gain(global.musCave,1,500)}
alarm[0] = 30