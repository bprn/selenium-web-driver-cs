using System.Text.Json;
using System.Text.Json.Serialization;

namespace WebProspek.CommonSystem
{
     
    public class DefaultNoNamingChangePolicy : JsonNamingPolicy
    {
        public override string ConvertName(string name)
        {
            return name;
        }
    }

    public static class CustomJsonSerializerOptions
    {
        public static JsonSerializerOptions PascalCaseNoNamingChange
        {
            get
            {
                var setting = new JsonSerializerOptions(JsonSerializerDefaults.Web);
                setting.PropertyNamingPolicy = new DefaultNoNamingChangePolicy();
                setting.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
                setting.IncludeFields = true;
                setting.NumberHandling = JsonNumberHandling.AllowNamedFloatingPointLiterals;
                setting.ReferenceHandler = ReferenceHandler.IgnoreCycles;
                return setting;
            }
        }

    }

}
