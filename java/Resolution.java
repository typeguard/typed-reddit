package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Resolution {
    private String url;
    private long width;
    private long height;

    @JsonProperty("url")
    public String getUrl() { return url; }
    @JsonProperty("url")
    public void setUrl(String value) { this.url = value; }

    @JsonProperty("width")
    public long getWidth() { return width; }
    @JsonProperty("width")
    public void setWidth(long value) { this.width = value; }

    @JsonProperty("height")
    public long getHeight() { return height; }
    @JsonProperty("height")
    public void setHeight(long value) { this.height = value; }
}
