package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ProviderName {
    CLIPPIT, GFYCAT, YOU_TUBE;

    @JsonValue
    public String toValue() {
        switch (this) {
        case CLIPPIT: return "Clippit";
        case GFYCAT: return "gfycat";
        case YOU_TUBE: return "YouTube";
        }
        return null;
    }

    @JsonCreator
    public static ProviderName forValue(String value) throws IOException {
        if (value.equals("Clippit")) return CLIPPIT;
        if (value.equals("gfycat")) return GFYCAT;
        if (value.equals("YouTube")) return YOU_TUBE;
        throw new IOException("Cannot deserialize ProviderName");
    }
}
