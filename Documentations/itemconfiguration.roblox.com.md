# <b>ItemConfiguration Api v1</b>

## /v1/avatar-assets/{assetType}/upload-captcha-test
```json
{
    "Method": "POST",
    "Description": "An endpoint to check if captcha is needed for an upload of the given asset type",
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
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "body",
            "name": "captchaTokenRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "captchaToken": {
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for checking if captcha is needed for uploading an avatar asset",
                    "properties": {
                        "message": {
                            "description": "The message field for running the captcha prompt on the client",
                            "type": "string"
                        },
                        "success": {
                            "description": "Whether the check was successful",
                            "type": "boolean"
                        },
                        "fieldData": {
                            "description": "An arbitrary string of field data for use with the given captcha provider",
                            "type": "string"
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
    "Internal": false
}
```
<hr>


## /v1/tags/prefix-search
```json
{
    "Method": "GET",
    "Description": "Searches for up to numberOfResults tags based on the given prefix",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "prefix",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "numberOfResults",
            "format": "int32",
            "required": true,
            "description": "Must be 1, 5, 10, or 25"
        }
    },
    "Responses": {
        "403": {
            "description": "4: This endpoint is not yet enabled for the current user"
        },
        "400": {
            "description": "5: The given prefix is invalid\r\n6: The number of results requested is invalid"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "The tag model for any tag-related gets",
                                    "properties": {
                                        "status": {
                                            "enum": {
                                                "1": "Success",
                                                "2": "MissingItem"
                                            },
                                            "description": "Gets or sets the status for the fetch of this tag",
                                            "type": "string"
                                        },
                                        "localizedDisplayName": {
                                            "description": "Gets or sets the localized display name of the tag",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Gets or sets the name of the tag",
                                            "type": "string"
                                        },
                                        "tagId": {
                                            "description": "Gets or sets the tag Id",
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
        "429": {
            "description": "3: Too many requests"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/avatar-assets/{assetType}/upload
```json
{
    "Method": "POST",
    "Description": "Attempts to upload the new asset and charges any upload fees necessary in the process",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
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
            "description": "The asset type being uploaded"
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "requestModel.files",
        }
    },
    "Responses": {
        "402": {
            "description": "6: The creator does not have enough Robux to pay for the upload fees"
        },
        "500": {
            "description": "10: There was a problem while trying to get the details for the upload fee\r\n11: There was a problem while trying to filter the name and description for the asset\r\n12: There was a problem while trying to upload the new asset"
        },
        "400": {
            "description": "2: The given asset type is not allowed for upload through the given endpoint\r\n3: The given creator Id is invalid\r\n4: The given creator type is invalid\r\n5: No file was found with the request\r\n7: The uploaded file did not contain valid contents for the given asset type\r\n8: The uploaded file did not have a valid extension for the given asset type"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "A model containing information about the amount of Robux paid and the new asset's Id",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Defines the response model for the v1/avatar-assets/{assetType}/upload endpoint",
                    "properties": {
                        "robuxAmountPaid": {
                            "format": "int64",
                            "description": "Gets the amount of Robux paid as an upload fee",
                            "type": "integer"
                        },
                        "assetId": {
                            "format": "int64",
                            "description": "Gets the new asset's Id",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n9: The user does not have permission to upload\r\n15: Captcha required"
        },
        "503": {
            "description": "1: The endpoint is unavailable"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/metadata
```json
{
    "Method": "GET",
    "Description": "Gets the metadata related to assets and bundles",
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
                    "description": "Item related metadata response model",
                    "properties": {
                        "allowedAssetTypesForRelease": {
                            "type": "object",
                            "additionalProperties": {
                                "$ref": {
                                    "properties": {
                                        "marketplaceFeesPercentage": {
                                            "format": "int32",
                                            "description": "Commission fees percentage for marketplace",
                                            "type": "integer"
                                        },
                                        "allowedPriceRange": {
                                            "$ref": {
                                                "properties": {
                                                    "minRobux": {
                                                        "format": "int64",
                                                        "description": "Minimum price in Robux to release the asset",
                                                        "type": "integer"
                                                    },
                                                    "maxRobux": {
                                                        "format": "int64",
                                                        "description": "Maximum price in Robux to release the asset",
                                                        "type": "integer"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "Allowed Price Range for release"
                                        },
                                        "premiumPricing": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Defines the metadata for reading about allowed premium pricing rules",
                                                "properties": {
                                                    "allowedPriceRange": {
                                                        "$ref": {
                                                            "properties": {
                                                                "minRobux": {
                                                                    "format": "int64",
                                                                    "description": "Minimum price in Robux to release the asset",
                                                                    "type": "integer"
                                                                },
                                                                "maxRobux": {
                                                                    "format": "int64",
                                                                    "description": "Maximum price in Robux to release the asset",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "description": "The allowed price range for Premium-only pricing"
                                                    },
                                                    "allowedDiscountPercentages": {
                                                        "items": {
                                                            "type": "integer",
                                                            "format": "int32"
                                                        },
                                                        "type": "array",
                                                        "description": "The allowed discount percentages for a Premium discount"
                                                    }
                                                }
                                            },
                                            "description": "The rules for premium pricing"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "description": "Gets Dictionary of all allowed assetTypes that can be released, along with the relevant release related metadata"
                        },
                        "allowedAssetTypeForUpload": {
                            "type": "object",
                            "additionalProperties": {
                                "$ref": {
                                    "properties": {
                                        "allowedFileExtensions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array",
                                            "description": "List of string specifiying allowed file extentions for upload"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "description": "Gets Dictionary of all allowed assetTypes that can be uploaded, along with the relevant upload related metadata"
                        },
                        "allowedAssetTypesForFree": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "Gets Array of all allowed assetTypes that can be free"
                        },
                        "allowedAssetTypesForSaleAvailabilityLocations": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "Gets Array of all allowed assetTypes that have the custom sale availability locations feature enabled"
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


## /v1/assets/{assetId}/update-price
```json
{
    "Method": "POST",
    "Description": "Update the price for the given asset",
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
            "description": ""
        },
        "2": {
            "in": "body",
            "name": "updatePriceForAssetRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Sets Price associated with the asset before releasing it\r\nNote: This is now considered deprecated in favor of PriceConfiguration",
                            "type": "integer"
                        },
                        "priceConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the configuration options for an items price",
                                "properties": {
                                    "premiumDiscountPercentage": {
                                        "format": "int32",
                                        "description": "Gets or sets the discount rate on the price of the item that is given to premium users\r\nShould not be used while applying a PremiumPriceInRobux",
                                        "type": "integer"
                                    },
                                    "premiumPriceInRobux": {
                                        "format": "int64",
                                        "description": "Gets or sets the price of the item in Robux that applies only to premium users\r\nShould not be used while applying a PremiumDiscountPercentage",
                                        "type": "integer"
                                    },
                                    "priceInRobux": {
                                        "format": "int64",
                                        "description": "Gets or sets the standard price of the item in Robux",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Gets or sets the price configuration associated with the asset before releasing it"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Cannot release the associated asset type\r\n4: Cannot release asset that is pending review\r\n5: Asset is moderated\r\n7: User does not have permission to release\r\n26: User does not have permission for the group owned asset"
        },
        "400": {
            "description": "1: Asset price is too high\r\n2: Invalid asset Id\r\n8: User does not own the asset\r\n9: Asset price is too low\r\n10: Missing/Null request parameters\r\n27: Premium price not enabled for asset type\r\n28: Premium discount percentage is not one of the allowed values\r\n29: Pricing configuration combination is invalid\r\n30: Price is missing"
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
        "429": {
            "description": "16: Flood Limit Exceeded"
        },
        "503": {
            "description": "17: Service Unavailable"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/tags
```json
{
    "Method": "GET",
    "Description": "Gets the information for a list of tag Ids",
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
                "type": "string"
            },
            "required": true,
            "description": "",
            "name": "tagIds"
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
                                    "description": "The tag model for any tag-related gets",
                                    "properties": {
                                        "status": {
                                            "enum": {
                                                "1": "Success",
                                                "2": "MissingItem"
                                            },
                                            "description": "Gets or sets the status for the fetch of this tag",
                                            "type": "string"
                                        },
                                        "localizedDisplayName": {
                                            "description": "Gets or sets the localized display name of the tag",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Gets or sets the name of the tag",
                                            "type": "string"
                                        },
                                        "tagId": {
                                            "description": "Gets or sets the tag Id",
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
            "description": "1: No tag Ids requested\r\n2: Too many tag Ids requested"
        },
        "429": {
            "description": "3: Too many requests"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/avatar-assets/{assetType}/get-upload-fee
```json
{
    "Method": "POST",
    "Description": "Cheaply checking if the upload is guaranteed to fail and getting the price in Robux needed in order to do the upload",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
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
            "description": "The asset type being uploaded"
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "requestModel.files",
        }
    },
    "Responses": {
        "500": {
            "description": "10: There was a problem while trying to get the details for the upload fee\r\n13: There was a problem while trying to get the user's Robux balance"
        },
        "400": {
            "description": "2: The given asset type is not allowed for upload through the given endpoint\r\n3: The given creator Id is invalid\r\n4: The given creator type is invalid\r\n5: No file was found with the request\r\n7: The uploaded file did not contain valid contents for the given asset type\r\n8: The uploaded file did not have a valid extension for the given asset type"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "If the upload would be successful without taking into account upload fees, then a response model is returned with the upload fee information",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Defines the response model for the v1/avatar-assets/{assetType}/get-upload-fee endpoint",
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Gets the price in Robux required to be paid in order to upload",
                            "type": "integer"
                        },
                        "canAfford": {
                            "description": "Indicates whether the creator can afford the upload price",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: The endpoint is unavailable"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n9: The user does not have permission to upload"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/item-tags/{itemTagId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes an item tag from an item",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "itemTagId",
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
            "description": "0: Token Validation Failed\r\n5: The current user is missing permissions for the endpoint"
        },
        "429": {
            "description": "7: Too many requests"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/get-selling-fee
```json
{
    "Method": "GET",
    "Description": "Gets the selling fee required to release the given asset",
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
        }
    },
    "Responses": {
        "500": {
            "description": "31: Failed to fetch selling fee"
        },
        "400": {
            "description": "10: Missing/Null request parameters"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Defines the response model for the /v1/assets/{assetId}/get-selling-fee endpoint",
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Gets the price in Robux required to be paid in order to upload",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Service Unavailable"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets/{assetId}/update
```json
{
    "Method": "POST",
    "Description": "Update parameters for the given asset",
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
            "description": ""
        },
        "2": {
            "in": "body",
            "name": "updateAssetRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "releaseConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the configuration options for an items price",
                                "properties": {
                                    "saleAvailabilityLocations": {
                                        "items": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Catalog",
                                                "2": "AllUniverses",
                                                "3": "MyUniverses"
                                            }
                                        },
                                        "type": "array",
                                        "description": "Get or sets the sale availability locations list"
                                    }
                                }
                            }
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Cannot release the associated asset type\r\n4: Cannot release asset that is pending review\r\n5: Asset is moderated\r\n7: User does not have permission to release\r\n26: User does not have permission for the group owned asset"
        },
        "400": {
            "description": "2: Invalid asset Id\r\n8: User does not own the asset\r\n10: Missing/Null request parameters"
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
        "429": {
            "description": "16: Flood Limit Exceeded"
        },
        "503": {
            "description": "17: Service Unavailable"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/item-tags
```json
{
    "Method": "POST",
    "Description": "Creates a new item tag",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model to add a tag to an item",
                    "properties": {
                        "tagId": {
                            "description": "Gets or sets the tag Id",
                            "type": "string"
                        },
                        "itemId": {
                            "description": "Gets or sets the item Id",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: The current user is missing permissions for the endpoint"
        },
        "400": {
            "description": "3: Invalid item id\r\n4: Invalid tag id\r\n6: Invalid item namespace\r\n8: The given item is ineligible for item tags\r\n9: The given item has already reached its maximum item tag count"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "id": {
                            "description": "Gets or sets the item tag id",
                            "type": "string"
                        },
                        "tag": {
                            "$ref": {
                                "type": "object",
                                "description": "The tag model for any tag-related gets",
                                "properties": {
                                    "status": {
                                        "enum": {
                                            "1": "Success",
                                            "2": "MissingItem"
                                        },
                                        "description": "Gets or sets the status for the fetch of this tag",
                                        "type": "string"
                                    },
                                    "localizedDisplayName": {
                                        "description": "Gets or sets the localized display name of the tag",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Gets or sets the name of the tag",
                                        "type": "string"
                                    },
                                    "tagId": {
                                        "description": "Gets or sets the tag Id",
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "Gets or sets the tag details related to this item tag"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "7: Too many requests"
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets all related item tags for each item id listed",
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
                "type": "string"
            },
            "required": true,
            "description": "",
            "name": "itemIds"
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
                                        "id": {
                                            "description": "Gets or sets the item id",
                                            "type": "string"
                                        },
                                        "itemTags": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "id": {
                                                            "description": "Gets or sets the item tag id",
                                                            "type": "string"
                                                        },
                                                        "tag": {
                                                            "$ref": {
                                                                "type": "object",
                                                                "description": "The tag model for any tag-related gets",
                                                                "properties": {
                                                                    "status": {
                                                                        "enum": {
                                                                            "1": "Success",
                                                                            "2": "MissingItem"
                                                                        },
                                                                        "description": "Gets or sets the status for the fetch of this tag",
                                                                        "type": "string"
                                                                    },
                                                                    "localizedDisplayName": {
                                                                        "description": "Gets or sets the localized display name of the tag",
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "description": "Gets or sets the name of the tag",
                                                                        "type": "string"
                                                                    },
                                                                    "tagId": {
                                                                        "description": "Gets or sets the tag Id",
                                                                        "type": "string"
                                                                    }
                                                                }
                                                            },
                                                            "description": "Gets or sets the tag details related to this item tag"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "Gets or sets the item tag details related to this item"
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
            "description": "1: No item tag Ids requested\r\n2: Too many item tag Ids requested\r\n3: Invalid item id\r\n6: Invalid item namespace"
        },
        "429": {
            "description": "7: Too many requests"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/creations/get-asset-details
```json
{
    "Method": "POST",
    "Description": "Gets the asset status and other configuration details for the given assetIds list",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Missing AssetIds parameters\r\n2: Invalid asset Ids"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "description": {
                                "description": "The asset description",
                                "type": "string"
                            },
                            "creatorTargetId": {
                                "format": "int64",
                                "description": "The creator target Id",
                                "type": "integer"
                            },
                            "price": {
                                "format": "int64",
                                "description": "The Price for onSale asset\r\nNote: This is now considered deprecated in favor of PriceConfiguration",
                                "type": "integer"
                            },
                            "assetType": {
                                "description": "Type of the asset",
                                "type": "string"
                            },
                            "assetId": {
                                "format": "int64",
                                "description": "The asset Id",
                                "type": "integer"
                            },
                            "name": {
                                "description": "The asset name",
                                "type": "string"
                            },
                            "priceConfiguration": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Defines the configuration options for an items price",
                                    "properties": {
                                        "premiumDiscountPercentage": {
                                            "format": "int32",
                                            "description": "Gets or sets the discount rate on the price of the item that is given to premium users\r\nShould not be used while applying a PremiumPriceInRobux",
                                            "type": "integer"
                                        },
                                        "premiumPriceInRobux": {
                                            "format": "int64",
                                            "description": "Gets or sets the price of the item in Robux that applies only to premium users\r\nShould not be used while applying a PremiumDiscountPercentage",
                                            "type": "integer"
                                        },
                                        "priceInRobux": {
                                            "format": "int64",
                                            "description": "Gets or sets the standard price of the item in Robux",
                                            "type": "integer"
                                        }
                                    }
                                },
                                "description": "Gets or sets the price configuration for the asset"
                            },
                            "status": {
                                "enum": {
                                    "1": "Unknown",
                                    "2": "ReviewPending",
                                    "3": "Moderated",
                                    "4": "ReviewApproved",
                                    "5": "OnSale",
                                    "6": "OffSale",
                                    "7": "DelayedRelease",
                                    "8": "Free"
                                },
                                "description": "The asset status",
                                "type": "string"
                            },
                            "releaseConfiguration": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Defines the configuration options associated with releasing an item",
                                    "properties": {
                                        "saleAvailabilityLocations": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "Undefined",
                                                    "2": "Catalog",
                                                    "3": "AllUniverses",
                                                    "4": "MyUniverses"
                                                }
                                            },
                                            "type": "array",
                                            "description": "Get or sets the sale availability locations list"
                                        }
                                    }
                                },
                                "description": "Gets or sets the release configuration for the asset"
                            },
                            "isArchived": {
                                "description": "Is the asset archived",
                                "type": "boolean"
                            },
                            "creatorType": {
                                "enum": {
                                    "1": "Unknown",
                                    "2": "User",
                                    "3": "Group"
                                },
                                "description": "The creator type",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            }
        },
        "414": {
            "description": "3: Too many asset Ids"
        },
        "429": {
            "description": "9: Flood Limit Exceeded"
        },
        "503": {
            "description": "6: Service Unavailable"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/release
```json
{
    "Method": "POST",
    "Description": "Release the asset with the given price",
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
            "description": ""
        },
        "2": {
            "in": "body",
            "name": "releaseAssetRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request Model to release an asset",
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Sets Price associated with the asset before releasing it\r\nNote: This is now considered deprecated in favor of PriceConfiguration",
                            "type": "integer"
                        },
                        "priceConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the configuration options for an items price",
                                "properties": {
                                    "premiumDiscountPercentage": {
                                        "format": "int32",
                                        "description": "Gets or sets the discount rate on the price of the item that is given to premium users\r\nShould not be used while applying a PremiumPriceInRobux",
                                        "type": "integer"
                                    },
                                    "premiumPriceInRobux": {
                                        "format": "int64",
                                        "description": "Gets or sets the price of the item in Robux that applies only to premium users\r\nShould not be used while applying a PremiumDiscountPercentage",
                                        "type": "integer"
                                    },
                                    "priceInRobux": {
                                        "format": "int64",
                                        "description": "Gets or sets the standard price of the item in Robux",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Gets or sets the price configuration associated with the asset before releasing it"
                        },
                        "releaseConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the configuration options for an items price",
                                "properties": {
                                    "saleAvailabilityLocations": {
                                        "items": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Catalog",
                                                "2": "AllUniverses",
                                                "3": "MyUniverses"
                                            }
                                        },
                                        "type": "array",
                                        "description": "Get or sets the sale availability locations list"
                                    }
                                }
                            },
                            "description": "Gets or sets the release configuration associated with the asset before releasing it"
                        },
                        "saleStatus": {
                            "enum": {
                                "1": "OnSale",
                                "2": "OffSale",
                                "3": "Free"
                            },
                            "description": "Sets New Sale status for the associated asset",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "500": {
            "description": "31: Failed to fetch selling fee\r\n32: Failed to pay the associated fees"
        },
        "400": {
            "description": "1: Asset price is too high\r\n2: Invalid asset Id\r\n8: User does not own the asset\r\n9: Asset price is too low\r\n10: Missing/Null request parameters\r\n27: Premium price not enabled for asset type\r\n28: Premium discount percentage is not one of the allowed values\r\n29: Pricing configuration combination is invalid\r\n30: Price is missing"
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
        "503": {
            "description": "17: Service Unavailable"
        },
        "429": {
            "description": "16: Flood Limit Exceeded"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n3: Cannot release the associated asset type\r\n4: Cannot release asset that is pending review\r\n5: Asset is moderated\r\n6: Asset is released\r\n7: User does not have permission to release\r\n18: AssetType Cannot Be Free\r\n19: Asset is Free\r\n20: Cannot set the associated asset type to remove-from-release\r\n24: Cannot release asset that is pending validation\r\n25: Cannot release asset that contains invalid content\r\n26: User does not have permission for the group owned asset"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/item-tags/metadata
```json
{
    "Method": "GET",
    "Description": "Gets the metadata related to item tags",
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
                    "description": "Item-tags related metadata response model",
                    "properties": {
                        "isItemTagsFeatureEnabled": {
                            "description": "Gets or sets a value indicating whether the item tags feature is enabled",
                            "type": "boolean"
                        },
                        "maximumItemTagsPerItem": {
                            "format": "int32",
                            "description": "Gets or sets the maximum item tags per item limit",
                            "type": "integer"
                        },
                        "enabledAssetTypes": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "Gets or sets the asset types where item tagging is enabled."
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


## /v1/creations/get-assets
```json
{
    "Method": "GET",
    "Description": "Gets the user created asset information filtered by the given asset type",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "assetType",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "isArchived",
            "description": "",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "description": "",
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
        "403": {
            "description": "7: User does not have necessary permissions for group\r\n8: Asset type does not have necessary permissions for group"
        },
        "400": {
            "description": "5: Invalid assetType"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
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
                                    "description": "Asset Status response model",
                                    "properties": {
                                        "name": {
                                            "description": "The asset name",
                                            "type": "string"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The asset Id",
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
        "429": {
            "description": "9: Flood Limit Exceeded"
        },
        "503": {
            "description": "6: Service Unavailable"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/get-commission-rates
```json
{
    "Method": "GET",
    "Description": "Gets the commission rates related to assetTypes",
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
                        "properties": {
                            "commissionRates": {
                                "$ref": {
                                    "properties": {
                                        "marketplaceFeesPercentage": {
                                            "format": "int32",
                                            "description": "Commission fees percentage for marketplace",
                                            "type": "integer"
                                        },
                                        "affiliateFeesPercentage": {
                                            "format": "int32",
                                            "description": "Commission fees percentage for Affiliate",
                                            "type": "integer"
                                        },
                                        "creatorFeesPercentage": {
                                            "format": "int32",
                                            "description": "Commission fees percentage for creators",
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "itemTypeDetails": {
                                "$ref": {
                                    "properties": {
                                        "itemType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Asset"
                                            }
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
        "503": {
            "description": "6: Service Unavailable"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


