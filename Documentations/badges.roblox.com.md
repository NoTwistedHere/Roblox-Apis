# <b>Badges Api v1</b>

## /v1/user/badges/{badgeId}
```json
{
    "Method": "DELETE",
    "Description": "Removes a badge from the authenticated user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge Id."
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "404": {
            "description": "1: Badge is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}
```json
{
    "Method": "PATCH",
    "Description": "Updates badge configuration.",
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
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model used for updating badge information.",
                    "properties": {
                        "enabled": {
                            "description": "The new enabled state of the badge.",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The new badge name.",
                            "type": "string"
                        },
                        "description": {
                            "description": "The new badge description.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to manage this badge."
        },
        "400": {
            "description": "6: Text moderated."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
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
        "404": {
            "description": "1: Badge is invalid or does not exist."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets badge information by the badge Id.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge Id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
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
            }
        },
        "404": {
            "description": "1: Badge is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/universes/{universeId}/badges
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
        "3": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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


## /v1/users/{userId}/badges
```json
{
    "Method": "GET",
    "Description": "Gets a list of badges a user has been awarded.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user Id."
        },
        "2": {
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
        "3": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
                                    "properties": {
                                        "enabled": {
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "iconImageId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "displayName": {
                                            "type": "string"
                                        },
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "displayIconImageId": {
                                            "type": "integer",
                                            "format": "int64"
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
                                            }
                                        },
                                        "awarder": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Place"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "displayDescription": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
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
            "description": "4: User is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/users/{userId}/badges/awarded-dates
```json
{
    "Method": "GET",
    "Description": "Gets timestamps for when badges were awarded to a user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user Id."
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The CSV of badge Ids.",
            "name": "badgeIds"
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
                                    "description": "The result of being awarded a badge.",
                                    "properties": {
                                        "badgeId": {
                                            "format": "int64",
                                            "description": "The badge Id.",
                                            "type": "integer"
                                        },
                                        "awardedDate": {
                                            "format": "date-time",
                                            "description": "When the badge was awarded.",
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
        "400": {
            "description": "5: Too many badge Ids."
        },
        "404": {
            "description": "4: User is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/users/{userId}/badges/{badgeId}/award-badge
```json
{
    "Method": "POST",
    "Description": "Award a badge to a user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge id."
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "description": "The place id.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The result of awarding a badge to a user.",
                    "properties": {
                        "creatorId": {
                            "format": "int64",
                            "description": "Id of the badge creator.",
                            "type": "integer"
                        },
                        "awardAssetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The ids of the assets awarded with the badge."
                        },
                        "creatorType": {
                            "description": "Type of the badge creator (e.g. User, Group).",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "8: The place doesn't have permission to award the badge.\r\n9: Failed to award badge."
        },
        "400": {
            "description": "7: Place is invalid or does not exist."
        },
        "404": {
            "description": "1: Badge is invalid or does not exist.\r\n4: User is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/user/{userId}/badges/{badgeId}
```json
{
    "Method": "DELETE",
    "Description": "Removes a badge from the user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge Id."
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "404": {
            "description": "1: Badge is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


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


