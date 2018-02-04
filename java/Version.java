package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Version {
    THE_10;

    @JsonValue
    public String toValue() {
        switch (this) {
        case THE_10: return "1.0";
        }
        return null;
    }

    @JsonCreator
    public static Version forValue(String value) throws IOException {
        if (value.equals("1.0")) return THE_10;
        throw new IOException("Cannot deserialize Version");
    }
}
