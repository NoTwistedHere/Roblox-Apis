# <b>Translations Api v1</b>

## /v1/translations
```json
{
    "Method": "GET",
    "Description": "Get the translations JSON files url of a specific consumer type for all locales.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "consumerType",
            "enum": {
                "1": "AndroidApp",
                "2": "IOSApp",
                "3": "Web",
                "4": "LuaApp",
                "5": "Xbox",
                "6": "WinBootstrapper",
                "7": "MacBootstrapper",
                "8": "RobloxInGameContent",
                "9": "Studio"
            },
            "required": true,
            "description": "The consumer type."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Translations response model",
                                    "properties": {
                                        "locale": {
                                            "description": "The locale of the translations",
                                            "type": "string"
                                        },
                                        "url": {
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "4: Feature disabled"
        },
        "400": {
            "description": "2: Consumer type not supported"
        },
        "404": {
            "description": "3: Translations do not exist"
        }
    },
}
```
<hr>


## /v1/translations/language-resources
```json
{
    "Method": "GET",
    "Description": "Get translated content given consumerType, contentNamespace, localeCode and a list of keys",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "consumerType",
            "enum": {
                "1": "AndroidApp",
                "2": "IOSApp",
                "3": "Web",
                "4": "LuaApp",
                "5": "Xbox",
                "6": "WinBootstrapper",
                "7": "MacBootstrapper",
                "8": "RobloxInGameContent",
                "9": "Studio"
            },
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "contentNamespace",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "required": true,
            "description": "",
            "name": "keys"
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "localeCode",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "type": "string"
                },
                "type": "object"
            }
        },
        "400": {
            "description": "1: Invalid locale\r\n2: Consumer type not supported"
        },
        "404": {
            "description": "3: Translations do not exist"
        }
    },
}
```
<hr>


## /v1/translations/{locale}
```json
{
    "Method": "GET",
    "Description": "Get the translations JSON file url of a specific consumer type and a specific locale.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "locale",
            "required": true,
            "description": "The locale code."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "consumerType",
            "enum": {
                "1": "AndroidApp",
                "2": "IOSApp",
                "3": "Web",
                "4": "LuaApp",
                "5": "Xbox",
                "6": "WinBootstrapper",
                "7": "MacBootstrapper",
                "8": "RobloxInGameContent",
                "9": "Studio"
            },
            "required": true,
            "description": "The consumer type."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Translations response model",
                    "properties": {
                        "locale": {
                            "description": "The locale of the translations",
                            "type": "string"
                        },
                        "url": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "4: Feature disabled"
        },
        "400": {
            "description": "1: Invalid locale\r\n2: Consumer type not supported"
        },
        "404": {
            "description": "3: Translations do not exist"
        }
    },
}
```
<hr>


