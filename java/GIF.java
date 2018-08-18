package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class GIF {
    private Source source;
    private Source[] resolutions;

    @JsonProperty("source")
    public Source getSource() { return source; }
    @JsonProperty("source")
    public void setSource(Source value) { this.source = value; }

    @JsonProperty("resolutions")
    public Source[] getResolutions() { return resolutions; }
    @JsonProperty("resolutions")
    public void setResolutions(Source[] value) { this.resolutions = value; }
}
