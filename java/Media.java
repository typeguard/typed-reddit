package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Media {
    private MediaType type;
    private Oembed oembed;

    @JsonProperty("type")
    public MediaType getType() { return type; }
    @JsonProperty("type")
    public void setType(MediaType value) { this.type = value; }

    @JsonProperty("oembed")
    public Oembed getOembed() { return oembed; }
    @JsonProperty("oembed")
    public void setOembed(Oembed value) { this.oembed = value; }
}
