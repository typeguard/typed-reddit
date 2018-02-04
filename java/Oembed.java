package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Oembed {
    private ProviderURL providerURL;
    private String description;
    private String title;
    private long thumbnailWidth;
    private long height;
    private long width;
    private String html;
    private Version version;
    private ProviderName providerName;
    private String thumbnailURL;
    private OembedType type;
    private long thumbnailHeight;
    private String authorName;
    private String authorURL;

    @JsonProperty("provider_url")
    public ProviderURL getProviderURL() { return providerURL; }
    @JsonProperty("provider_url")
    public void setProviderURL(ProviderURL value) { this.providerURL = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("thumbnail_width")
    public long getThumbnailWidth() { return thumbnailWidth; }
    @JsonProperty("thumbnail_width")
    public void setThumbnailWidth(long value) { this.thumbnailWidth = value; }

    @JsonProperty("height")
    public long getHeight() { return height; }
    @JsonProperty("height")
    public void setHeight(long value) { this.height = value; }

    @JsonProperty("width")
    public long getWidth() { return width; }
    @JsonProperty("width")
    public void setWidth(long value) { this.width = value; }

    @JsonProperty("html")
    public String getHtml() { return html; }
    @JsonProperty("html")
    public void setHtml(String value) { this.html = value; }

    @JsonProperty("version")
    public Version getVersion() { return version; }
    @JsonProperty("version")
    public void setVersion(Version value) { this.version = value; }

    @JsonProperty("provider_name")
    public ProviderName getProviderName() { return providerName; }
    @JsonProperty("provider_name")
    public void setProviderName(ProviderName value) { this.providerName = value; }

    @JsonProperty("thumbnail_url")
    public String getThumbnailURL() { return thumbnailURL; }
    @JsonProperty("thumbnail_url")
    public void setThumbnailURL(String value) { this.thumbnailURL = value; }

    @JsonProperty("type")
    public OembedType getType() { return type; }
    @JsonProperty("type")
    public void setType(OembedType value) { this.type = value; }

    @JsonProperty("thumbnail_height")
    public long getThumbnailHeight() { return thumbnailHeight; }
    @JsonProperty("thumbnail_height")
    public void setThumbnailHeight(long value) { this.thumbnailHeight = value; }

    @JsonProperty("author_name")
    public String getAuthorName() { return authorName; }
    @JsonProperty("author_name")
    public void setAuthorName(String value) { this.authorName = value; }

    @JsonProperty("author_url")
    public String getAuthorURL() { return authorURL; }
    @JsonProperty("author_url")
    public void setAuthorURL(String value) { this.authorURL = value; }
}
