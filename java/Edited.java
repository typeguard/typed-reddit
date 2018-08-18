package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.annotation.*;

@JsonDeserialize(using = Edited.Deserializer.class)
@JsonSerialize(using = Edited.Serializer.class)
public class Edited {
    public Double doubleValue;
    public Boolean boolValue;

    static class Deserializer extends JsonDeserializer<Edited> {
        @Override
        public Edited deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
            Edited value = new Edited();
            switch (jsonParser.getCurrentToken()) {
            case VALUE_NUMBER_INT:
            case VALUE_NUMBER_FLOAT:
                value.doubleValue = jsonParser.readValueAs(Double.class);
                break;
            case VALUE_TRUE:
            case VALUE_FALSE:
                value.boolValue = jsonParser.readValueAs(Boolean.class);
                break;
            default: throw new IOException("Cannot deserialize Edited");
            }
            return value;
        }
    }

    static class Serializer extends JsonSerializer<Edited> {
        @Override
        public void serialize(Edited obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
            if (obj.doubleValue != null) {
                jsonGenerator.writeObject(obj.doubleValue);
                return;
            }
            if (obj.boolValue != null) {
                jsonGenerator.writeObject(obj.boolValue);
                return;
            }
            throw new IOException("Edited must not be null");
        }
    }
}
