package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Preview {
    private Image[] images;
    private boolean enabled;

    @JsonProperty("images")
    public Image[] getImages() { return images; }
    @JsonProperty("images")
    public void setImages(Image[] value) { this.images = value; }

    @JsonProperty("enabled")
    public boolean getEnabled() { return enabled; }
    @JsonProperty("enabled")
    public void setEnabled(boolean value) { this.enabled = value; }
}
