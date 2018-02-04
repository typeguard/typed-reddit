package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class RedditData {
    private String after;
    private long dist;
    private String modhash;
    private String whitelistStatus;
    private Child[] children;
    private Object before;

    @JsonProperty("after")
    public String getAfter() { return after; }
    @JsonProperty("after")
    public void setAfter(String value) { this.after = value; }

    @JsonProperty("dist")
    public long getDist() { return dist; }
    @JsonProperty("dist")
    public void setDist(long value) { this.dist = value; }

    @JsonProperty("modhash")
    public String getModhash() { return modhash; }
    @JsonProperty("modhash")
    public void setModhash(String value) { this.modhash = value; }

    @JsonProperty("whitelist_status")
    public String getWhitelistStatus() { return whitelistStatus; }
    @JsonProperty("whitelist_status")
    public void setWhitelistStatus(String value) { this.whitelistStatus = value; }

    @JsonProperty("children")
    public Child[] getChildren() { return children; }
    @JsonProperty("children")
    public void setChildren(Child[] value) { this.children = value; }

    @JsonProperty("before")
    public Object getBefore() { return before; }
    @JsonProperty("before")
    public void setBefore(Object value) { this.before = value; }
}
