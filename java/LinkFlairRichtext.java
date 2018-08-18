package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class LinkFlairRichtext {
    private String e;
    private String t;
    private String a;
    private String u;

    @JsonProperty("e")
    public String getE() { return e; }
    @JsonProperty("e")
    public void setE(String value) { this.e = value; }

    @JsonProperty("t")
    public String getT() { return t; }
    @JsonProperty("t")
    public void setT(String value) { this.t = value; }

    @JsonProperty("a")
    public String getA() { return a; }
    @JsonProperty("a")
    public void setA(String value) { this.a = value; }

    @JsonProperty("u")
    public String getU() { return u; }
    @JsonProperty("u")
    public void setU(String value) { this.u = value; }
}
