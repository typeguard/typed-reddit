package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum WhitelistStatus {
    ALL_ADS, PROMO_ALL, PROMO_SPECIFIED;

    @JsonValue
    public String toValue() {
        switch (this) {
        case ALL_ADS: return "all_ads";
        case PROMO_ALL: return "promo_all";
        case PROMO_SPECIFIED: return "promo_specified";
        }
        return null;
    }

    @JsonCreator
    public static WhitelistStatus forValue(String value) throws IOException {
        if (value.equals("all_ads")) return ALL_ADS;
        if (value.equals("promo_all")) return PROMO_ALL;
        if (value.equals("promo_specified")) return PROMO_SPECIFIED;
        throw new IOException("Cannot deserialize WhitelistStatus");
    }
}
