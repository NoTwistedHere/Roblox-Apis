# <b>Locale Api v1</b>

## /v1/locales
```json
{
    "Method": "GET",
    "Description": "Get list of Supported locales with user locus information.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "displayValueLocale",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Model for Supported locale with user locus information",
                                    "properties": {
                                        "locale": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Model for Supported locale",
                                                "properties": {
                                                    "locale": {
                                                        "type": "string",
                                                        "description": "locale of supported locale. Example \"en-us\"",
                                                        "readOnly": true
                                                    },
                                                    "name": {
                                                        "type": "string",
                                                        "description": "name of supported locale. Example \"English(US)\"",
                                                        "readOnly": true
                                                    },
                                                    "id": {
                                                        "readOnly": true,
                                                        "format": "int32",
                                                        "description": "id of supported locale",
                                                        "type": "integer"
                                                    },
                                                    "language": {
                                                        "readOnly": true,
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "Model for Language",
                                                            "properties": {
                                                                "id": {
                                                                    "format": "int32",
                                                                    "description": "id of language",
                                                                    "type": "integer"
                                                                },
                                                                "languageCode": {
                                                                    "description": "language code of language",
                                                                    "type": "string"
                                                                },
                                                                "name": {
                                                                    "description": "name of language",
                                                                    "type": "string"
                                                                },
                                                                "nativeName": {
                                                                    "description": "native name of language",
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "Language associated with Supported locale"
                                                    },
                                                    "nativeName": {
                                                        "type": "string",
                                                        "description": "Name of supported locale in native language. Example \"English\"",
                                                        "readOnly": true
                                                    }
                                                }
                                            },
                                            "description": "Supported locale"
                                        },
                                        "isEnabledForInGameUgc": {
                                            "description": "Is locale enabled for in game ugc",
                                            "type": "boolean"
                                        },
                                        "isEnabledForSignupAndLogin": {
                                            "description": "Is locale enabled for signup and login",
                                            "type": "boolean"
                                        },
                                        "isEnabledForFullExperience": {
                                            "description": "Is locale enabled for full experience",
                                            "type": "boolean"
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
        "403": {
            "description": "Feature is turned off temporary"
        },
        "500": {
            "description": "Internal server error"
        }
    },
}
```
<hr>


## /v1/country-regions
```json
{
    "Method": "GET",
    "Description": "Get list of country regions sorted by localized name",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "locale",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Returns list of supported country/regions",
                    "properties": {
                        "countryRegionList": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Model for Country Regions",
                                    "properties": {
                                        "displayName": {
                                            "type": "string",
                                            "description": "localized name of country region. Example \"Afghanistan\"",
                                            "readOnly": true
                                        },
                                        "name": {
                                            "type": "string",
                                            "description": "native name of country region",
                                            "readOnly": true
                                        },
                                        "code": {
                                            "type": "string",
                                            "description": "code of country region",
                                            "readOnly": true
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "List of supported country/regions. Will be empty on error."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "7: Feature is disabled"
        },
        "400": {
            "description": "2: Invalid supported locale code."
        }
    },
}
```
<hr>


## /v1/locales/user-locale
```json
{
    "Method": "GET",
    "Description": "Gets user locale. If user is absent returns, locale from http request object.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "supportedLocale": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Supported locale",
                                "properties": {
                                    "locale": {
                                        "type": "string",
                                        "description": "locale of supported locale. Example \"en-us\"",
                                        "readOnly": true
                                    },
                                    "name": {
                                        "type": "string",
                                        "description": "name of supported locale. Example \"English(US)\"",
                                        "readOnly": true
                                    },
                                    "id": {
                                        "readOnly": true,
                                        "format": "int32",
                                        "description": "id of supported locale",
                                        "type": "integer"
                                    },
                                    "language": {
                                        "readOnly": true,
                                        "$ref": {
                                            "type": "object",
                                            "description": "Model for Language",
                                            "properties": {
                                                "id": {
                                                    "format": "int32",
                                                    "description": "id of language",
                                                    "type": "integer"
                                                },
                                                "languageCode": {
                                                    "description": "language code of language",
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "description": "name of language",
                                                    "type": "string"
                                                },
                                                "nativeName": {
                                                    "description": "native name of language",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Language associated with Supported locale"
                                    },
                                    "nativeName": {
                                        "type": "string",
                                        "description": "Name of supported locale in native language. Example \"English\"",
                                        "readOnly": true
                                    }
                                }
                            },
                            "description": "Supported locale"
                        },
                        "nativeLanguage": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Language",
                                "properties": {
                                    "id": {
                                        "format": "int32",
                                        "description": "id of language",
                                        "type": "integer"
                                    },
                                    "languageCode": {
                                        "description": "language code of language",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "name of language",
                                        "type": "string"
                                    },
                                    "nativeName": {
                                        "description": "native name of language",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": ""
                        }
                    },
                    "type": "object"
                }
            }
        },
        "500": {
            "description": "Internal server error"
        }
    },
}
```
<hr>


