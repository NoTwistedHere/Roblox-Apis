# <b>GamePersistence Api v0</b>

## /persistence/getSortedValues
```json
{
    "Method": "POST",
    "Description": "Get's the sorted values with a POST.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.scope",
            "description": "The scope of the key to return.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.key",
            "description": "The key to return.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "request.exclusiveStartKey",
            "description": "Exclusive start key for pagination.",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "request.pageSize",
            "format": "int32",
            "description": "Page size.",
        },
        "6": {
            "in": "query",
            "type": "boolean",
            "name": "request.ascending",
            "description": "Whether to return items in ascending or descending order.",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "request.inclusiveMinValue",
            "format": "int64",
            "description": "If provided, specifies the minimum value to include.",
        },
        "8": {
            "in": "query",
            "type": "integer",
            "name": "request.inclusiveMaxValue",
            "format": "int64",
            "description": "If provided, specifies the maximum value to include.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the sorted persistence values.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "The scope."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "The key."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "required": true,
            "description": "The exclusive start key."
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": "Size of the page."
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "name": "ascending",
            "required": true,
            "description": "if set to true [ascending]."
        },
        "6": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "inclusiveMinValue",
            "format": "int64",
            "description": "The inclusive minimum value.",
        },
        "8": {
            "in": "query",
            "type": "integer",
            "name": "inclusiveMaxValue",
            "format": "int64",
            "description": "The inclusive maximum value.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


## /persistence/remove
```json
{
    "Method": "POST",
    "Description": "Removes the specified request.
Note, many parameters are sent in the uri, they should be in the body.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.type",
            "enum": {
                "1": "Standard",
                "2": "Sorted"
            },
            "description": "Storage type.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.scope",
            "description": "Key scope.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "request.target",
            "description": "Key target.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "request.key",
            "description": "Key name.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


## /persistence/increment
```json
{
    "Method": "POST",
    "Description": "Increments the specified data persistence.
Note, many parameters are sent in the uri, they should be in the body.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.type",
            "enum": {
                "1": "Standard",
                "2": "Sorted"
            },
            "description": "Storage type.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.scope",
            "description": "Key scope.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "request.target",
            "description": "Key target.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "request.key",
            "description": "Key name.",
        },
        "6": {
            "in": "query",
            "type": "integer",
            "name": "request.value",
            "format": "int64",
            "description": "Value to increment by.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


## /persistence/set
```json
{
    "Method": "POST",
    "Description": "Sets the specified persistence values.
Note, many parameters are sent in the uri, they should be in the body.
Value is the one parameter send in the post body.",
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
            "name": "valueRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Set request body.",
                    "properties": {
                        "value": {
                            "description": "The value to set.",
                            "type": "string"
                        },
                        "expectedValue": {
                            "description": "Expected key value for conditional set.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The value request. Required because this comes from the body (as it should) while the rest do not."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.type",
            "enum": {
                "1": "Standard",
                "2": "Sorted"
            },
            "description": "Storage type.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "request.scope",
            "description": "Key scope.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "request.target",
            "description": "Key target.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "request.key",
            "description": "Key name.",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "request.valueLength",
            "format": "int32",
            "description": "Length of the value being set, in UTF8 bytes.",
        },
        "8": {
            "in": "query",
            "type": "integer",
            "name": "request.expectedValueLength",
            "format": "int32",
            "description": "Length of the expected value, in UTF8 bytes.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


## /persistence/getV2
```json
{
    "Method": "POST",
    "Description": "Gets the specified persistence record.",
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
            "in": "query",
            "type": "string",
            "name": "type",
            "enum": {
                "1": "Standard",
                "2": "Sorted"
            },
            "required": true,
            "description": "The type."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Get request body.",
                    "properties": {
                        "qkeys": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Represents a key in a datastore. Contains all information required to identify the key.",
                                    "properties": {
                                        "Scope": {
                                            "description": "The key's scope.",
                                            "type": "string"
                                        },
                                        "Key": {
                                            "description": "The key's name.",
                                            "type": "string"
                                        },
                                        "Target": {
                                            "description": "The key's target.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the qualified keys to return."
                        }
                    }
                }
            },
            "description": "The request."
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "The place identifier."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This exists because GamePersistence used to be MVC and returned custom JSON\r\nbuilt in the response methods. We do NOT want to follow this pattern.\r\nResponse methods should be of the type of the response model being returned.",
                    "properties": {
                    }
                }
            }
        }
    },
}
```
<hr>


