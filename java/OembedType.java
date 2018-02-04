package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum OembedType {
    VIDEO;

    @JsonValue
    public String toValue() {
        switch (this) {
        case VIDEO: return "video";
        }
        return null;
    }

    @JsonCreator
    public static OembedType forValue(String value) throws IOException {
        if (value.equals("video")) return VIDEO;
        throw new IOException("Cannot deserialize OembedType");
    }
}
