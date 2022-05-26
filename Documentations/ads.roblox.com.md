# <b>Ads Api v1</b>

## /v1/sponsored-pages
```json
{
    "Method": "GET",
    "Description": "Retrieves sponsored pages to serve to a user on a specific device type in a specific country.",
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
                                    "description": "The response model for serving a sponsored game.",
                                    "properties": {
                                        "name": {
                                            "description": "The name of the sponsored page.",
                                            "type": "string"
                                        },
                                        "logoImageUrl": {
                                            "description": "The logo image hash of the sponsored page.",
                                            "type": "string"
                                        },
                                        "pageType": {
                                            "enum": {
                                                "1": "Event",
                                                "2": "Sponsored"
                                            },
                                            "description": "The type of the sponsored page.",
                                            "type": "string"
                                        },
                                        "pagePath": {
                                            "description": "The path of the sponsored page.",
                                            "type": "string"
                                        },
                                        "title": {
                                            "description": "The title of the sponsored page.",
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/sponsored-games/click
```json
{
    "Method": "POST",
    "Description": "Records user click of sponsored game to user ad service",
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
            "name": "sponsoredGameCode",
            "required": true,
            "schema": {
                "type": "string"
            },
            "description": "Sponsored game identifier"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "6: The request data format is incorrect."
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
            "description": "3: The sponsored game code is invalid\r\n4: The ad campaign is non-existent"
        },
        "503": {
            "description": "1: This feature is disabled.\r\n5: The user ads service is currently unavailable."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/user-ads/assets/create
```json
{
    "Method": "POST",
    "Description": "Creates a user ad for an asset.",
    "Consumes": "NONE",
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "formData",
            "type": "string",
            "name": "request.name",
            "description": "The user input ad name.",
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Insufficient permissions\r\n2: Ad target is not approved\r\n3: Floodchecked\r\n4: Missing image\r\n5: Invalid image format\r\n6: Invalid image size\r\n7: Ad name was filtered\r\n8: Ad target does not exist\r\n10: Invalid ad name"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user-ads/game-passes/create
```json
{
    "Method": "POST",
    "Description": "Creates a user ad for a game pass.",
    "Consumes": "NONE",
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "gamePassId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "formData",
            "type": "string",
            "name": "request.name",
            "description": "The user input ad name.",
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Insufficient permissions\r\n2: Ad target is not approved\r\n3: Floodchecked\r\n4: Missing image\r\n5: Invalid image format\r\n6: Invalid image size\r\n7: Ad name was filtered\r\n8: Ad target does not exist\r\n10: Invalid ad name"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user-ads/groups/create
```json
{
    "Method": "POST",
    "Description": "Creates a user ad for a group.",
    "Consumes": "NONE",
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "formData",
            "type": "string",
            "name": "request.name",
            "description": "The user input ad name.",
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Insufficient permissions\r\n2: Ad target is not approved\r\n3: Floodchecked\r\n4: Missing image\r\n5: Invalid image format\r\n6: Invalid image size\r\n7: Ad name was filtered\r\n8: Ad target does not exist\r\n10: Invalid ad name"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/sponsored-games/sponsored-game
```json
{
    "Method": "GET",
    "Description": "Retrieves a sponsored game to serve to a user on a specific device type.",
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
                    "type": "object",
                    "description": "The response model for serving a sponsored game.",
                    "properties": {
                        "universeId": {
                            "format": "int64",
                            "description": "ID of the universe representing the sponsored game.",
                            "type": "integer"
                        },
                        "sponsoredGameCode": {
                            "description": "Sponsored game identifier used to call the RecordClick() endpoint.",
                            "type": "string"
                        },
                        "rootPlaceId": {
                            "format": "int64",
                            "description": "ID of the root place of the universe representing the sponsored game.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


