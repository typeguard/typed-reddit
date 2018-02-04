package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Reddit {
    private String kind;
    private RedditData data;

    @JsonProperty("kind")
    public String getKind() { return kind; }
    @JsonProperty("kind")
    public void setKind(String value) { this.kind = value; }

    @JsonProperty("data")
    public RedditData getData() { return data; }
    @JsonProperty("data")
    public void setData(RedditData value) { this.data = value; }
}
