package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class MediaEmbed {
    private String content;
    private Long width;
    private Boolean scrolling;
    private Long height;
    private String mediaDomainURL;

    @JsonProperty("content")
    public String getContent() { return content; }
    @JsonProperty("content")
    public void setContent(String value) { this.content = value; }

    @JsonProperty("width")
    public Long getWidth() { return width; }
    @JsonProperty("width")
    public void setWidth(Long value) { this.width = value; }

    @JsonProperty("scrolling")
    public Boolean getScrolling() { return scrolling; }
    @JsonProperty("scrolling")
    public void setScrolling(Boolean value) { this.scrolling = value; }

    @JsonProperty("height")
    public Long getHeight() { return height; }
    @JsonProperty("height")
    public void setHeight(Long value) { this.height = value; }

    @JsonProperty("media_domain_url")
    public String getMediaDomainURL() { return mediaDomainURL; }
    @JsonProperty("media_domain_url")
    public void setMediaDomainURL(String value) { this.mediaDomainURL = value; }
}
