package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class RedditData {
    private String modhash;
    private long dist;
    private Child[] children;
    private String after;
    private Object before;

    @JsonProperty("modhash")
    public String getModhash() { return modhash; }
    @JsonProperty("modhash")
    public void setModhash(String value) { this.modhash = value; }

    @JsonProperty("dist")
    public long getDist() { return dist; }
    @JsonProperty("dist")
    public void setDist(long value) { this.dist = value; }

    @JsonProperty("children")
    public Child[] getChildren() { return children; }
    @JsonProperty("children")
    public void setChildren(Child[] value) { this.children = value; }

    @JsonProperty("after")
    public String getAfter() { return after; }
    @JsonProperty("after")
    public void setAfter(String value) { this.after = value; }

    @JsonProperty("before")
    public Object getBefore() { return before; }
    @JsonProperty("before")
    public void setBefore(Object value) { this.before = value; }
}
