//This class represents the sounds of the game

class Sound {
  AudioPlayer hit;
  AudioPlayer end;
  AudioPlayer gameSong;
  Minim minim;

  Sound(Minim minim, AudioPlayer hit, AudioPlayer end, AudioPlayer gameSong) {
    this.minim = minim;
    this.hit = hit;
    this.end = end;
    this.gameSong = gameSong;
  }

  void play() {
    gameSong.play();
  }

  void playHit() {
    hit.play();
    hit = minim.loadFile("brick.mp3");
  }

  void gameEnded() {
    end.play();
  }
  
  void stopMusic() {
    gameSong.close();
    gameSong = minim.loadFile("gameSong.mp3");
  }
  
  void stopAllMusic(){
    end.close();
  }
  
  void mute() {
    if (gameSong.isMuted()) {
      gameSong.unmute();
    } 
    else {
      gameSong.mute();
    }
  }
}

