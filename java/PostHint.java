package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum PostHint {
    IMAGE, LINK, SELF;

    @JsonValue
    public String toValue() {
        switch (this) {
        case IMAGE: return "image";
        case LINK: return "link";
        case SELF: return "self";
        }
        return null;
    }

    @JsonCreator
    public static PostHint forValue(String value) throws IOException {
        if (value.equals("image")) return IMAGE;
        if (value.equals("link")) return LINK;
        if (value.equals("self")) return SELF;
        throw new IOException("Cannot deserialize PostHint");
    }
}
