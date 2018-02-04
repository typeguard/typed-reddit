package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Image {
    private Resolution source;
    private Resolution[] resolutions;
    private Variants variants;
    private String id;

    @JsonProperty("source")
    public Resolution getSource() { return source; }
    @JsonProperty("source")
    public void setSource(Resolution value) { this.source = value; }

    @JsonProperty("resolutions")
    public Resolution[] getResolutions() { return resolutions; }
    @JsonProperty("resolutions")
    public void setResolutions(Resolution[] value) { this.resolutions = value; }

    @JsonProperty("variants")
    public Variants getVariants() { return variants; }
    @JsonProperty("variants")
    public void setVariants(Variants value) { this.variants = value; }

    @JsonProperty("id")
    public String getId() { return id; }
    @JsonProperty("id")
    public void setId(String value) { this.id = value; }
}
