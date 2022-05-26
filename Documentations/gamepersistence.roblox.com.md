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
    "Internal": true
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
    "Internal": true
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
    "Internal": true
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
    "Internal": true
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
    "Internal": true
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
    "Internal": true
}
```
<hr>


# <b>GamePersistence Api v1</b>

## /v1/persistence/{type}/remove
```json
{
    "Method": "POST",
    "Description": "Removes the value of the specfiied key.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Datastore type, \"standard\" or \"sorted\"."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "Datastore scope."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "Datastore name."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "target",
            "required": true,
            "description": "Datastore item."
        }
    },
    "Responses": {
        "403": {
            "description": "10: The provided key is read-only.\r\n11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided scope is invalid.\r\n3: The provided target is invalid.\r\n4: The provided key is invalid.\r\n9: The provided place is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        },
        "404": {
            "description": "8: The provided storage type is invalid."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/persistence/sorted/list
```json
{
    "Method": "GET",
    "Description": "Returns a range of values from a sorted data store.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "Datastore scope."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "Datastore name."
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": "Page size."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "direction",
            "description": "Enumeration direction, \"asc\" or \"desc\".",
        },
        "6": {
            "in": "query",
            "type": "integer",
            "name": "minValue",
            "format": "int64",
            "description": "Minimum value to return, inclusive.",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "maxValue",
            "format": "int64",
            "description": "Maximum value to return, inclusive.",
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "description": "Exclusive start key.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "GetSorted operation response.",
                    "properties": {
                        "lastEvaluatedKey": {
                            "type": "string",
                            "description": "Gets the last evaluated key.",
                            "readOnly": true
                        },
                        "entries": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A target and value pair.",
                                    "properties": {
                                        "target": {
                                            "type": "string",
                                            "description": "Gets the key target.",
                                            "readOnly": true
                                        },
                                        "usn": {
                                            "type": "string",
                                            "description": "Gets the item USN.",
                                            "readOnly": true
                                        },
                                        "value": {
                                            "readOnly": true,
                                            "format": "int64",
                                            "description": "Gets the item value.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets the retrieved entries.",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "403": {
            "description": "11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided scope is invalid.\r\n4: The provided key is invalid.\r\n9: The provided place is invalid."
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/persistence/{type}/increment
```json
{
    "Method": "POST",
    "Description": "Increments the value of the key by the provided amount.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Datastore type, \"standard\" or \"sorted\"."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "Datastore scope."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "Datastore name."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "target",
            "required": true,
            "description": "Datastore item."
        },
        "6": {
            "in": "query",
            "type": "integer",
            "name": "by",
            "format": "int64",
            "required": true,
            "description": "The amount to increment by."
        }
    },
    "Responses": {
        "403": {
            "description": "10: The provided key is read-only.\r\n11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided scope is invalid.\r\n3: The provided target is invalid.\r\n4: The provided key is invalid.\r\n9: The provided place is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Increment operation response.",
                    "properties": {
                        "value": {
                            "type": "string",
                            "description": "Gets the incremented value.",
                            "readOnly": true
                        },
                        "usn": {
                            "type": "string",
                            "description": "Gets the USN of the key after the increment operation.",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        },
        "404": {
            "description": "8: The provided storage type is invalid."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/persistence/{type}/multi-get
```json
{
    "Method": "POST",
    "Description": "Retrieves the values of multiple keys.",
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
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Datastore type, \"standard\" or \"sorted\"."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Multi-get request body.",
                    "properties": {
                        "keys": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Represents a key in a datastore. Contains all information required to identify the key.",
                                    "properties": {
                                        "scope": {
                                            "description": "Gets or sets the key scope.",
                                            "type": "string"
                                        },
                                        "key": {
                                            "description": "Gets or sets the key name.",
                                            "type": "string"
                                        },
                                        "target": {
                                            "description": "Gets or sets the key target.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the keys to return."
                        }
                    }
                }
            },
            "description": "Request body."
        }
    },
    "Responses": {
        "403": {
            "description": "11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "1: The required request body is missing.\r\n2: The provided scope is invalid.\r\n3: The provided target is invalid.\r\n4: The provided key is invalid.\r\n5: At least one key must be provided.\r\n6: The number of provided keys exceeds the allowed maximum.\r\n9: The provided place is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Multi-get operation response.",
                    "properties": {
                        "entries": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Represents a {Roblox.GamePersistence.Api.Models.V1.QualifiedKey} with a specified value.",
                                    "properties": {
                                        "key": {
                                            "type": "string",
                                            "description": "Gets the key name.",
                                            "readOnly": true
                                        },
                                        "scope": {
                                            "type": "string",
                                            "description": "Gets the key scope.",
                                            "readOnly": true
                                        },
                                        "usn": {
                                            "type": "string",
                                            "description": "Gets the key USN.",
                                            "readOnly": true
                                        },
                                        "value": {
                                            "type": "string",
                                            "description": "Gets the key value.",
                                            "readOnly": true
                                        },
                                        "target": {
                                            "type": "string",
                                            "description": "Gets the key target.",
                                            "readOnly": true
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets the retrieved entries.",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        },
        "404": {
            "description": "8: The provided storage type is invalid."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/persistence/{type}
```json
{
    "Method": "POST",
    "Description": "Sets the value of a key.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Datastore type, \"standard\" or \"sorted\"."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "Datastore scope."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "Datastore name."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "target",
            "required": true,
            "description": "Datastore item."
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "usn",
            "description": "Optional USN to match for a conditional update (see remarks).",
        }
    },
    "Responses": {
        "403": {
            "description": "10: The provided key is read-only.\r\n11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided scope is invalid.\r\n3: The provided target is invalid.\r\n4: The provided key is invalid.\r\n7: The size of the provided value exceeds the allowed maximum.\r\n9: The provided place is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        },
        "404": {
            "description": "8: The provided storage type is invalid."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Retrieves the value of a single key.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Datastore type, \"standard\" or \"sorted\"."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "scope",
            "required": true,
            "description": "Datastore scope."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "key",
            "required": true,
            "description": "Datastore name."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "target",
            "required": true,
            "description": "Datastore item."
        }
    },
    "Responses": {
        "403": {
            "description": "11: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided scope is invalid.\r\n3: The provided target is invalid.\r\n4: The provided key is invalid.\r\n9: The provided place is invalid."
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "429": {
            "description": "12: The request rate exceeds the allowed maximum for the key.\r\n13: The request rate exceeds the allowed maximum for the datastore."
        },
        "404": {
            "description": "8: The provided storage type is invalid."
        }
    },
    "Internal": true
}
```
<hr>


# <b>GamePersistence Api v2</b>

## /v2/persistence/{universeId}/datastores/datastore
```json
{
    "Method": "PATCH",
    "Description": "Updates datastore configuration.
Updates the datastore with new configuration. Currently only versioning can be set.
When verisoning is set, default set of policies are applied to the datastore.",
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
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true,
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe Identifier."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Name of the datastore."
        },
        "4": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Describes UpdateDatastoreRequest.For now versioning can only be enabled\r\nand the object lifecycle policies are automatically set for now.\r\nWe will enable setting object lifecycle policy later.",
                    "properties": {
                        "versioningEnabled": {
                            "description": "Enable versioning on the datastore.",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "{Roblox.GamePersistence.Api.Models.V2.UpdateDatastoreRequest}"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed.\r\n7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid."
        },
        "404": {
            "description": "10: The data store does not exist.\r\n10: The data store does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "PUT",
    "Description": "Gets or creates a datastore by the given in the given universe Id.
If the datastore does not exist a datastore will be created with the same name and default configuration.
Newly created datastore will have versioning disabled.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe Identifier."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Name of the datastore."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Returns datastore information of the datastore given the name of the datastore and the universeId.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe Id."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Datastore name."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid."
        },
        "404": {
            "description": "10: The data store does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/persistence/{universeId}/datastores
```json
{
    "Method": "GET",
    "Description": "Returns list of datastores.",
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
            "description": "Place identifier of the requesting place."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "maxItemsToReturn",
            "format": "int32",
            "description": "",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "prefix",
            "description": "",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/persistence/{universeId}/datastores/objects
```json
{
    "Method": "GET",
    "Description": "Enumerates objects in a data store.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "prefix",
            "description": "Optional key prefix of the keys to enumerate.",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "maxItemsToReturn",
            "format": "int32",
            "description": "Maximum number of items to return.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "description": "Exclusive start key.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid."
        },
        "404": {
            "description": "10: The data store does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/persistence/{universeId}/datastores/objects/object/versions
```json
{
    "Method": "GET",
    "Description": "Enumerates object versions.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "objectKey",
            "required": true,
            "description": "Object key whose versions to enumerate."
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "maxItemsToReturn",
            "format": "int32",
            "description": "The maximum number of items to return.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "sortOrder",
            "enum": {
                "1": "Ascending",
                "2": "Descending"
            },
            "description": "Optional Sort order to sort the object versions. Can be either \"Ascending\" or \"Descending\". Defaults to \"Ascending\"",
        },
        "7": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "description": "Exclusive start key.",
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "startTime",
            "description": "Optional lower bound, inclusive, for the creation time of the versions\r\n            to return.",
        },
        "9": {
            "in": "query",
            "type": "string",
            "name": "endTime",
            "description": "Optional upper bound, inclusive, for the creation time of the versions to\r\n            return.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid.\r\n3: The provided object key is invalid."
        },
        "404": {
            "description": "10: The data store does not exist.\r\n11: The requested key does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/persistence/{universeId}/datastores/objects/object/increment
```json
{
    "Method": "POST",
    "Description": "Increments the key value.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "objectKey",
            "required": true,
            "description": "Object key."
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "incrementBy",
            "format": "int64",
            "description": "The amount to increment by.",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Object-Attributes",
            "description": "Optional metadata attributes in JSON format.",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Object-UserIds",
            "description": "Optional user ids to associate with the value as a JSON array.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid.\r\n3: The provided object key is invalid."
        },
        "404": {
            "description": "10: The data store does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/persistence/{universeId}/datastores/objects/object
```json
{
    "Method": "POST",
    "Description": "Updates the key with the provided value and metadata.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "objectKey",
            "required": true,
            "description": "Object key."
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Object-Attributes",
            "description": "Optional metadata attributes in JSON format.",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Object-UserIds",
            "description": "Optional user ids to associate with the value as a JSON array.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid.\r\n3: The provided object key is invalid.\r\n6: The size of the provided value exceeds the allowed maximum.\r\n13: The specified precondition is invalid\r\n14: The provided object attributes have invalid format.\r\n15: The provided user ids have invalid format."
        },
        "404": {
            "description": "10: The data store does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Deletes an object version.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "objectKey",
            "required": true,
            "description": "Object key."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "version",
            "description": "Optional version to delete (see Remarks).",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid.\r\n3: The provided object key is invalid."
        },
        "404": {
            "description": "10: The data store does not exist.\r\n12: The requested object version does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Returns an object version.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Universe identifier."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "datastore",
            "required": true,
            "description": "Data store name."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "objectKey",
            "required": true,
            "description": "Object key."
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "version",
            "description": "Optional version to return. If not provided, the latest version is returned.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "7: Studio access to APIs is not allowed."
        },
        "400": {
            "description": "2: The provided data store name is invalid.\r\n3: The provided object key is invalid."
        },
        "404": {
            "description": "10: The data store does not exist.\r\n12: The requested object version does not exist."
        }
    },
    "Internal": true
}
```
<hr>


