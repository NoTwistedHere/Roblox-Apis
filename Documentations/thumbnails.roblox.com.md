# <b>Thumbnails Api v1</b>

## /v1/users/avatar
```json
{
    "Method": "GET",
    "Description": "Get Avatar Full body shots for the given CSV of userIds",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "CSV for the userIds to get avatar full body shots",
            "name": "userIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "30x30",
            "enum": {
                "1": "30x30",
                "2": "48x48",
                "3": "60x60",
                "4": "75x75",
                "5": "100x100",
                "6": "110x110",
                "7": "140x140",
                "8": "150x150",
                "9": "150x200",
                "10": "180x180",
                "11": "250x250",
                "12": "352x352",
                "13": "420x420",
                "14": "720x720"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/games/{universeId}/thumbnails
```json
{
    "Method": "GET",
    "Description": "Fetches game thumbnail URLs for a list of universes' thumbnail ids. Ids that do not correspond to a valid thumbnail will be filtered out.",
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
            "required": true
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
            "name": "thumbnailIds"
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "768x432",
            "enum": {
                "1": "768x432",
                "2": "576x324",
                "3": "480x270",
                "4": "384x216",
                "5": "256x144"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        },
        "404": {
            "description": "5: The requested universe does not exist."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/badges/icons
```json
{
    "Method": "GET",
    "Description": "Thumbnails badge icons.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The badge ids.",
            "name": "badgeIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets-thumbnail-3d
```json
{
    "Method": "GET",
    "Description": "Thumbnails assets.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The asset id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "state": {
                            "type": "string",
                            "enum": {
                                "1": "Error",
                                "2": "Completed",
                                "3": "InReview",
                                "4": "Pending",
                                "5": "Blocked"
                            }
                        },
                        "imageUrl": {
                            "type": "string"
                        },
                        "targetId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "4: The requested Ids are invalid, of an invalid type or missing."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/game-passes
```json
{
    "Method": "GET",
    "Description": "Thumbnails game pass icons.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The game pass ids.",
            "name": "gamePassIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/avatar-bust
```json
{
    "Method": "GET",
    "Description": "Get Avatar Busts for the given CSV of userIds",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "CSV for the userIds to get avatar headshots",
            "name": "userIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "50x50",
            "enum": {
                "1": "50x50",
                "2": "60x60",
                "3": "75x75"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/games/multiget/thumbnails
```json
{
    "Method": "GET",
    "Description": "Fetch game thumbnail URLs for a list of universe IDs.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "comma-delimited list of universe IDs",
            "name": "universeIds"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "countPerUniverse",
            "format": "int32",
            "description": "max number of thumbnails to return per universe",
        },
        "3": {
            "in": "query",
            "type": "boolean",
            "name": "defaults",
            "description": "true if defaults (if any) should be returned if no media exists",
        },
        "4": {
            "in": "query",
            "type": "string",
            "default": "768x432",
            "enum": {
                "1": "768x432",
                "2": "576x324",
                "3": "480x270",
                "4": "384x216",
                "5": "256x144"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "6": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "description": "A response model for thumbnails which belong to a specific universe ID",
                                    "properties": {
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Integer universe ID",
                                            "type": "integer"
                                        },
                                        "error": {
                                            "$ref": {
                                                "properties": {
                                                    "message": {
                                                        "type": "string"
                                                    },
                                                    "code": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "field": {
                                                        "type": "string"
                                                    },
                                                    "fieldData": {
                                                        "type": "object"
                                                    },
                                                    "userFacingMessage": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The error data model, if any"
                                        },
                                        "thumbnails": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "state": {
                                                            "type": "string",
                                                            "enum": {
                                                                "1": "Error",
                                                                "2": "Completed",
                                                                "3": "InReview",
                                                                "4": "Pending",
                                                                "5": "Blocked"
                                                            }
                                                        },
                                                        "imageUrl": {
                                                            "type": "string"
                                                        },
                                                        "targetId": {
                                                            "type": "integer",
                                                            "format": "int64"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "An array of ThumbnailResponse objects"
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
            "description": "0: Unknown error\r\n1: There are too many requested Ids.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n5: The requested universe does not exist.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets
```json
{
    "Method": "GET",
    "Description": "Thumbnails assets.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The asset ids.",
            "name": "assetIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "returnPolicy",
            "enum": {
                "1": "PlaceHolder",
                "2": "AutoGenerated",
                "3": "ForceAutoGenerated"
            },
            "description": "Optional policy to use in selecting thumbnail to return (default = PlaceHolder).",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "30x30",
            "enum": {
                "1": "30x30",
                "2": "42x42",
                "3": "50x50",
                "4": "60x62",
                "5": "75x75",
                "6": "110x110",
                "7": "140x140",
                "8": "150x150",
                "9": "160x100",
                "10": "160x600",
                "11": "250x250",
                "12": "256x144",
                "13": "300x250",
                "14": "304x166",
                "15": "384x216",
                "16": "396x216",
                "17": "420x420",
                "18": "480x270",
                "19": "512x512",
                "20": "576x324",
                "21": "700x700",
                "22": "728x90",
                "23": "768x432"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "403": {
            "description": "9: User not authorized to use AutoGenerated or ForceAutoGenerated return policies."
        },
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n8: The requested return policy is invalid (must be PlaceHolder, AutoGenerated or ForceAutoGenerated).\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/avatar-3d
```json
{
    "Method": "GET",
    "Description": "Get Avatar 3d object for a user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "user Id for avatar"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "state": {
                            "type": "string",
                            "enum": {
                                "1": "Error",
                                "2": "Completed",
                                "3": "InReview",
                                "4": "Pending",
                                "5": "Blocked"
                            }
                        },
                        "imageUrl": {
                            "type": "string"
                        },
                        "targetId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "4: The requested Ids are invalid, of an invalid type or missing."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/outfits
```json
{
    "Method": "GET",
    "Description": "Get outfits for the given CSV of userIds",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "name": "userOutfitIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150",
                "2": "420x420"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/bundles/thumbnails
```json
{
    "Method": "GET",
    "Description": "Get bundle thumbnails for the given CSV of bundle ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "CSV for the bundle ids to get bundle thumbnails",
            "name": "bundleIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150",
                "2": "420x420"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/metadata
```json
{
    "Method": "GET",
    "Description": "Return list of thumbnail meta data.",
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
                    "description": "A response model for thumbnails which belong to a specific universe ID",
                    "properties": {
                        "webappCacheExpirationTimspan": {
                            "description": "webapp caching expiration in ms",
                            "type": "string"
                        },
                        "isWebappUseCacheEnabled": {
                            "description": "webapp use cache",
                            "type": "boolean"
                        }
                    }
                }
            }
        }
    },
    "Internal": false
}
```
<hr>


## /v1/games/icons
```json
{
    "Method": "GET",
    "Description": "Fetches game icon URLs for a list of universes' root places. Ids that do not correspond to a valid universe will be filtered out.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The universe ids.",
            "name": "universeIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "returnPolicy",
            "enum": {
                "1": "PlaceHolder",
                "2": "AutoGenerated",
                "3": "ForceAutoGenerated"
            },
            "description": "Optional policy to use in selecting game icon to return (default = PlaceHolder).",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "50x50",
            "enum": {
                "1": "50x50",
                "2": "128x128",
                "3": "150x150",
                "4": "256x256",
                "5": "512x512"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "403": {
            "description": "9: User not authorized to use AutoGenerated or ForceAutoGenerated return policies."
        },
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n8: The requested return policy is invalid (must be PlaceHolder, AutoGenerated or ForceAutoGenerated).\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/developer-products/icons
```json
{
    "Method": "GET",
    "Description": "Thumbnails developer product icons.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The developer product ids.",
            "name": "developerProductIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150",
                "2": "420x420"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/groups/icons
```json
{
    "Method": "GET",
    "Description": "Fetches thumbnail URLs for a list of groups. Ids that do not correspond to groups will be filtered out.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "name": "groupIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "150x150",
            "enum": {
                "1": "150x150",
                "2": "420x420"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/places/gameicons
```json
{
    "Method": "GET",
    "Description": "Fetches game icon URLs for a list of places. Ids that do not correspond to a valid place will be filtered out.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The place ids.",
            "name": "placeIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "returnPolicy",
            "enum": {
                "1": "PlaceHolder",
                "2": "AutoGenerated",
                "3": "ForceAutoGenerated"
            },
            "description": "Optional policy to use in selecting game icon to return (default = PlaceHolder).",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "50x50",
            "enum": {
                "1": "50x50",
                "2": "128x128",
                "3": "150x150",
                "4": "256x256",
                "5": "512x512"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "403": {
            "description": "9: User not authorized to use AutoGenerated or ForceAutoGenerated return policies."
        },
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n8: The requested return policy is invalid (must be PlaceHolder, AutoGenerated or ForceAutoGenerated).\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/batch
```json
{
    "Method": "POST",
    "Description": "Returns a list of thumbnails with varying types and sizes",
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
            "name": "requests",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "isCircular": {
                                "description": "Is the thumbnail circular shape",
                                "type": "boolean"
                            },
                            "type": {
                                "enum": {
                                    "1": "Avatar",
                                    "2": "AvatarHeadShot",
                                    "3": "GameIcon",
                                    "4": "BadgeIcon",
                                    "5": "GameThumbnail",
                                    "6": "GamePass",
                                    "7": "Asset",
                                    "8": "BundleThumbnail",
                                    "9": "Outfit",
                                    "10": "GroupIcon",
                                    "11": "DeveloperProduct",
                                    "12": "AvatarBust",
                                    "13": "AutoGeneratedAsset",
                                    "14": "PlaceIcon"
                                },
                                "description": "The type of the thumbnails",
                                "type": "string"
                            },
                            "targetId": {
                                "format": "int64",
                                "description": "The thumbnail target id",
                                "type": "integer"
                            },
                            "size": {
                                "description": "The thumbnail size",
                                "type": "string"
                            },
                            "alias": {
                                "description": "Alternative string used to identify a thumbnail\r\ninstead of targetId",
                                "type": "string"
                            },
                            "requestId": {
                                "description": "The request id. (Generated client side, used to represent the items in the request)",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "List of ThumbnailBatchRequest objects, may contain the following request types:\r\n            1. Avatar\r\n            2. AvatarHeadShot\r\n            3. GameIcon\r\n            4. BadgeIcon\r\n            5. GameThumbnail\r\n            6. GamePass\r\n            7. Asset\r\n            8. BundleThumbnail\r\n            9. Outfit\r\n            10. GroupIcon\r\n            11. DeveloperProduct\r\n            12. AutoGeneratedAsset\r\n            13. AvatarBust\r\n            14. PlaceIcon"
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "errorMessage": {
                                            "type": "string"
                                        },
                                        "errorCode": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "requestId": {
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
        "403": {
            "description": "9: User not authorized to use AutoGenerated or ForceAutoGenerated return policies."
        },
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n7: The specified type is not supported by the batch endpoint"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/avatar-headshot
```json
{
    "Method": "GET",
    "Description": "Get Avatar Headshots for the given CSV of userIds",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "CSV for the userIds to get avatar headshots",
            "name": "userIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "48x48",
            "enum": {
                "1": "48x48",
                "2": "50x50",
                "3": "60x60",
                "4": "75x75",
                "5": "100x100",
                "6": "110x110",
                "7": "150x150",
                "8": "180x180",
                "9": "352x352",
                "10": "420x420",
                "11": "720x720"
            },
            "description": "The thumbnail size, formatted widthxheight",
            "name": "size",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": "Png",
            "format": "int32",
            "enum": {
                "1": "Png",
                "2": "Jpeg"
            },
            "description": "The thumbnail format",
            "name": "format",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "default": "false",
            "enum": {
                "1": "true",
                "2": "false"
            },
            "description": "The circle thumbnail output parameter, true or false",
            "name": "isCircular",
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Error",
                                                "2": "Completed",
                                                "3": "InReview",
                                                "4": "Pending",
                                                "5": "Blocked"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "type": "integer",
                                            "format": "int64"
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
        "400": {
            "description": "1: There are too many requested Ids.\r\n2: The requested image format is invalid. Please see documentation for valid thumbnail format parameter name and values.\r\n3: The requested size is invalid. Please see documentation for valid thumbnail size parameter name and format.\r\n4: The requested Ids are invalid, of an invalid type or missing.\r\n10: Circular thumbnail requests are not allowed"
        }
    },
    "Internal": false
}
```
<hr>


