package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum MediaType {
    CLIPPITUSER_TV, GFYCAT_COM, YOUTUBE_COM;

    @JsonValue
    public String toValue() {
        switch (this) {
        case CLIPPITUSER_TV: return "clippituser.tv";
        case GFYCAT_COM: return "gfycat.com";
        case YOUTUBE_COM: return "youtube.com";
        }
        return null;
    }

    @JsonCreator
    public static MediaType forValue(String value) throws IOException {
        if (value.equals("clippituser.tv")) return CLIPPITUSER_TV;
        if (value.equals("gfycat.com")) return GFYCAT_COM;
        if (value.equals("youtube.com")) return YOUTUBE_COM;
        throw new IOException("Cannot deserialize MediaType");
    }
}
