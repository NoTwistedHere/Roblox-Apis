# <b>Avatar Api v1</b>

## /v1/avatar/assets/{assetId}/wear
```json
{
    "Method": "POST",
    "Description": "Puts the asset on the authenticated user's avatar.",
    "Consumes": "NONE",
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
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: You must own an asset to wear it."
        },
        "400": {
            "description": "2: Failed to wear asset."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/avatar
```json
{
    "Method": "GET",
    "Description": "Returns details about a specified user's avatar",
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
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing details about an avatar",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "scales": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "defaultPantsApplied": {
                            "type": "boolean"
                        },
                        "defaultShirtApplied": {
                            "type": "boolean"
                        },
                        "playerAvatarType": {
                            "type": "string",
                            "enum": {
                                "1": "R6",
                                "2": "R15"
                            }
                        },
                        "assets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The specified user does not exist.\r\n2: An account for the given userId does not exist!"
        }
    },
}
```
<hr>


## /v1/avatar/assets/{assetId}/remove
```json
{
    "Method": "POST",
    "Description": "Removes the asset from the authenticated user's avatar.",
    "Consumes": "NONE",
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
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: You must be wearing the asset to remove it."
        },
        "400": {
            "description": "2: Failed to remove asset."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/outfits/{userOutfitId}
```json
{
    "Method": "PATCH",
    "Description": "Updates the contents of an outfit.",
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
            "name": "userOutfitId",
            "format": "int64",
            "required": true,
            "description": "The user outfit id."
        },
        "2": {
            "in": "body",
            "name": "outfitUpdateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing details needed to update or create an outfit",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "name": {
                            "type": "string"
                        },
                        "playerAvatarType": {
                            "type": "string"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "scale": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        }
                    }
                }
            },
            "description": "The updated outfit"
        }
    },
    "Responses": {
        "500": {
            "description": "6: An error occurred while trying to update the outfit"
        },
        "400": {
            "description": "1: The specified userOutfit does not exist!\r\n1: Must provide both assetIds and bodyColors in to update outfit contents.\r\n3: Body colors must be valid BrickColor IDs\r\n4: Invalid outfit name\r\n5: Asset is not wearable by you\r\n8: Invalid Player Avatar Type. Valid types are R6 and R15"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A slim model for user outfits",
                    "properties": {
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "name": {
                            "type": "string"
                        },
                        "isEditable": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: You don't have permission to update this outfit."
        }
    },
}
```
<hr>


## /v1/try-on/2d
```json
{
    "Method": "GET",
    "Description": "2D asset try-on endpoint",
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
            "description": "assetIds to attempt to try on",
            "name": "assetIds"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "required": true,
            "description": ""
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "format",
            "required": true,
            "description": ""
        },
        "5": {
            "in": "query",
            "type": "boolean",
            "name": "addAccoutrements",
            "description": "whether to include currently worn assets in the new outfit",
        }
    },
    "Responses": {
        "403": {
            "description": "3: Cannot wear Delayed Release Asset\r\n4: Cannot wear the specified asset"
        },
        "400": {
            "description": "2: Invalid Asset\r\n5: Invalid Dimensions"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model that contains a try-on thumbnail url and whether the url is final",
                    "properties": {
                        "final": {
                            "type": "boolean"
                        },
                        "url": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "1: Too many requests"
        }
    },
}
```
<hr>


## /v1/avatar
```json
{
    "Method": "GET",
    "Description": "Returns details about the authenticated user's avatar",
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
                    "description": "A model containing details about an avatar",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "scales": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "defaultPantsApplied": {
                            "type": "boolean"
                        },
                        "defaultShirtApplied": {
                            "type": "boolean"
                        },
                        "playerAvatarType": {
                            "type": "string",
                            "enum": {
                                "1": "R6",
                                "2": "R15"
                            }
                        },
                        "assets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/avatar/set-player-avatar-type
```json
{
    "Method": "POST",
    "Description": "Sets the authenticated user's player avatar type (e.g. R6 or R15).",
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
            "name": "playerAvatarTypeModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model that contains a playerAvatarType",
                    "properties": {
                        "playerAvatarType": {
                            "type": "string",
                            "enum": {
                                "1": "R6",
                                "2": "R15"
                            }
                        }
                    }
                }
            },
            "description": "R6 or R15"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not allowed to change player avatar type."
        },
        "400": {
            "description": "1: Invalid playerAvatarType. Valid values are: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/outfits/{userOutfitId}/details
```json
{
    "Method": "GET",
    "Description": "Gets details about the contents of an outfit.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userOutfitId",
            "format": "int64",
            "required": true,
            "description": "The user outfit id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing details about a user outfit",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "assets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "name": {
                            "type": "string"
                        },
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "scale": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "playerAvatarType": {
                            "type": "string"
                        },
                        "isEditable": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The specified userOutfitId is invalid.\r\n2: The outfit for the specified userOutfit is invalid."
        }
    },
}
```
<hr>


## /v1/recent-items/{recentItemListType}/list
```json
{
    "Method": "GET",
    "Description": "Returns a list of recent items
Recent items can be Assets or Outfits",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "recentItemListType",
            "enum": {
                "1": "All",
                "2": "Clothing",
                "3": "BodyParts",
                "4": "AvatarAnimations",
                "5": "Accessories",
                "6": "Outfits",
                "7": "Gear"
            },
            "required": true
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
                                    "description": "A model containing details about a recent item",
                                    "properties": {
                                        "type": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Asset",
                                                "2": "Outfit"
                                            }
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        },
                                        "isEditable": {
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "total": {
                            "type": "integer",
                            "format": "int64"
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
}
```
<hr>


## /v1/try-on/metadata
```json
{
    "Method": "GET",
    "Description": "Try-on related-metadata endpoint",
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
                    "description": "A model that contains metadata for the try-on endpoints",
                    "properties": {
                        "tryOnEndpointsEnabled": {
                            "type": "boolean"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/outfits
```json
{
    "Method": "GET",
    "Description": "Gets a list of outfits for the specified user.",
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
            "description": "The user id"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "page",
            "format": "int32",
            "description": "The page number",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "itemsPerPage",
            "format": "int32",
            "description": "The max number of outfits that can be returned",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "name": "isEditable",
            "description": "Whether the outfits are editable. A null value will lead to no filtering.",
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
                                "$ref": {
                                    "type": "object",
                                    "description": "A slim model for user outfits",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "isEditable": {
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "filteredCount": {
                            "type": "integer",
                            "format": "int32"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: The specified user does not exist.\r\n2: An account for the given userId does not exist!"
        }
    },
}
```
<hr>


## /v1/avatar/set-body-colors
```json
{
    "Method": "POST",
    "Description": "Sets the authenticated user's body colors",
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
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model container BrickColor ids for each body part.",
                    "properties": {
                        "headColorId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "torsoColorId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "rightArmColorId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "rightLegColorId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "leftLegColorId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "leftArmColorId": {
                            "type": "integer",
                            "format": "int32"
                        }
                    }
                }
            },
            "name": "bodyColorsModel"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/emotes/set-all-emotes
