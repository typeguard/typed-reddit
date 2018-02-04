package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class GIF {
    private Resolution source;
    private Resolution[] resolutions;

    @JsonProperty("source")
    public Resolution getSource() { return source; }
    @JsonProperty("source")
    public void setSource(Resolution value) { this.source = value; }

    @JsonProperty("resolutions")
    public Resolution[] getResolutions() { return resolutions; }
    @JsonProperty("resolutions")
    public void setResolutions(Resolution[] value) { this.resolutions = value; }
}
