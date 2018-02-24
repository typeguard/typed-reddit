// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var reddit = Reddit.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Collections.Generic;
    using System.Net;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class Reddit
    {
        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("error")]
        public long Error { get; set; }
    }

    public partial class Reddit
    {
        public static Reddit FromJson(string json) => JsonConvert.DeserializeObject<Reddit>(json, QuickType.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this Reddit self) => JsonConvert.SerializeObject(self, QuickType.Converter.Settings);
    }

    internal class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = { 
                new IsoDateTimeConverter()
                {
                    DateTimeStyles = DateTimeStyles.AssumeUniversal,
                },
            },
        };
    }
}
