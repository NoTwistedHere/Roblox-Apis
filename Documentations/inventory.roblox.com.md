# <b>Inventory Api v1</b>

## /v1/packages/{packageID}/assets
```json
{
    "Method": "GET",
    "Description": "Given a package ID, returns the list of asset IDs for that package",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "packageID",
            "format": "int64",
            "required": true,
            "description": "The asset ID of the package"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model that contains a list of asset ids",
                    "properties": {
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/assets/collectibles
```json
{
    "Method": "GET",
    "Description": "Gets all collectible assets owned by the specified user.",
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
            "description": "The userid of the owner of the collectibles."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "assetType",
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
            "description": "The asset type for the collectibles you're trying to get.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by userAssetId",
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
            "description": "Collectibles owned by user",
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
                                    "description": "A model containing information about a {Roblox.Platform.AssetOwnership.UserAsset}",
                                    "properties": {
                                        "buildersClubMembershipType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "None",
                                                "2": "BC",
                                                "3": "TBC",
                                                "4": "OBC",
                                                "5": "RobloxPremium"
                                            }
                                        },
                                        "assetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "serialNumber": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "originalPrice": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userAssetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetStock": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "recentAveragePrice": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
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
        "403": {
            "description": "The specified user's inventory is hidden."
        },
        "400": {
            "description": "The specified asset type(s) are invalid."
        }
    },
}
```
<hr>


## /v1/assets/owned
```json
{
    "Method": "GET",
    "Description": "Gets the "My" assets you own of an asset type",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "The {Roblox.Platform.Assets.AssetType} such as 'Model'."
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "limit",
            "format": "int32",
            "required": true,
            "description": "The pagesize."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "required": true,
            "description": "The last id of the previous search"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Assets owned by the player",
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Created": {
                                            "format": "date-time",
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "TypeId": {
                                            "format": "int32",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "AssetGenres": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "Id": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "Updated": {
                                            "format": "date-time",
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "Name": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "IsArchived": {
                                            "readOnly": true,
                                            "type": "boolean"
                                        },
                                        "Description": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "CreatorTargetId": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "CreatorType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "readOnly": true,
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Owned assets"
                        },
                        "nextPageCursor": {
                            "description": "The next page's cursor",
                            "type": "string"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/inventory/{assetType}
```json
{
    "Method": "GET",
    "Description": "Gets a list of assets by type for the specified user.
Note that the 'Hat' asset type may return accessories while we are migrating.",
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
            "description": "The user identifier."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "assetType",
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
            "required": true,
            "description": "The asset type."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "pageNumber",
            "format": "int32",
            "description": "The start index.",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "itemsPerPage",
            "format": "int32",
            "description": "The max number of items that can be returned.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "keyword",
            "description": "Filter results for items containing this.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "total": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "data": {
                            "items": {
                                "type": "object"
                            },
                            "type": "array"
                        },
                        "includesAccessories": {
                            "type": "boolean"
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


## /v1/users/{userId}/items/{itemType}/{itemTargetId}
```json
{
    "Method": "GET",
    "Description": "Gets owned items of the specified item type. Game Servers can make requests for any user, but can only make requests for game passes that belong to the place sending the request.
Place creators can make requests as if they were the Game Server.",
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
            "description": "ID of the user in question"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "itemType",
            "enum": {
                "1": "Asset",
                "2": "GamePass",
                "3": "Badge",
                "4": "Bundle"
            },
            "required": true,
            "description": "Type of the item in question (ie. Asset, GamePass)"
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "itemTargetId",
            "format": "int64",
            "required": true,
            "description": "ID of the item in question"
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
                                    "description": "Model representing an inventory item",
                                    "properties": {
                                        "Id": {
                                            "readOnly": true,
                                            "format": "int64",
                                            "description": "The ID of the item",
                                            "type": "integer"
                                        },
                                        "Type": {
                                            "readOnly": true,
                                            "enum": {
                                                "1": "Asset",
                                                "2": "GamePass",
                                                "3": "Badge",
                                                "4": "Bundle"
                                            },
                                            "description": "The type of the item",
                                            "type": "string"
                                        },
                                        "Name": {
                                            "type": "string",
                                            "description": "The name of the item",
                                            "readOnly": true
                                        },
                                        "InstanceId": {
                                            "readOnly": true,
                                            "format": "int64",
                                            "description": "The instance id of the item if applicable",
                                            "type": "integer"
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
            "description": "4: You don't have permissions for the specificed user.\r\n9: The game pass does not belong to this place."
        },
        "400": {
            "description": "1: The specified user does not exist!\r\n5: The specified game pass does not exist! Are you using the new game pass ID?\r\n6: The specified item type does not exist.\r\n7: The specified Asset does not exist!\r\n10: The specified asset is not a badge!\r\n12: The specified bundle does not exist!"
        }
    },
}
```
<hr>


## /v1/users/{userId}/can-view-inventory
```json
{
    "Method": "GET",
    "Description": "Gets whether the specified user's inventory can be viewed.",
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
            "description": "The user identifier."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "canView": {
                            "description": "Boolean describing if the user's inventory can be viewed",
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: The specified user does not exist!"
        }
    },
}
```
<hr>


