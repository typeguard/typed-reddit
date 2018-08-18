package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum WhitelistStatus {
    ALL_ADS, HOUSE_ONLY, PROMO_ALL;

    @JsonValue
    public String toValue() {
        switch (this) {
        case ALL_ADS: return "all_ads";
        case HOUSE_ONLY: return "house_only";
        case PROMO_ALL: return "promo_all";
        }
        return null;
    }

    @JsonCreator
    public static WhitelistStatus forValue(String value) throws IOException {
        if (value.equals("all_ads")) return ALL_ADS;
        if (value.equals("house_only")) return HOUSE_ONLY;
        if (value.equals("promo_all")) return PROMO_ALL;
        throw new IOException("Cannot deserialize WhitelistStatus");
    }
}
