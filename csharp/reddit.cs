// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var data = Reddit.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Net;
    using System.Collections.Generic;

    using Newtonsoft.Json;

    public partial class Reddit
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("error")]
        public long Error { get; set; }
    }

    public partial class Reddit
    {
        public static Reddit FromJson(string json) => JsonConvert.DeserializeObject<Reddit>(json, Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this Reddit self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    public class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
        };
    }
}
