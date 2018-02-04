package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ProviderURL {
    HTTPS_WWW_YOUTUBE_COM, HTTP_CLIPPIT_TV, HTTP_GFYCAT_COM;

    @JsonValue
    public String toValue() {
        switch (this) {
        case HTTPS_WWW_YOUTUBE_COM: return "https://www.youtube.com/";
        case HTTP_CLIPPIT_TV: return "http://clippit.tv";
        case HTTP_GFYCAT_COM: return "http://gfycat.com";
        }
        return null;
    }

    @JsonCreator
    public static ProviderURL forValue(String value) throws IOException {
        if (value.equals("https://www.youtube.com/")) return HTTPS_WWW_YOUTUBE_COM;
        if (value.equals("http://clippit.tv")) return HTTP_CLIPPIT_TV;
        if (value.equals("http://gfycat.com")) return HTTP_GFYCAT_COM;
        throw new IOException("Cannot deserialize ProviderURL");
    }
}