```json
{
    "Method": "POST",
    "Description": "Sets the avatar's current emotes to the list",
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
            "name": "emoteRequestModels",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Request model to equip a emote",
                        "properties": {
                            "position": {
                                "format": "int32",
                                "description": "The position to equip the emote to",
                                "type": "integer"
                            },
                            "assetId": {
                                "format": "int64",
                                "description": "The asset id of the emote",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "description": "The list of emotes"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for set all emotes",
                    "properties": {
                        "Invalid Emotes": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response object representing an invalid emote",
                                    "properties": {
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The asset id of the emote",
                                            "type": "integer"
                                        },
                                        "error": {
                                            "description": "The error occured while trying to equip this emote",
                                            "type": "string"
                                        },
                                        "position": {
                                            "format": "int32",
                                            "description": "The position the emote is equipped to",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Response object representing all invalid emotes"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: Emotes are currently unavailable."
        },
        "400": {
            "description": "2: That emote position is invalid\r\n3: You must own that emote to equip it.\r\n4: That asset is not valid emote.\r\n5: That asset is not valid asset."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/try-on/3d
```json
{
    "Method": "GET",
    "Description": "3D asset try-on endpoint",
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
            "description": "assetIds to attempt to try on",
            "name": "assetIds"
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "addAccoutrements",
            "description": "whether to use currently worn assets in the new outfit",
        }
    },
    "Responses": {
        "403": {
            "description": "3: Cannot wear Delayed Release Asset\r\n4: Cannot wear the specified asset"
        },
        "400": {
            "description": "2: Invalid Asset"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model that contains a try-on thumbnail url and whether the url is final",
                    "properties": {
                        "final": {
                            "type": "boolean"
                        },
                        "url": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "1: Too many requests"
        }
    },
}
```
<hr>


## /v1/outfits/{userOutfitId}/delete
```json
{
    "Method": "POST",
    "Description": "Deletes the outfit",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userOutfitId",
            "format": "int64",
            "required": true,
            "description": "The user outfit id"
        }
    },
    "Responses": {
        "500": {
            "description": "3: An error occurred while deleting the outfit."
        },
        "400": {
            "description": "1: The specified userOutfitId is invalid!"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: You don't have permission to delete this outfit."
        }
    },
}
```
<hr>


## /v1/avatar-fetch
```json
{
    "Method": "GET",
    "Description": "This endpoint returns a bunch of data used by client to create the avatar in game.  
It's a replacement for Avatar-fetch v1.1
The difference from AvatarFetch is that we take the avatar's scaling (not the universe's) and we return
a collection of asset type and asset ids instead of asset version ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "resolvedAvatarType": {
                            "type": "string"
                        },
                        "scales": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "animationAssetIds": {
                            "additionalProperties": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "object"
                        },
                        "assetAndAssetTypeIds": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetTypeId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "backpackGearVersionIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "equippedGearVersionIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
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


