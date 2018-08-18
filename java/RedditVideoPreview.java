package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class RedditVideoPreview {
    private String fallbackURL;
    private long height;
    private long width;
    private String scrubberMediaURL;
    private String dashURL;
    private long duration;
    private String hlsURL;
    private boolean isGIF;
    private String transcodingStatus;

    @JsonProperty("fallback_url")
    public String getFallbackURL() { return fallbackURL; }
    @JsonProperty("fallback_url")
    public void setFallbackURL(String value) { this.fallbackURL = value; }

    @JsonProperty("height")
    public long getHeight() { return height; }
    @JsonProperty("height")
    public void setHeight(long value) { this.height = value; }

    @JsonProperty("width")
    public long getWidth() { return width; }
    @JsonProperty("width")
    public void setWidth(long value) { this.width = value; }

    @JsonProperty("scrubber_media_url")
    public String getScrubberMediaURL() { return scrubberMediaURL; }
    @JsonProperty("scrubber_media_url")
    public void setScrubberMediaURL(String value) { this.scrubberMediaURL = value; }

    @JsonProperty("dash_url")
    public String getDashURL() { return dashURL; }
    @JsonProperty("dash_url")
    public void setDashURL(String value) { this.dashURL = value; }

    @JsonProperty("duration")
    public long getDuration() { return duration; }
    @JsonProperty("duration")
    public void setDuration(long value) { this.duration = value; }

    @JsonProperty("hls_url")
    public String getHLSURL() { return hlsURL; }
    @JsonProperty("hls_url")
    public void setHLSURL(String value) { this.hlsURL = value; }

    @JsonProperty("is_gif")
    public boolean getIsGIF() { return isGIF; }
    @JsonProperty("is_gif")
    public void setIsGIF(boolean value) { this.isGIF = value; }

    @JsonProperty("transcoding_status")
    public String getTranscodingStatus() { return transcodingStatus; }
    @JsonProperty("transcoding_status")
    public void setTranscodingStatus(String value) { this.transcodingStatus = value; }
}
