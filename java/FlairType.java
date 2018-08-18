package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum FlairType {
    RICHTEXT, TEXT;

    @JsonValue
    public String toValue() {
        switch (this) {
        case RICHTEXT: return "richtext";
        case TEXT: return "text";
        }
        return null;
    }

    @JsonCreator
    public static FlairType forValue(String value) throws IOException {
        if (value.equals("richtext")) return RICHTEXT;
        if (value.equals("text")) return TEXT;
        throw new IOException("Cannot deserialize FlairType");
    }
}