## /v1/users/{userId}/currently-wearing
```json
{
    "Method": "GET",
    "Description": "Gets a list of asset ids that the user is currently wearing",
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
        },
        "400": {
            "description": "1: The specified user does not exist.\r\n2: An account for the given userId does not exist!"
        }
    },
}
```
<hr>


## /v1/avatar-rules
```json
{
    "Method": "GET",
    "Description": "Returns the business rules related to avatars",
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
                    "description": "A model containing details about avatar-related business rules",
                    "properties": {
                        "bodyColorsPalette": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model container BrickColor ids for each body part.",
                                    "properties": {
                                        "hexColor": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "brickColorId": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "bundlesEnabledForUser": {
                            "type": "boolean"
                        },
                        "emotesEnabledForUser": {
                            "type": "boolean"
                        },
                        "proportionsAndBodyTypeEnabledForUser": {
                            "type": "boolean"
                        },
                        "wearableAssetTypes": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset type and its business rules",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "maxNumber": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "name": {
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "playerAvatarTypes": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "R6",
                                    "2": "R15"
                                }
                            },
                            "type": "array"
                        },
                        "scales": {
                            "additionalProperties": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model that contains information about the max/mins for each scale",
                                    "properties": {
                                        "min": {
                                            "type": "number",
                                            "format": "double"
                                        },
                                        "increment": {
                                            "type": "number",
                                            "format": "double"
                                        },
                                        "max": {
                                            "type": "number",
                                            "format": "double"
                                        }
                                    }
                                }
                            },
                            "type": "object"
                        },
                        "minimumDeltaEBodyColorDifference": {
                            "type": "number",
                            "format": "double"
                        },
                        "defaultClothingAssetLists": {
                            "$ref": {
                                "type": "object",
                                "description": "A model containing details about avatar-related business rules",
                                "properties": {
                                    "defaultPantAssetIds": {
                                        "items": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "type": "array"
                                    },
                                    "defaultShirtAssetIds": {
                                        "items": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "type": "array"
                                    }
                                }
                            }
                        },
                        "basicBodyColorsPalette": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model container BrickColor ids for each body part.",
                                    "properties": {
                                        "hexColor": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "brickColorId": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    }
                                }
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


## /v1/outfits/{userOutfitId}/wear
```json
{
    "Method": "POST",
    "Description": "Wears the outfit",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userOutfitId",
            "format": "int64",
            "required": true,
            "description": "The user outfit id"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model for wear outfit responses",
                    "properties": {
                        "invalidAssets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "invalidAssetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/avatar/set-wearing-assets
```json
{
    "Method": "POST",
    "Description": "Sets the avatar's current assets to the list",
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
            "name": "assetIdsModel",
            "required": true,
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
            },
            "description": "The list of asset IDs"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model for wear outfit responses",
                    "properties": {
                        "invalidAssets": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing details about an asset",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "assetType": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model containing details about an asset type",
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "invalidAssetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "2: Failed to wear asset."
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/avatar/set-scales
```json
{
    "Method": "POST",
    "Description": "Sets the authenticated user's scales",
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
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "bodyType": {
                            "type": "number",
                            "format": "double"
                        },
                        "head": {
                            "type": "number",
                            "format": "double"
                        },
                        "height": {
                            "type": "number",
                            "format": "double"
                        },
                        "depth": {
                            "type": "number",
                            "format": "double"
                        },
                        "proportion": {
                            "type": "number",
                            "format": "double"
                        },
                        "width": {
                            "type": "number",
                            "format": "double"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "scalesModel"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n3: The user does not have permissions to change scales."
        },
        "400": {
            "description": "1: Please pass in the scales JSON"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/avatar/redraw-thumbnail
```json
{
    "Method": "POST",
    "Description": "Requests the authenticated user's thumbnail be redrawn",
    "Consumes": "NONE",
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
                    "description": "Empty response, will be in WebAPI base soon",
                    "properties": {
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "429": {
            "description": "1: Redrawing your avatar thumbnail is floodchecked at this time\r\n1: Redrawing your avatar thumbnail is floodchecked at this time"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/outfits/{userOutfitId}/update
```json
{
    "Method": "POST",
    "Description": "Updates the contents of the outfit.",
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
            "name": "userOutfitId",
            "format": "int64",
            "required": true,
            "description": "The user outfit id."
        },
        "2": {
            "in": "body",
            "name": "outfitUpdateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing details needed to update or create an outfit",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "name": {
                            "type": "string"
                        },
                        "playerAvatarType": {
                            "type": "string"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "scale": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        }
                    }
                }
            },
            "description": "The updated outfit"
        }
    },
    "Responses": {
        "500": {
            "description": "6: An error occurred while trying to update the outfit"
        },
        "400": {
            "description": "1: The specified userOutfit does not exist!\r\n3: Body colors must be valid BrickColor IDs\r\n4: Invalid outfit name\r\n5: Asset is not wearable by you\r\n7: Invalid assetIds\r\n8: Invalid Player Avatar Type. Valid types are R6 and R15"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: You don't have permission to update this outfit."
        }
    },
}
```
<hr>


## /v1/emotes/{assetId}/{position}
```json
{
    "Method": "POST",
    "Description": "Equip an emote asset in specific positions",
    "Consumes": "NONE",
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
            "description": ""
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "position",
            "format": "int32",
            "required": true,
            "description": ""
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
            "description": "0: Token Validation Failed\r\n1: Emotes are currently unavailable."
        },
        "400": {
            "description": "2: That emote position is invalid\r\n3: You must own that emote to equip it.\r\n4: That asset is not valid emote.\r\n5: That asset is not valid asset."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/emotes/{position}
```json
{
    "Method": "DELETE",
    "Description": "Unequip an emote from specified positions",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "position",
            "format": "int32",
            "required": true,
            "description": "The user's emote position to unequip"
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
            "description": "0: Token Validation Failed\r\n1: Emotes are currently unavailable."
        },
        "400": {
            "description": "2: That emote position is invalid"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/avatar/metadata
```json
{
    "Method": "GET",
    "Description": "Returns metadata used by the avatar page of the website",
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
                    "description": "A model containing website metadata for avatars",
                    "properties": {
                        "isAvatarScaleEmbeddedInTab": {
                            "description": "Whether or not the Scales is embedded in the tab",
                            "type": "boolean"
                        },
                        "isBodyTypeScaleOutOfTab": {
                            "description": "Whether or not the Boby Type scale is embedded in the tab",
                            "type": "boolean"
                        },
                        "showDefaultClothingMessageOnPageLoad": {
                            "description": "Whether or not to show the default clothing message when the page loads",
                            "type": "boolean"
                        },
                        "scaleWidthIncrement": {
                            "format": "double",
                            "description": "How much the width scaler should increment by",
                            "type": "number"
                        },
                        "enableDefaultClothingMessage": {
                            "description": "Whether or not to show the Default Clothing message",
                            "type": "boolean"
                        },
                        "scaleHeadIncrement": {
                            "format": "double",
                            "description": "How much the head scaler should increment by",
                            "type": "number"
                        },
                        "supportProportionAndBodyType": {
                            "description": "Whether or not to support proportion and body type",
                            "type": "boolean"
                        },
                        "scaleHeightIncrement": {
                            "format": "double",
                            "description": "How much the height scaler should increment by",
                            "type": "number"
                        },
                        "scaleProportionIncrement": {
                            "format": "double",
                            "description": "How much the proportion scaler should increment by",
                            "type": "number"
                        },
                        "scaleBodyTypeIncrement": {
                            "format": "double",
                            "description": "How much the body type scaler should increment by",
                            "type": "number"
                        },
                        "areThreeDeeThumbsEnabled": {
                            "description": "Whether or not 3D thumbnails are shown",
                            "type": "boolean"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/outfits/create
```json
{
    "Method": "POST",
    "Description": "Creates a new outfit.",
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
            "name": "outfitUpdateModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing details needed to update or create an outfit",
                    "properties": {
                        "bodyColors": {
                            "$ref": {
                                "type": "object",
                                "description": "A model container BrickColor ids for each body part.",
                                "properties": {
                                    "headColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "torsoColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "rightLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftLegColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "leftArmColorId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                }
                            }
                        },
                        "name": {
                            "type": "string"
                        },
                        "playerAvatarType": {
                            "type": "string"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "scale": {
                            "$ref": {
                                "properties": {
                                    "bodyType": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "head": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "height": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "depth": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "proportion": {
                                        "type": "number",
                                        "format": "double"
                                    },
                                    "width": {
                                        "type": "number",
                                        "format": "double"
                                    }
                                },
                                "type": "object"
                            }
                        }
                    }
                }
            },
            "description": "The new outfit"
        }
    },
    "Responses": {
        "500": {
            "description": "6: An error occurred while creating the outfit"
        },
        "400": {
            "description": "3: Body colors must be valid BrickColor IDs\r\n4: Invalid outfit name\r\n5: Asset is not wearable by you and was not added to the outfit\r\n7: Invalid Player Avatar Type. Valid types are R6 and R15\r\n8: Invalid assetIds"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "success": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: You already have the maximum number of outfits"
        }
    },
}
```
<hr>


## /v1/emotes
```json
{
    "Method": "GET",
    "Description": "Get all emote configurations",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Response object representing a user's emote",
                        "properties": {
                            "assetId": {
                                "format": "int64",
                                "description": "The asset id of the emote",
                                "type": "integer"
                            },
                            "assetName": {
                                "description": "The name of the emote",
                                "type": "string"
                            },
                            "position": {
                                "format": "int32",
                                "description": "The position the emote is equipped to",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "403": {
            "description": "1: Emotes are currently unavailable."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


