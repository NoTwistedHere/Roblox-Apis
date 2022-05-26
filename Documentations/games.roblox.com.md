# <b>Games Api v2</b>

## /v2/games/{universeId}/media
```json
{
    "Method": "GET",
    "Description": "Get the game media data",
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
            "description": "The id of the universe we get media data from."
        }
    },
    "Responses": {
        "200": {
            "description": "Get the game media data successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetTypeId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "videoTitle": {
                                            "type": "string"
                                        },
                                        "videoHash": {
                                            "type": "string"
                                        },
                                        "approved": {
                                            "type": "boolean"
                                        },
                                        "assetType": {
                                            "type": "string"
                                        },
                                        "imageId": {
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
            "description": "3: The universe's root place is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v2/users/{userId}/favorite/games
```json
{
    "Method": "GET",
    "Description": "Gets users favorite games.",
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
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
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
        "4": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "5": {
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
                                    "properties": {
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
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
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        }
    },
}
```
<hr>


## /v2/groups/{groupId}/games
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified group.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
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
        "4": {
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
        "5": {
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
                                    "properties": {
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
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
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        "500": {
            "description": "0: Compliance Context service is unavailable."
        }
    },
}
```
<hr>


## /v2/groups/{groupId}/gamesV2
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified group. This will replace V1 after validation. Note that this can only used for public/all universes.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
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
        "4": {
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
        "5": {
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
                                    "properties": {
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
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
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        "500": {
            "description": "0: Compliance Context service is unavailable."
        },
        "501": {
            "description": "1: Code path is not Implemented."
        }
    },
}
```
<hr>


## /v2/users/{userId}/games
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified user.",
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
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
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
        "4": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "5": {
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
                                    "properties": {
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
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
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        }
    },
}
```
<hr>