## /v1/locales/user-localization-locus-supported-locales
```json
{
    "Method": "GET",
    "Description": "Gets each of a user's localization locus supported locales. A localization locus supported locale is a page (or group of pages) that
have been defined by the International team which need independent locale support.
If the user is null we will attempt to return the locales appropriate for the user's device language.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Returns available {Roblox.Locale.Api.SupportedLocale} models.",
                    "properties": {
                        "signupAndLogin": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Supported locale",
                                "properties": {
                                    "locale": {
                                        "type": "string",
                                        "description": "locale of supported locale. Example \"en-us\"",
                                        "readOnly": true
                                    },
                                    "name": {
                                        "type": "string",
                                        "description": "name of supported locale. Example \"English(US)\"",
                                        "readOnly": true
                                    },
                                    "id": {
                                        "readOnly": true,
                                        "format": "int32",
                                        "description": "id of supported locale",
                                        "type": "integer"
                                    },
                                    "language": {
                                        "readOnly": true,
                                        "$ref": {
                                            "type": "object",
                                            "description": "Model for Language",
                                            "properties": {
                                                "id": {
                                                    "format": "int32",
                                                    "description": "id of language",
                                                    "type": "integer"
                                                },
                                                "languageCode": {
                                                    "description": "language code of language",
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "description": "name of language",
                                                    "type": "string"
                                                },
                                                "nativeName": {
                                                    "description": "native name of language",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Language associated with Supported locale"
                                    },
                                    "nativeName": {
                                        "type": "string",
                                        "description": "Name of supported locale in native language. Example \"English\"",
                                        "readOnly": true
                                    }
                                }
                            },
                            "description": "The supported locale for Signup and Login."
                        },
                        "ugc": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Supported locale",
                                "properties": {
                                    "locale": {
                                        "type": "string",
                                        "description": "locale of supported locale. Example \"en-us\"",
                                        "readOnly": true
                                    },
                                    "name": {
                                        "type": "string",
                                        "description": "name of supported locale. Example \"English(US)\"",
                                        "readOnly": true
                                    },
                                    "id": {
                                        "readOnly": true,
                                        "format": "int32",
                                        "description": "id of supported locale",
                                        "type": "integer"
                                    },
                                    "language": {
                                        "readOnly": true,
                                        "$ref": {
                                            "type": "object",
                                            "description": "Model for Language",
                                            "properties": {
                                                "id": {
                                                    "format": "int32",
                                                    "description": "id of language",
                                                    "type": "integer"
                                                },
                                                "languageCode": {
                                                    "description": "language code of language",
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "description": "name of language",
                                                    "type": "string"
                                                },
                                                "nativeName": {
                                                    "description": "native name of language",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Language associated with Supported locale"
                                    },
                                    "nativeName": {
                                        "type": "string",
                                        "description": "Name of supported locale in native language. Example \"English\"",
                                        "readOnly": true
                                    }
                                }
                            },
                            "description": "The supported locale for user-generated content (UGC)"
                        },
                        "generalExperience": {
                            "$ref": {
                                "type": "object",
                                "description": "Model for Supported locale",
                                "properties": {
                                    "locale": {
                                        "type": "string",
                                        "description": "locale of supported locale. Example \"en-us\"",
                                        "readOnly": true
                                    },
                                    "name": {
                                        "type": "string",
                                        "description": "name of supported locale. Example \"English(US)\"",
                                        "readOnly": true
                                    },
                                    "id": {
                                        "readOnly": true,
                                        "format": "int32",
                                        "description": "id of supported locale",
                                        "type": "integer"
                                    },
                                    "language": {
                                        "readOnly": true,
                                        "$ref": {
                                            "type": "object",
                                            "description": "Model for Language",
                                            "properties": {
                                                "id": {
                                                    "format": "int32",
                                                    "description": "id of language",
                                                    "type": "integer"
                                                },
                                                "languageCode": {
                                                    "description": "language code of language",
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "description": "name of language",
                                                    "type": "string"
                                                },
                                                "nativeName": {
                                                    "description": "native name of language",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Language associated with Supported locale"
                                    },
                                    "nativeName": {
                                        "type": "string",
                                        "description": "Name of supported locale in native language. Example \"English\"",
                                        "readOnly": true
                                    }
                                }
                            },
                            "description": "The supported locale for the general experience."
                        }
                    }
                }
            }
        },
        "500": {
            "description": "Internal server error"
        }
    },
}
```
<hr>


