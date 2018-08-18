package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum LinkFlairTextColor {
    DARK, LIGHT;

    @JsonValue
    public String toValue() {
        switch (this) {
        case DARK: return "dark";
        case LIGHT: return "light";
        }
        return null;
    }

    @JsonCreator
    public static LinkFlairTextColor forValue(String value) throws IOException {
        if (value.equals("dark")) return DARK;
        if (value.equals("light")) return LIGHT;
        throw new IOException("Cannot deserialize LinkFlairTextColor");
    }
}
