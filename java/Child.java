package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Child {
    private Kind kind;
    private ChildData data;

    @JsonProperty("kind")
    public Kind getKind() { return kind; }
    @JsonProperty("kind")
    public void setKind(Kind value) { this.kind = value; }

    @JsonProperty("data")
    public ChildData getData() { return data; }
    @JsonProperty("data")
    public void setData(ChildData value) { this.data = value; }
}