## /v1/languages/user-generated-content
```json
{
    "Method": "GET",
    "Description": "Gets the list of languages available on Roblox for user generated content.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
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
                                    "description": "Model for Language",
                                    "properties": {
                                        "id": {
                                            "format": "int32",
                                            "description": "id of language",
                                            "type": "integer"
                                        },
                                        "languageCode": {
                                            "description": "language code of language",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "name of language",
                                            "type": "string"
                                        },
                                        "nativeName": {
                                            "description": "native name of language",
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
            "description": "7: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/locales/supported-locales
```json
{
    "Method": "GET",
    "Description": "Get list of supported locales sorted by the Native Name property.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Returns list of supported locales",
                    "properties": {
                        "supportedLocales": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Model for Supported locale",
                                    "properties": {
                                        "locale": {
                                            "type": "string",
                                            "description": "locale of supported locale. Example \"en-us\"",
                                            "readOnly": true
                                        },
                                        "name": {
                                            "type": "string",
                                            "description": "name of supported locale. Example \"English(US)\"",
                                            "readOnly": true
                                        },
                                        "id": {
                                            "readOnly": true,
                                            "format": "int32",
                                            "description": "id of supported locale",
                                            "type": "integer"
                                        },
                                        "language": {
                                            "readOnly": true,
                                            "$ref": {
                                                "type": "object",
                                                "description": "Model for Language",
                                                "properties": {
                                                    "id": {
                                                        "format": "int32",
                                                        "description": "id of language",
                                                        "type": "integer"
                                                    },
                                                    "languageCode": {
                                                        "description": "language code of language",
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "description": "name of language",
                                                        "type": "string"
                                                    },
                                                    "nativeName": {
                                                        "description": "native name of language",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "Language associated with Supported locale"
                                        },
                                        "nativeName": {
                                            "type": "string",
                                            "description": "Name of supported locale in native language. Example \"English\"",
                                            "readOnly": true
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "List of supported locales. Will be empty on error."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Feature is turned off temporary"
        },
        "500": {
            "description": "Internal server error"
        }
    },
}
```
<hr>


## /v1/locales/set-user-supported-locale
```json
{
    "Method": "POST",
    "Description": "Sets user's supported locale.
Null supported locale will clear out user's supported locale (set users' supported locale to null)",
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
            "name": "userRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request entity to set Supported Locale for user",
                    "properties": {
                        "supportedLocaleCode": {
                            "description": "SupportedLocale code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Supported locale code that needs to be set for user"
        }
    },
    "Responses": {
        "500": {
            "description": "Internal server error"
        },
        "400": {
            "description": "Bad Request"
        },
        "401": {
            "description": "Unauthorized\r\n0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Tells the operation is successful or not",
                    "properties": {
                        "success": {
                            "description": "Returns true on success otherwise false",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Feature is turned off temporary\r\n0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/languages
```json
{
    "Method": "GET",
    "Description": "Gets the list of languages available on Roblox.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
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
                                    "description": "Model for Language",
                                    "properties": {
                                        "id": {
                                            "format": "int32",
                                            "description": "id of language",
                                            "type": "integer"
                                        },
                                        "languageCode": {
                                            "description": "language code of language",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "name of language",
                                            "type": "string"
                                        },
                                        "nativeName": {
                                            "description": "native name of language",
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
            "description": "7: Feature is disabled"
        }
    },
}
```
<hr>


