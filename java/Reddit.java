package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Reddit {
    private String message;
    private long error;

    @JsonProperty("message")
    public String getMessage() { return message; }
    @JsonProperty("message")
    public void setMessage(String value) { this.message = value; }

    @JsonProperty("error")
    public long getError() { return error; }
    @JsonProperty("error")
    public void setError(long value) { this.error = value; }
}
