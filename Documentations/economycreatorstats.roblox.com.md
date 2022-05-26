# <b>Roblox.EconomyCreatorStats.Api v1</b>

## /v1/asset/{assetId}/premium-upsell-shown/increment
```json
{
    "Method": "POST",
    "Description": "Increment premium upsell shown for an asset.",
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
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The asset id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "location": {
                            "description": "The location where premium upsell happens",
                            "type": "string"
                        }
                    },
                    "type": "object",
                    "description": "A request model for incrementing premium upsell.",
                    "required": {
                        "1": "location"
                    }
                }
            },
            "description": "The {Roblox.EconomyCreatorStats.Api.Models.IncrementPremiumUpsellRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "8: AssetId is invalid.\r\n9: Location cannot be empty."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n2: Not authorized to perform this action."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "6: User is flooded"
        },
        "503": {
            "description": "7: This feature is disabled."
        }
    },
}
```
<hr>


## /v1/universes/{universeId}/premium-upsells/increment
```json
{
    "Method": "POST",
    "Description": "Increment premium upsell for a universe.",
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
            "description": "The universe id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: The Universe is invalid."
        },
        "401": {
            "description": "2: Not authorized to perform this action."
        }
    },
}
```
<hr>


## /v1/bundle/{bundleId}/premium-upsell-shown/increment
```json
{
    "Method": "POST",
    "Description": "Increment premium upsell shown for a bundle.",
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
            "in": "path",
            "type": "integer",
            "name": "bundleId",
            "format": "int64",
            "required": true,
            "description": "The bundle id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "location": {
                            "description": "The location where premium upsell happens",
                            "type": "string"
                        }
                    },
                    "type": "object",
                    "description": "A request model for incrementing premium upsell.",
                    "required": {
                        "1": "location"
                    }
                }
            },
            "description": "The {Roblox.EconomyCreatorStats.Api.Models.IncrementPremiumUpsellRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "9: Location cannot be empty.\r\n10: BundleId is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n2: Not authorized to perform this action."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "6: User is flooded"
        },
        "503": {
            "description": "7: This feature is disabled."
        }
    },
}
```
<hr>


## /v1/universes/{universeId}/stats
```json
{
    "Method": "GET",
    "Description": "Get statistics data for a universe.",
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
            "description": "The universe id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "request.type",
            "enum": {
                "1": "PremiumUpsells",
                "2": "PremiumVisits"
            },
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.startTime",
            "required": true
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "request.endTime",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model",
                    "properties": {
                        "data": {
                            "additionalProperties": {
                                "items": {
                                    "items": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "type": "array"
                                },
                                "type": "array"
                            },
                            "type": "object"
                        },
                        "dataGranularity": {
                            "type": "string",
                            "enum": {
                                "1": "Hourly",
                                "2": "Daily",
                                "3": "Monthly"
                            }
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The Universe is invalid.\r\n3: Too many data points requested.\r\n4: The requested data type is not known."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n2: Not authorized to perform this action."
        }
    },
}
```
<hr>


## /v1/universes/{universeId}/premium-impressions/increment
```json
{
    "Method": "POST",
    "Description": "Increment premium Impression for a universe.",
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
            "description": "The universe id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: The Universe is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n2: Not authorized to perform this action."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "6: User is flooded"
        }
    },
}
```
<hr>


