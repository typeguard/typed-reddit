package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum SubredditType {
    PUBLIC;

    @JsonValue
    public String toValue() {
        switch (this) {
        case PUBLIC: return "public";
        }
        return null;
    }

    @JsonCreator
    public static SubredditType forValue(String value) throws IOException {
        if (value.equals("public")) return PUBLIC;
        throw new IOException("Cannot deserialize SubredditType");
    }
}
