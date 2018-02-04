package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Variants {
    private GIF gif;
    private GIF mp4;

    @JsonProperty("gif")
    public GIF getGif() { return gif; }
    @JsonProperty("gif")
    public void setGif(GIF value) { this.gif = value; }

    @JsonProperty("mp4")
    public GIF getMp4() { return mp4; }
    @JsonProperty("mp4")
    public void setMp4(GIF value) { this.mp4 = value; }
}
