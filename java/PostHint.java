package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum PostHint {
    IMAGE, LINK, RICH_VIDEO, SELF;

    @JsonValue
    public String toValue() {
        switch (this) {
        case IMAGE: return "image";
        case LINK: return "link";
        case RICH_VIDEO: return "rich:video";
        case SELF: return "self";
        }
        return null;
    }

    @JsonCreator
    public static PostHint forValue(String value) throws IOException {
        if (value.equals("image")) return IMAGE;
        if (value.equals("link")) return LINK;
        if (value.equals("rich:video")) return RICH_VIDEO;
        if (value.equals("self")) return SELF;
        throw new IOException("Cannot deserialize PostHint");
    }
}
