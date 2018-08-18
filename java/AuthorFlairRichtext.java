package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class AuthorFlairRichtext {
    private String e;
    private String t;

    @JsonProperty("e")
    public String getE() { return e; }
    @JsonProperty("e")
    public void setE(String value) { this.e = value; }

    @JsonProperty("t")
    public String getT() { return t; }
    @JsonProperty("t")
    public void setT(String value) { this.t = value; }
}
