# <b>Badges Api v2</b>

## /v2/universes/{universeId}/badges
```json
{
    "Method": "GET",
    "Description": "Gets badges by their awarding game.",
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
            "description": "The universe Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50,
                "4": 100
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A response containing badge information.",
                                    "properties": {
                                        "enabled": {
                                            "description": "Whether or not the badge is enabled.",
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "description": "The badge description.",
                                            "type": "string"
                                        },
                                        "awardingUniverse": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A response containing universe information.",
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The universe Id.",
                                                        "type": "integer"
                                                    },
                                                    "rootPlaceId": {
                                                        "format": "int64",
                                                        "description": "The description of the universe.",
                                                        "type": "integer"
                                                    },
                                                    "name": {
                                                        "description": "The universe name.",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The universe the badge is being awarded from."
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The badge Id.",
                                            "type": "integer"
                                        },
                                        "iconImageId": {
                                            "format": "int64",
                                            "description": "The badge icon asset Id.",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "The localized name of the badge.",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the badge was updated.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the badge.",
                                            "type": "string"
                                        },
                                        "displayIconImageId": {
                                            "format": "int64",
                                            "description": "The localized badge icon asset Id.",
                                            "type": "integer"
                                        },
                                        "statistics": {
                                            "$ref": {
                                                "properties": {
                                                    "awardedCount": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "winRatePercentage": {
                                                        "type": "number",
                                                        "format": "double"
                                                    },
                                                    "pastDayAwardedCount": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "Badge award statisics."
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the badge was created.",
                                            "type": "string"
                                        },
                                        "displayDescription": {
                                            "description": "The localized badge description.",
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
        "404": {
            "description": "3: The game is invalid or does not exist."
        }
    },
}
```
<hr>


