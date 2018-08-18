package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Image {
    private Source source;
    private Source[] resolutions;
    private Variants variants;
    private String id;

    @JsonProperty("source")
    public Source getSource() { return source; }
    @JsonProperty("source")
    public void setSource(Source value) { this.source = value; }

    @JsonProperty("resolutions")
    public Source[] getResolutions() { return resolutions; }
    @JsonProperty("resolutions")
    public void setResolutions(Source[] value) { this.resolutions = value; }

    @JsonProperty("variants")
    public Variants getVariants() { return variants; }
    @JsonProperty("variants")
    public void setVariants(Variants value) { this.variants = value; }

    @JsonProperty("id")
    public String getID() { return id; }
    @JsonProperty("id")
    public void setID(String value) { this.id = value; }
}
