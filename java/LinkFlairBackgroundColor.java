package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum LinkFlairBackgroundColor {
    EMPTY, FF4500, THE_6289_D1;

    @JsonValue
    public String toValue() {
        switch (this) {
        case EMPTY: return "";
        case FF4500: return "#ff4500";
        case THE_6289_D1: return "#6289d1";
        }
        return null;
    }

    @JsonCreator
    public static LinkFlairBackgroundColor forValue(String value) throws IOException {
        if (value.equals("")) return EMPTY;
        if (value.equals("#ff4500")) return FF4500;
        if (value.equals("#6289d1")) return THE_6289_D1;
        throw new IOException("Cannot deserialize LinkFlairBackgroundColor");
    }
}
