# <b>Publish Api v1</b>

## /v1/audio
```json
{
    "Method": "POST",
    "Description": "Published an audio file and returns the new asset info.",
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
                    "description": "A request model for uploading an audio file.",
                    "properties": {
                        "name": {
                            "description": "Name for the audio file.",
                            "type": "string"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "Id of the group you are publishing the audio asset for. Null if not publishing under a group.",
                            "type": "integer"
                        },
                        "paymentSource": {
                            "description": "The source of funds for payment.\r\n  User: Use personal funds of authenticated user.\r\n  Group: Use group funds from {Roblox.Publish.Api.UploadAudioRequest.GroupId}.\r\n  Null/Empty: Will default to authenticated user funds.",
                            "type": "string"
                        },
                        "estimatedFileSize": {
                            "format": "int64",
                            "description": "Estimated file size of the audio file in bytes.",
                            "type": "integer"
                        },
                        "estimatedDuration": {
                            "format": "double",
                            "description": "Estimated duration of the audio file in seconds.",
                            "type": "number"
                        },
                        "file": {
                            "description": "File to be uploaded. Formatted as a base64 string.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The file upload request body. {Roblox.Publish.Api.UploadAudioRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "7: Failed to parse the file.\r\n19: Asset creation was unavailable. Please try again."
        },
        "400": {
            "description": "3: The request did not contain a file to be uploaded.\r\n4: The file in the request is too large.\r\n5: The duration of the audio file is too long.\r\n8: The file type is not supported.\r\n9: The file is corrupted\r\n11: Missing permissions to spend group funds.\r\n14: The user/group does not have suffiecient funds to publish.\r\n14: The user/group does not have suffiecient funds to publish.\r\n15: The audio file has already been reviewed and rejected.\r\n18: Too many requests. Try again later.\r\n20: Error while trying to purchase the product.\r\n22: The file size estimation error was greater than the acceptable margin of error.\r\n23: The duration estimation error was greater than the acceptable margin of error."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n1: The request did not include an authorization."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for publish audio.",
                    "properties": {
                        "Id": {
                            "format": "int64",
                            "description": "Id of the published asset.",
                            "type": "integer"
                        },
                        "Name": {
                            "description": "Name of the published asset.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/icon
```json
{
    "Method": "POST",
    "Description": "Overwrites a badge icon with a new one.",
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
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "2: File not present in request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/games/{gameId}/icon
```json
{
    "Method": "POST",
    "Description": "Overwrites a game icon with a new one.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "1: File uploaded does not match known image format. Try converting to png.\r\n2: File not present in request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/audio/verify
```json
{
    "Method": "POST",
    "Description": "Verifies an audio file and returns a product that you can purchase to publish the audio file.",
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
                    "description": "Request model to publish an audio asset.",
                    "properties": {
                        "fileSize": {
                            "format": "int64",
                            "description": "Gets or sets the size of the audio file in bytes.",
                            "type": "integer"
                        },
                        "name": {
                            "description": "Gets or sets the name of the audio asset.",
                            "type": "string"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "Gets or sets the ID of the group if applicable. Optional.",
                            "type": "integer"
                        },
                        "file": {
                            "description": "File to be uploaded. Formatted as a base64 string.",
                            "type": "string"
                        },
                        "duration": {
                            "format": "double",
                            "description": "Gets or sets the duration of the audio in seconds.",
                            "type": "number"
                        },
                        "paymentSource": {
                            "description": "Gets or sets the payment source. 'User' or 'Group'. Required if Group ID is set.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The verify audio request body. {Roblox.Publish.Api.VerifyAudioRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "7: Failed to parse the file."
        },
        "400": {
            "description": "3: The request did not contain a file to be uploaded.\r\n4: The file in the request is too large.\r\n5: The duration of the audio file is too long.\r\n8: The file type is not supported.\r\n9: The file is corrupted\r\n18: Too many requests. Try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n1: The request did not include an authorization."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for verify audio endpoint.",
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Price in robux to publish the audio file.",
                            "type": "integer"
                        },
                        "balance": {
                            "format": "int64",
                            "description": "User's current Robux balance.",
                            "type": "integer"
                        },
                        "name": {
                            "description": "Name of the audio file.",
                            "type": "string"
                        },
                        "canAfford": {
                            "description": "Boolean, true if the user can afford to purchase the publishing of the audio file.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/plugins/{pluginId}/icon
```json
{
    "Method": "POST",
    "Description": "Overwrites a plugin icon with a new one.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "pluginId",
            "format": "int64",
            "required": true,
            "description": "The plugin Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "2: File not present in request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/assets/upload
```json
{
    "Method": "POST",
    "Description": "Uploads new asset/s for the user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "formData",
            "type": "file",
            "name": "uploadAssetRequest.files",
        }
    },
    "Responses": {
        "200": {
            "description": "OK - It should include the \"config.json\" file with the dictionary format for filename, item name and item description for all uploaded item files in the request\r\n            {\"apple\":{\"type\":\"Image\",\"name\":\"Apple\",\"description\":\"Its a fruit\"},\r\n            \"banana\":{\"type\":\"Hair Accessory\",\"name\":\"Fruit Hat\",\"description\":\"Its a fruit hat\"}}.",
            "schema": {
                "$ref": {
                    "properties": {
                        "AssetDetails": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetFileName": {
                                            "type": "string"
                                        },
                                        "uploadAssetError": {
                                            "type": "string",
                                            "enum": {
                                                "1": "None",
                                                "2": "InvalidAssetName",
                                                "3": "InvalidAssetDescription",
                                                "4": "InvalidAssetType",
                                                "5": "InappropriateText",
                                                "6": "WrongFileExtension",
                                                "7": "AssetTypeNotAllowed",
                                                "8": "UserDoesNotHavePermissionToUpload"
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
        "403": {
            "description": "0: Token Validation Failed\r\n1: You do not have permission to create this item"
        },
        "400": {
            "description": "2: The request model formdata was null\r\n3: The request content is missing config json file\r\n4: The request has invalid config\r\n5: The request files does not match the config"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/game-passes/{gamePassId}/icon
```json
{
    "Method": "POST",
    "Description": "Overwrites a game pass icon with a new one.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "gamePassId",
            "format": "int64",
            "required": true,
            "description": "The game pass Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "2: File not present in request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/games/{gameId}/thumbnail/image
```json
{
    "Method": "POST",
    "Description": "Uploads a game thumbnail.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "1: File uploaded does not match known image format. Try converting to png.\r\n2: File not present in request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/assets/{assetId}/thumbnail
```json
{
    "Method": "POST",
    "Description": "Uploads a thumbnail of an asset, including Models, Meshes, Audio, Plugins",
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
            "description": "The asset Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You do not have permission to manage this item."
        },
        "400": {
            "description": "1: File uploaded does not match known image format. Try converting to png.\r\n2: File not present in request.\r\n7: The asset type is not appropriate for this request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response used when an upload has completed.",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "The target Id of the uploaded item.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: You're uploading too much, please wait and try again later."
        },
        "404": {
            "description": "4: Target item is invalid or does not exist."
        }
    },
}
```
<hr>


