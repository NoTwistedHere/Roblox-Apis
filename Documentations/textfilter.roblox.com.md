# <b>TextFilter Api v2</b>

## /v2/moderation/textfilter
```json
{
    "Method": "POST",
    "Description": "Filters Text for live game chat (and eventually for all 'live' Text exchanges).

It passes the given Text through multiple filters and returns the results for each filter, the idea being that the
caller can choose which filtered Text to show the viewer based on the viewers age or other factors. This is a
departure from all other Text moderation we perform in which the Text is filtered exclusively based on the status 
of the Text creator.

Currently the filters used are thus:

With CommunitySift enabled:
    Age13OrOver: Rule set defined by CommunitySift.Properties.Settings.Default.CommunitySiftTextFiltering13AndOverRule
    AgeUnder13: Rule set defined by CommunitySift.Properties.Settings.Default.CommunitySiftTextFilteringUnder13Rule

With CommunitySift disabled:
    Age13OrOver: blacklist
    AgeUnder13: white list

The returned json takes the form of
{
    "success": true,
    "message": "",
    "data": 
    {
        "AgeUnder13":"##############################",
        "Age13OrOver":"Do you have a twitter account?"
    }
}",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "requestBody",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request for filtering text for a given user.",
                    "properties": {
                        "text": {
                            "description": "Text to be filtered.",
                            "type": "string"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "Id of the User that entered the text.",
                            "type": "integer"
                        },
                        "context": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Public",
                                "3": "Private"
                            },
                            "description": "The {Roblox.TextFilter.Api.TextContext} of the submitted text.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing results from text filter.",
                    "properties": {
                        "message": {
                            "type": "string",
                            "description": "Gets or sets the message.",
                            "readOnly": true
                        },
                        "success": {
                            "type": "boolean",
                            "description": "Gets or sets a value indicating whether this {A model containing results from text filter.} is success.",
                            "readOnly": true
                        },
                        "data": {
                            "readOnly": true,
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the data."
                        }
                    }
                }
            }
        }
    },
    "Internal": true
}
```
<hr>


