# <b>Develop Api v1</b>

## /v1/universes/{universeId}/teamcreate/memberships/delete
```json
{
    "Method": "POST",
    "Description": "Removes a user from a TeamCreate permissions list.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for a TeamCreate membership",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The id of the user.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.TeamCreateDisabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse} OR {Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUser}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/multiget/permissions
```json
{
    "Method": "GET",
    "Description": "Returns an array of granted and declined permissions related to the universes with the ids in ids for the authenticated user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The universe ids.",
            "name": "ids"
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
                                    "description": "A model containing information about a universe permissions",
                                    "properties": {
                                        "canManage": {
                                            "description": "Determines whether or not consumer can manage the target universe",
                                            "type": "boolean"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "The universe Id these permissions reference",
                                            "type": "integer"
                                        },
                                        "canCloudEdit": {
                                            "description": "Determines whether or not consumer can cloud the target universe\r\nThis is only nullable/optional in the context of https://develop.roblox.com/docs#!/Universes/get_v1_universes_universeId_context_permissions endpoint which is consumed only internally. It should be computed and set for all other usages.",
                                            "type": "boolean"
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
            "description": "8: No universe IDs sent to get.\r\n9: Too many universe IDs sent to get, the limit is: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/latest-saved-version
```json
{
    "Method": "GET",
    "Description": "Gets a latest saved asset version for asset ID.",
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
            "description": "ID of the asset."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model of an asset version.",
                    "properties": {
                        "creatingUniverseId": {
                            "format": "int64",
                            "description": "ID of the universe this asset version was created in.",
                            "type": "integer"
                        },
                        "assetId": {
                            "format": "int64",
                            "description": "The ID of the asset.",
                            "type": "integer"
                        },
                        "isPublished": {
                            "description": "Indicates if this version is / was published.\r\nThis property is available on /v1/{assetId}/saved-versions.",
                            "type": "boolean"
                        },
                        "assetVersionNumber": {
                            "format": "int32",
                            "description": "The version number.",
                            "type": "integer"
                        },
                        "isEqualToCurrentPublishedVersion": {
                            "description": "Indicates if this version is same to current published version.\r\nThis property is available on /v1/{assetId}/published-versions and /v1/{assetId}/version/{versionNumber}.",
                            "type": "boolean"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "The created date of this asset version.",
                            "type": "string"
                        },
                        "creatorTargetId": {
                            "format": "int64",
                            "description": "ID of the asset version creator.",
                            "type": "integer"
                        },
                        "creatorType": {
                            "description": "Type of the asset version creator.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "3: Authenticated user does not have permissions to manage the asset."
        },
        "404": {
            "description": "1: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/packages/assets/{assetId}/permissions-batch
```json
{
    "Method": "PUT",
    "Description": "Updates or creates package permissions.",
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
            "required": true
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "The request model for the UpdatePackagePermissions endpoint.",
                        "properties": {
                            "upToVersion": {
                                "format": "int32",
                                "description": "Asset version number that granted. If null, all asset versions are allowed. This property is for revoked permission.",
                                "type": "integer"
                            },
                            "subjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Subject type of the permission.",
                                "type": "string"
                            },
                            "action": {
                                "enum": {
                                    "1": "UseView",
                                    "2": "Edit",
                                    "3": "Revoked",
                                    "4": "Own"
                                },
                                "description": "The action granted to the subject about the resource.",
                                "type": "string"
                            },
                            "subjectId": {
                                "format": "int64",
                                "description": "Subject id of the permission.",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "name": "requests"
        }
    },
    "Responses": {
        "500": {
            "description": "0: Unknown error"
        },
        "400": {
            "description": "8: Too many requests at one call.\r\n9: No requests."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the CreatePackagePermissions endpoint.",
                    "properties": {
                        "failedCount": {
                            "format": "int32",
                            "description": "The number of items failed to update.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: Invalid asset id\r\n4: The referenced asset does not exist."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n5: Authenticated user does not have Own permission.\r\n10: This subject can't be granted. Friendship or group membership is required between grantor and the subject."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Deletes package permissions. For internal use.",
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
            "required": true
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "The request model for the DeletePackagePermissions endpoint.",
                        "properties": {
                            "upToVersion": {
                                "format": "int32",
                                "description": "Asset version number that granted. If null, all asset versions are allowed. This property is for revoked permission.",
                                "type": "integer"
                            },
                            "subjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Subject type of the permission.",
                                "type": "string"
                            },
                            "action": {
                                "enum": {
                                    "1": "UseView",
                                    "2": "Edit",
                                    "3": "Revoked",
                                    "4": "Own"
                                },
                                "description": "The action granted to the subject about the resource.",
                                "type": "string"
                            },
                            "subjectId": {
                                "format": "int64",
                                "description": "Subject id of the permission.",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "name": "requests"
        }
    },
    "Responses": {
        "500": {
            "description": "0: Unknown error"
        },
        "400": {
            "description": "8: Too many requests at one call.\r\n9: No requests."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the DeletePackagePermissions endpoint.",
                    "properties": {
                        "failedCount": {
                            "format": "int32",
                            "description": "The number of items failed to delete.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: Invalid asset id\r\n4: The referenced asset does not exist."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n5: Authenticated user does not have Own permission."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/packages/assets/{assetId}/highest-permission
```json
{
    "Method": "GET",
    "Description": "Get highest package permission granted to current user for a specific package.",
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
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Representation of user permission check.",
                    "properties": {
                        "hasPermission": {
                            "type": "boolean"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "action": {
                            "type": "string",
                            "enum": {
                                "1": "UseView",
                                "2": "Edit",
                                "3": "Revoked",
                                "4": "Own"
                            }
                        },
                        "upToVersion": {
                            "type": "integer",
                            "format": "int32"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: Unknown error"
        },
        "404": {
            "description": "1: Invalid asset id\r\n4: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/assets/{assetId}/symbolic-links
```json
{
    "Method": "DELETE",
    "Description": "Deletes all symbolic links for an asset in a place.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The id of the place the symbolic-links belong to."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The id of the asset the symbolic-links belong to."
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
            "description": "10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "1: The request body is missing."
        },
        "404": {
            "description": "2: Place does not exist.\r\n3: The referenced asset does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/packages
```json
{
    "Method": "PUT",
    "Description": "Removes all existing symbolic links in a place and adds provided asset Ids of packages as new symbolic
links in the place",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "Id of a place to replace packages."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model to add / replace symbolic links in a place.",
                    "properties": {
                        "isAtomic": {
                            "description": "Indicates this request should be done in atomic manner or not. If true, it throws error when any asset id is invalid.",
                            "type": "boolean"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Asset IDs of packages to replace ones in a place."
                        }
                    }
                }
            },
            "description": "{Request model to add / replace symbolic links in a place.}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Representation of result of adding permission.",
                    "properties": {
                        "unprocessed": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Error": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Generic",
                                                "2": "RequestBodyMissing",
                                                "3": "PlaceDoesNotExist",
                                                "4": "AssetDoesNotExist",
                                                "5": "AssetVersionDoesNotExist",
                                                "6": "AssetVersionIsNotAPackage",
                                                "7": "AssetIsNotAPackage",
                                                "8": "AssetVersionAlreadyHasMetadata",
                                                "9": "SymbolicLinkDoesNotExist",
                                                "10": "UniverseDoesNotExist",
                                                "11": "DoesNotHaveEditPermission",
                                                "12": "DoesNotHaveReadPermission",
                                                "13": "CommitMessageNull",
                                                "14": "CommitMessageTooLong",
                                                "15": "TooManySymbolicLinks",
                                                "16": "TooManyAssetVersions",
                                                "17": "KeyMissing",
                                                "18": "ValueMissing",
                                                "19": "DuplicateAssets",
                                                "20": "UniverseDoesNotExistForPlace",
                                                "21": "FailedToCreateDefaultPackagePermissions",
                                                "22": "AssetIdsIsEmpty",
                                                "23": "DoesNotHaveManagePermission",
                                                "24": "SymbolicLinkAlreadyExist",
                                                "25": "TargetVersionNumberIsNotOne",
                                                "26": "InternalError"
                                            }
                                        },
                                        "AssetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A list of unprocessed asset Id of symbolic links."
                        },
                        "processed": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "A list of processed asset Id of symbolic links."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "14: Too many symbolic links were specified in a single operation.\r\n21: AssetIds shouldn't be empty."
        },
        "404": {
            "description": "2: Place does not exist.\r\n3: The referenced asset does not exist.\r\n6: The referenced asset is not a package."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "POST",
    "Description": "Adds symbolic links to a place with provided asset Ids of packages. If provided asset Ids already exist
in the place, it will be unchanged.",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "Id of a place to replace packages."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model to add / replace symbolic links in a place.",
                    "properties": {
                        "isAtomic": {
                            "description": "Indicates this request should be done in atomic manner or not. If true, it throws error when any asset id is invalid.",
                            "type": "boolean"
                        },
                        "assetIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Asset IDs of packages to replace ones in a place."
                        }
                    }
                }
            },
            "description": "{Request model to add / replace symbolic links in a place.}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Representation of result of adding permission.",
                    "properties": {
                        "unprocessed": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Error": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Generic",
                                                "2": "RequestBodyMissing",
                                                "3": "PlaceDoesNotExist",
                                                "4": "AssetDoesNotExist",
                                                "5": "AssetVersionDoesNotExist",
                                                "6": "AssetVersionIsNotAPackage",
                                                "7": "AssetIsNotAPackage",
                                                "8": "AssetVersionAlreadyHasMetadata",
                                                "9": "SymbolicLinkDoesNotExist",
                                                "10": "UniverseDoesNotExist",
                                                "11": "DoesNotHaveEditPermission",
                                                "12": "DoesNotHaveReadPermission",
                                                "13": "CommitMessageNull",
                                                "14": "CommitMessageTooLong",
                                                "15": "TooManySymbolicLinks",
                                                "16": "TooManyAssetVersions",
                                                "17": "KeyMissing",
                                                "18": "ValueMissing",
                                                "19": "DuplicateAssets",
                                                "20": "UniverseDoesNotExistForPlace",
                                                "21": "FailedToCreateDefaultPackagePermissions",
                                                "22": "AssetIdsIsEmpty",
                                                "23": "DoesNotHaveManagePermission",
                                                "24": "SymbolicLinkAlreadyExist",
                                                "25": "TargetVersionNumberIsNotOne",
                                                "26": "InternalError"
                                            }
                                        },
                                        "AssetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A list of unprocessed asset Id of symbolic links."
                        },
                        "processed": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "A list of processed asset Id of symbolic links."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "14: Too many symbolic links were specified in a single operation.\r\n21: AssetIds shouldn't be empty."
        },
        "404": {
            "description": "2: Place does not exist.\r\n3: The referenced asset does not exist.\r\n6: The referenced asset is not a package."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/developerproducts/{productId}/update
```json
{
    "Method": "POST",
    "Description": "Updates a Developer Product.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "productId",
            "format": "int64",
            "required": true,
            "description": "The product id."
        },
        "3": {
            "in": "body",
            "name": "updateInfo",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about the developer product to be updated",
                    "properties": {
                        "Description": {
                            "type": "string"
                        },
                        "Name": {
                            "type": "string"
                        },
                        "IconImageAssetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "PriceInRobux": {
                            "type": "integer",
                            "format": "int64"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "500": {
            "description": "8: Unknown error occurred."
        },
        "400": {
            "description": "1: Product not found.\r\n3: Developer product not found.\r\n4: Developer product name already exists in the universe.\r\n5: Universe not found.\r\n7: Shop id is not found.\r\n9: Price in robux can not be negative.\r\n10: The post body was not found or failed to parse."
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
        "403": {
            "description": "0: Token Validation Failed\r\n2: Product is created by another user.\r\n6: User doesn't have access to universe."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/teamcreate/memberships
```json
{
    "Method": "GET",
    "Description": "List of universes the authenticated user has permission to TeamCreate.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "TeamCreate membership grant date",
            "name": "sortOrder",
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
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created {System.DateTime}",
                                            "type": "string"
                                        },
                                        "description": {
                                            "description": "The description of the universe",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The id of the user or group that created this universe.",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "isActive": {
                                            "description": "Is this universe active",
                                            "type": "boolean"
                                        },
                                        "privacyType": {
                                            "description": "The universe's privacy type.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated {System.DateTime}",
                                            "type": "string"
                                        },
                                        "isArchived": {
                                            "description": "Is this universe archived",
                                            "type": "boolean"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The universe's root place id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The name of the creator of the universe.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "The creator type, either \"User\" or \"Group\"",
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
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/published-versions
```json
{
    "Method": "POST",
    "Description": "Publishes a saved version of an asset.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "assetVersionNumber",
            "format": "int32",
            "required": true,
            "description": "Asset version number."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Authenticated user does not have permissions to manage the asset."
        },
        "400": {
            "description": "4: Asset type is not supported by the requested operation."
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
            "description": "1: The referenced asset does not exist.\r\n2: The referenced asset version does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a page of published asset versions by asset ID.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sort by version number, default is desc.",
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
                                    "description": "Model of an asset version.",
                                    "properties": {
                                        "creatingUniverseId": {
                                            "format": "int64",
                                            "description": "ID of the universe this asset version was created in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The ID of the asset.",
                                            "type": "integer"
                                        },
                                        "isPublished": {
                                            "description": "Indicates if this version is / was published.\r\nThis property is available on /v1/{assetId}/saved-versions.",
                                            "type": "boolean"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int32",
                                            "description": "The version number.",
                                            "type": "integer"
                                        },
                                        "isEqualToCurrentPublishedVersion": {
                                            "description": "Indicates if this version is same to current published version.\r\nThis property is available on /v1/{assetId}/published-versions and /v1/{assetId}/version/{versionNumber}.",
                                            "type": "boolean"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created date of this asset version.",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "ID of the asset version creator.",
                                            "type": "integer"
                                        },
                                        "creatorType": {
                                            "description": "Type of the asset version creator.",
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
            "description": "3: Authenticated user does not have permissions to manage the asset."
        },
        "404": {
            "description": "1: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/teamcreate/active_session/members
```json
{
    "Method": "GET",
    "Description": "List of users in the active Team Create session",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place Id."
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
        }
    },
    "Responses": {
        "500": {
            "description": "6: Multiple active sessions in a Team Create place."
        },
        "400": {
            "description": "1: The universe is invalid.\r\n5: The place is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "displayName": {
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
            "description": "0: An unknown error occurred."
        },
        "403": {
            "description": "2: Not authorized to perform this action.\r\n4: TeamCreate on universe is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/plugins
```json
{
    "Method": "GET",
    "Description": "Gets plugin details by ids.",
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
            "description": "The plugin ids.",
            "name": "pluginIds"
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
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "commentsEnabled": {
                                            "type": "boolean"
                                        },
                                        "versionId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
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
        "400": {
            "description": "1: Too many ids.\r\n2: The format of the ids are invalid."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/voting
```json
{
    "Method": "GET",
    "Description": "Gets the voting information of the given assets",
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
            "description": "The ids of the {Roblox.IAsset}.",
            "name": "assetIds"
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
                                    "description": "Asset voting information",
                                    "properties": {
                                        "canUserVote": {
                                            "description": "Whether the user can vote on this {Roblox.IAsset}.",
                                            "type": "boolean"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The {Roblox.IAsset}'s id.",
                                            "type": "integer"
                                        },
                                        "reasonForNotAbleToVote": {
                                            "description": "The reason this {Roblox.IAsset} cannot be voted on.",
                                            "type": "string"
                                        },
                                        "shouldShowVotes": {
                                            "description": "Whether votes should be shown.",
                                            "type": "boolean"
                                        },
                                        "upVotes": {
                                            "format": "int64",
                                            "description": "The number of up votes.",
                                            "type": "integer"
                                        },
                                        "downVotes": {
                                            "format": "int64",
                                            "description": "The number of down votes.",
                                            "type": "integer"
                                        },
                                        "hasUserVoted": {
                                            "description": "Whether the user has voted on this {Roblox.IAsset}.",
                                            "type": "boolean"
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
        }
    },
    "Internal": false
}
```
<hr>


## /v1/packages/assets/{assetId}/has-permission
```json
{
    "Method": "GET",
    "Description": "Checks if a current user has permission for a specific asset.",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "requiredAction",
            "enum": {
                "1": "UseView",
                "2": "Edit",
                "3": "Revoked",
                "4": "Own"
            },
            "required": true
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "assetVersionNumber",
            "format": "int32",
        }
    },
    "Responses": {
        "500": {
            "description": "0: Unknown error"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Representation of user permission check.",
                    "properties": {
                        "hasPermission": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: Invalid asset id\r\n2: Invalid asset version number\r\n4: The referenced asset does not exist."
        },
        "403": {
            "description": "5: Authenticated user does not have Own permission."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/thumbnails/auto-generated
```json
{
    "Method": "POST",
    "Description": "Adds an auto-generated thumbnail.",
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
            "description": "The universe Id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: You are not authorized to configure this universe."
        },
        "400": {
            "description": "5: The universe has no root place."
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
            "description": "0: An unexpected error has occured."
        },
        "429": {
            "description": "6: Thumbnails of this universe are being added too often."
        },
        "404": {
            "description": "3: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/gameUpdateNotifications/filter
```json
{
    "Method": "POST",
    "Description": "Filters game update text.",
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
            "name": "gameUpdateText",
            "required": true,
            "schema": {
                "type": "string"
            },
            "description": "Game update message text."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "500": {
            "description": "The text filter service is unavailable."
        },
        "400": {
            "description": "Called with invalid arguments."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/statistic-reports/{yearDashMonth}/download
```json
{
    "Method": "GET",
    "Description": "Retrieves a spreadsheet with universe statistics for a given month.",
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
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true,
            "description": "Four digit year and two digit month of data to retrieve."
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "404": {
            "description": "11: No report found by this name: "
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/saved-versions
```json
{
    "Method": "GET",
    "Description": "Gets a page of saved asset versions by asset ID.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sort by version number, default is desc.",
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
                                    "description": "Model of an asset version.",
                                    "properties": {
                                        "creatingUniverseId": {
                                            "format": "int64",
                                            "description": "ID of the universe this asset version was created in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The ID of the asset.",
                                            "type": "integer"
                                        },
                                        "isPublished": {
                                            "description": "Indicates if this version is / was published.\r\nThis property is available on /v1/{assetId}/saved-versions.",
                                            "type": "boolean"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int32",
                                            "description": "The version number.",
                                            "type": "integer"
                                        },
                                        "isEqualToCurrentPublishedVersion": {
                                            "description": "Indicates if this version is same to current published version.\r\nThis property is available on /v1/{assetId}/published-versions and /v1/{assetId}/version/{versionNumber}.",
                                            "type": "boolean"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created date of this asset version.",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "ID of the asset version creator.",
                                            "type": "integer"
                                        },
                                        "creatorType": {
                                            "description": "Type of the asset version creator.",
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
            "description": "3: Authenticated user does not have permissions to manage the asset."
        },
        "404": {
            "description": "1: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/stats/is-age-data-available
```json
{
    "Method": "GET",
    "Description": "An endpoint that returns whether the age data is available for a place.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place Id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "isAgeDataAvailable": {
                            "readOnly": true,
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "2: Not authorized to perform this action."
        },
        "400": {
            "description": "1: The place is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/assets/{assetId}/symbolic-links
```json
{
    "Method": "GET",
    "Description": "Gets all symbolic links for all versions of an asset existing for the places in a specified universe.",
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
            "description": "The id of the universe."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The id of the asset the symbolic links are pointing to."
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by the guids of the symbolic links.",
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
        "403": {
            "description": "11: Authenticated user does not have read permissions or UseView package permission."
        },
        "400": {
            "description": "6: The referenced asset is not a package."
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
                                    "description": "Represents a symbolic link exisiting within the context of a place pointing to a specific version of an asset.",
                                    "properties": {
                                        "id": {
                                            "type": "string",
                                            "format": "uuid",
                                            "description": "The symbolic link's guid.",
                                            "example": "00000000-0000-0000-0000-000000000000"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "The id of the place place the link lives in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The id of the asset the symbolic link is pointing to.",
                                            "type": "integer"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int64",
                                            "description": "The version of the asset the symbolic link is pointing to.",
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
        "404": {
            "description": "3: The referenced asset does not exist.\r\n9: Game does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets/endorsed
```json
{
    "Method": "GET",
    "Description": "Get the endorsement status of the requested assets",
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
            "description": "The ids of the requested assets",
            "name": "assetIds"
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
                                    "description": "The response model for the GetAreAssetsEndorsed endpoint",
                                    "properties": {
                                        "isEndorsed": {
                                            "description": "Whether the asset is endorsed",
                                            "type": "boolean"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The id of the asset",
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets/{assetId}/revert-version
```json
{
    "Method": "POST",
    "Description": "Reverts to an older version of an asset. This actually spawns new version of asset with a specified older one.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "assetVersionNumber",
            "format": "int32",
            "required": true,
            "description": "Asset version number to be reverted."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Authenticated user does not have permissions to manage the asset."
        },
        "400": {
            "description": "4: Asset type is not supported by the requested operation."
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
            "description": "1: The referenced asset does not exist.\r\n2: The referenced asset version does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/icon
```json
{
    "Method": "POST",
    "Description": "Changes the game icon type.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for updating a game icon.",
                    "properties": {
                        "iconType": {
                            "enum": {
                                "1": "Default",
                                "2": "AutoGenerated"
                            },
                            "description": "Icon type.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body containing the icon type."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The request body is missing.\r\n4: This universe does not have a root place."
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
            "description": "0: An unexpected error has occured."
        },
        "429": {
            "description": "5: The icon of this universe is being updated too often."
        },
        "404": {
            "description": "2: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get the game icon.",
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
            "description": "The id of the universe to get the icon for."
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "4: This universe does not have a root place."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Represents configured universe icon.",
                    "properties": {
                        "imageId": {
                            "format": "int64",
                            "description": "Returns the icon image id or null - if an auto-generated icon is used.",
                            "type": "integer"
                        },
                        "isApproved": {
                            "description": "Indicates whether the image has been reviewed and approved by moderators.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "2: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/symbolic-links/patch
```json
{
    "Method": "PATCH",
    "Description": "Allows updating the target of symbolic links.",
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
                        "type": "object",
                        "description": "Represents a requested update for a single symbolic link.\r\nPrimary key is ScopeType, ScopeTargetId and Guid on DynamoDb (also Packages.Service) side,\r\ntherefore the key, on client side, is placeId and id. (ScopeType is fixed to \"Place\")\r\nUpdatable values are parentScopeType, parentScopeTargetId, targetType, targetId, targetVersionNumber on DynamoDb side,\r\nbut assetId, assetVersionNumber is allowed at this moment.",
                        "properties": {
                            "id": {
                                "type": "string",
                                "format": "uuid",
                                "description": "The guid representing the symbolic link to update. This value is used to look up the symbolic link, not to update.",
                                "example": "00000000-0000-0000-0000-000000000000"
                            },
                            "placeId": {
                                "format": "int64",
                                "description": "The id of the place the symbolic links lives in. This value is used to look up the symbolic link, not to update.",
                                "type": "integer"
                            },
                            "assetId": {
                                "format": "int64",
                                "description": "The id of the asset the symbolic link should point to. If this value is set, the value will be stored on database.",
                                "type": "integer"
                            },
                            "assetVersionNumber": {
                                "format": "int32",
                                "description": "The version of the asset the symbolic link should point to. If this value is set, the value will be stored on database.",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "description": "The symbolic links to update."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n7: Authenticated user does not have UseView permission.\r\n10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "1: The request body is missing.\r\n5: The referenced version of the asset is not a package.\r\n16: One of key fields is missing. It should be presented to specify the object.\r\n17: No value field is presented. One or more value fields should be presented for operation."
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
            "description": "2: Place does not exist.\r\n3: The referenced asset does not exist.\r\n4: The referenced version of the asset does not exist.\r\n8: The referenced symbolic link does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets/{assetId}/versions/{versionNumber}
```json
{
    "Method": "GET",
    "Description": "Gets a published asset version by asset ID and versionNumber.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "versionNumber",
            "format": "int32",
            "required": true,
            "description": "The version number of the asset."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model of an asset version.",
                    "properties": {
                        "creatingUniverseId": {
                            "format": "int64",
                            "description": "ID of the universe this asset version was created in.",
                            "type": "integer"
                        },
                        "assetId": {
                            "format": "int64",
                            "description": "The ID of the asset.",
                            "type": "integer"
                        },
                        "isPublished": {
                            "description": "Indicates if this version is / was published.\r\nThis property is available on /v1/{assetId}/saved-versions.",
                            "type": "boolean"
                        },
                        "assetVersionNumber": {
                            "format": "int32",
                            "description": "The version number.",
                            "type": "integer"
                        },
                        "isEqualToCurrentPublishedVersion": {
                            "description": "Indicates if this version is same to current published version.\r\nThis property is available on /v1/{assetId}/published-versions and /v1/{assetId}/version/{versionNumber}.",
                            "type": "boolean"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "The created date of this asset version.",
                            "type": "string"
                        },
                        "creatorTargetId": {
                            "format": "int64",
                            "description": "ID of the asset version creator.",
                            "type": "integer"
                        },
                        "creatorType": {
                            "description": "Type of the asset version creator.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "3: Authenticated user does not have permissions to manage the asset."
        },
        "404": {
            "description": "1: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/symbolic-links
```json
{
    "Method": "POST",
    "Description": "Creates a new symbolic link for the specified place.",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The id of the place the symbolic link should live in."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for the CreateSymbolicLink endpoint.",
                    "properties": {
                        "assetVersionNumber": {
                            "format": "int64",
                            "description": "The version of the asset the symbolic link should point to.",
                            "type": "integer"
                        },
                        "assetId": {
                            "format": "int64",
                            "description": "The id of the asset the symbolic link should point to.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request model."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the CreateSymbolicLink endpoint.",
                    "properties": {
                        "id": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The guid of the created symbolic link.",
                            "example": "00000000-0000-0000-0000-000000000000"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "7: Authenticated user does not have UseView permission.\r\n10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "5: The referenced version of the asset is not a package."
        },
        "404": {
            "description": "2: Place does not exist.\r\n3: The referenced asset does not exist.\r\n4: The referenced version of the asset does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Deletes the specified symbolic links for a place.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The id of the place the symbolic-links belong to."
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
            },
            "required": true,
            "description": "The guids of all symbolic-links to delete.",
            "name": "ids"
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
            "description": "10: Authenticated user does not have edit permissions or Edit package permission."
        },
        "400": {
            "description": "1: The request body is missing.\r\n14: Too many symbolic links were specified in a single operation."
        },
        "404": {
            "description": "2: Place does not exist."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets all symbolic links existing for a specified place.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The id of the place."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by the guids of the symbolic links.",
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
                                    "description": "Represents a symbolic link exisiting within the context of a place pointing to a specific version of an asset.",
                                    "properties": {
                                        "id": {
                                            "type": "string",
                                            "format": "uuid",
                                            "description": "The symbolic link's guid.",
                                            "example": "00000000-0000-0000-0000-000000000000"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "The id of the place place the link lives in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The id of the asset the symbolic link is pointing to.",
                                            "type": "integer"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int64",
                                            "description": "The version of the asset the symbolic link is pointing to.",
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
            "description": "11: Authenticated user does not have read permissions or UseView package permission."
        },
        "404": {
            "description": "2: Place does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets
```json
{
    "Method": "GET",
    "Description": "Gets a list of assets by asset IDs.",
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
            "description": "ID list of the asset.",
            "name": "assetIds"
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
                                    "description": "Model of an asset. The postfix `Model` is to avoid conflict with existing codes.",
                                    "properties": {
                                        "canHaveThumbnail": {
                                            "description": "Indicates if this asset can have a thumbnail.",
                                            "type": "boolean"
                                        },
                                        "typeId": {
                                            "format": "int32",
                                            "description": "TypeId of the asset.",
                                            "type": "integer"
                                        },
                                        "genres": {
                                            "items": {
                                                "type": "string",
                                                "enum": {
                                                    "1": "All",
                                                    "2": "Tutorial",
                                                    "3": "Scary",
                                                    "4": "TownAndCity",
                                                    "5": "War",
                                                    "6": "Funny",
                                                    "7": "Fantasy",
                                                    "8": "Adventure",
                                                    "9": "SciFi",
                                                    "10": "Pirate",
                                                    "11": "FPS",
                                                    "12": "RPG",
                                                    "13": "Sports",
                                                    "14": "Ninja",
                                                    "15": "WildWest"
                                                }
                                            },
                                            "type": "array",
                                            "description": "List of genres of the asset"
                                        },
                                        "moderationStatus": {
                                            "enum": {
                                                "1": "Green",
                                                "2": "Yellow",
                                                "3": "Orange",
                                                "4": "Red"
                                            },
                                            "description": "The current moderation status of the asset.",
                                            "type": "string"
                                        },
                                        "locale": {
                                            "description": "Locale",
                                            "type": "string"
                                        },
                                        "isVersioningEnabled": {
                                            "description": "Indicates if this asset is allowed to be versioned.",
                                            "type": "boolean"
                                        },
                                        "isCopyingAllowed": {
                                            "description": "Indicates copying is allowed.",
                                            "type": "boolean"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created date of current asset version.",
                                            "type": "string"
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
                                            "description": "Type of the asset.",
                                            "type": "string"
                                        },
                                        "isArchivable": {
                                            "description": "Indicates if this asset is allowed to be archived.",
                                            "type": "boolean"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "ID of the asset.",
                                            "type": "integer"
                                        },
                                        "isModerated": {
                                            "description": "Indicates if this asset is moderated.",
                                            "type": "boolean"
                                        },
                                        "localName": {
                                            "description": "",
                                            "type": "string"
                                        },
                                        "localDescription": {
                                            "description": "",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the asset",
                                            "type": "string"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Creator of an Asset",
                                                "properties": {
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "description": "Type of a creator",
                                                        "type": "string"
                                                    },
                                                    "targetId": {
                                                        "format": "int64",
                                                        "description": "Id of a creator",
                                                        "type": "integer"
                                                    },
                                                    "typeId": {
                                                        "format": "int32",
                                                        "description": "TypeId of a creator",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The asset creator."
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated date of current asset version.",
                                            "type": "string"
                                        },
                                        "enableComments": {
                                            "description": "Indicates comments enabled.",
                                            "type": "boolean"
                                        },
                                        "isPublicDomainEnabled": {
                                            "description": "Indicates isPublicDomain can be set.",
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "description": "Description of the asset",
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
            "description": "3: Authenticated user does not have permissions to manage the asset."
        },
        "400": {
            "description": "5: AssetIds is empty.\r\n6: Too many ids in AssetIds.\r\n7: One or more of AssetIds are invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}
```json
{
    "Method": "GET",
    "Description": "Gets a Represents a universe in API endpoint results..",
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
            "description": "The Universe id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Represents a universe in API endpoint results.",
                    "properties": {
                        "created": {
                            "format": "date-time",
                            "description": "The created {System.DateTime}",
                            "type": "string"
                        },
                        "description": {
                            "description": "The description of the universe",
                            "type": "string"
                        },
                        "creatorTargetId": {
                            "format": "int64",
                            "description": "The id of the user or group that created this universe.",
                            "type": "integer"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The universe Id.",
                            "type": "integer"
                        },
                        "isActive": {
                            "description": "Is this universe active",
                            "type": "boolean"
                        },
                        "privacyType": {
                            "description": "The universe's privacy type.",
                            "type": "string"
                        },
                        "name": {
                            "description": "The name of the universe",
                            "type": "string"
                        },
                        "updated": {
                            "format": "date-time",
                            "description": "The updated {System.DateTime}",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Is this universe archived",
                            "type": "boolean"
                        },
                        "rootPlaceId": {
                            "format": "int64",
                            "description": "The universe's root place id",
                            "type": "integer"
                        },
                        "creatorName": {
                            "description": "The name of the creator of the universe.",
                            "type": "string"
                        },
                        "creatorType": {
                            "description": "The creator type, either \"User\" or \"Group\"",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The universe does not exist."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/packages/assets/versions/metadata/get
```json
{
    "Method": "POST",
    "Description": "Gets the package metadata for a list of versions of assets. Supports a maximum of 25 objects per request.",
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
                        "type": "object",
                        "description": "The request model for the GetAssetPackageMetadata endpoint.",
                        "properties": {
                            "assetVersionNumber": {
                                "format": "int64",
                                "description": "The id of the version of the asset of the package.",
                                "type": "integer"
                            },
                            "assetId": {
                                "format": "int64",
                                "description": "The id of the asset of the package.",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "description": "The list of asset id and asset version number to query package metadata."
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
                                    "description": "The response model for the GetAssetPackageMetadata endpoint.",
                                    "properties": {
                                        "message": {
                                            "description": "The commit message for this version.",
                                            "type": "string"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The id of the asset of the package.",
                                            "type": "integer"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int64",
                                            "description": "The id of the version of the asset.",
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
            "description": "0: Token Validation Failed\r\n7: Authenticated user does not have UseView permission."
        },
        "400": {
            "description": "1: The request body is missing.\r\n15: Too many asset versions were specified in a single operation.\r\n18: Duplicate assets specified for this request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/search/universes
```json
{
    "Method": "GET",
    "Description": "Allows searching for universes.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "q",
            "description": "A search query with filters seperated by whitespace. Example: \"these are keywords! filterName:filterValue filterName:filterValue\"\n\narchived:[Value] (required: False)\nAllowed values: [True,False]\n\nactive:[Value] (required: False)\nAllowed values: [True,False]\n\ncreator:[Value] (required: True)\nAllowed values: [User,Group,Team]\n\ngroups:[Value,Value,...] (required: False)\n\n",
        },
        "2": {
            "in": "query",
            "type": "array",
            "name": "sort",
            "description": "Determines the way results will be sorted. Format: (a prefix for ascending or descending) + (sort type).\n\nAscending Prefix: +\n\nDescending Prefix -\n\nAllowed Sort Types: +GameCreated,-GameCreated,+GameName,-GameName,+RootPlaceName,-RootPlaceName,+RootPlaceUpdated,-RootPlaceUpdated,-LastUpdated\n\nNote: An allowed type with no prefix allows both ascending and descending but if a prefix is specified only the specified order is allowed.",
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
            "description": "",
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
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created {System.DateTime}",
                                            "type": "string"
                                        },
                                        "description": {
                                            "description": "The description of the universe",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The id of the user or group that created this universe.",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "isActive": {
                                            "description": "Is this universe active",
                                            "type": "boolean"
                                        },
                                        "privacyType": {
                                            "description": "The universe's privacy type.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated {System.DateTime}",
                                            "type": "string"
                                        },
                                        "isArchived": {
                                            "description": "Is this universe archived",
                                            "type": "boolean"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The universe's root place id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The name of the creator of the universe.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "The creator type, either \"User\" or \"Group\"",
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
        "500": {
            "description": "Unknown error retrieving search results."
        },
        "400": {
            "description": "'q' field value contains filter which value has a wrong format or is not in allowed values list.\r\nor\r\n'q' field value doesn't contain filter which is required.\r\nor\r\n'sort' field value has a wrong format or is not in allowed values list."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/is-verified-creator
```json
{
    "Method": "GET",
    "Description": "Check if the current user is a verified creator",
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
                    "description": "Get is-verified-creator response model",
                    "properties": {
                        "isVerifiedCreator": {
                            "description": "Indicates an user is a verified creator.",
                            "type": "boolean"
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


## /v1/packages/assets/{assetId}/versions/{assetVersionNumber}
```json
{
    "Method": "POST",
    "Description": "Sets the package metadata for an asset version. This turns an assetversion into a package version.",
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
            "description": "The asset the version belongs to."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetVersionNumber",
            "format": "int64",
            "required": true,
            "description": "the version id the package metadata should be written to."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for the SetAssetVersionMetadata endpoint.",
                    "properties": {
                        "message": {
                            "description": "The asset version's commit message.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: Authenticated user does not have Edit permission."
        },
        "400": {
            "description": "7: The referenced AssetVersion already had metadata set previously.\r\n12: Commit message is null.\r\n13: Commit message is too long."
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
            "description": "3: The referenced asset does not exist.\r\n4: The referenced version of the asset does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/user/groups/canmanage
```json
{
    "Method": "GET",
    "Description": "Gets a list of Groups that a user can manage.",
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
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing information about a group",
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
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/aliases
```json
{
    "Method": "POST",
    "Description": "Creates an alias.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for an asset alias.",
                    "properties": {
                        "type": {
                            "enum": {
                                "1": "Asset",
                                "2": "DeveloperProduct",
                                "3": "AssetVersion"
                            },
                            "description": "Alias type. Required when creating an alias, optional for an update.",
                            "type": "string"
                        },
                        "name": {
                            "description": "Alias name. Required when creating an alias, optional for an update.",
                            "type": "string"
                        },
                        "targetId": {
                            "format": "int64",
                            "description": "Alias target. Required when creating an alias, optional for an update.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request body containing the alias attributes."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n10: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The request body is missing.\r\n2: The alias name is required.\r\n3: The alias type is required.\r\n4: The alias target is required.\r\n6: The alias name is invalid."
        },
        "409": {
            "description": "8: An alias with the provided name already exists."
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
            "description": "7: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/multiget
```json
{
    "Method": "GET",
    "Description": "Gets a {System.Collections.Generic.List`1}.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "The universe IDs to get. Limit 100.",
            "name": "ids"
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
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created {System.DateTime}",
                                            "type": "string"
                                        },
                                        "description": {
                                            "description": "The description of the universe",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The id of the user or group that created this universe.",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "isActive": {
                                            "description": "Is this universe active",
                                            "type": "boolean"
                                        },
                                        "privacyType": {
                                            "description": "The universe's privacy type.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated {System.DateTime}",
                                            "type": "string"
                                        },
                                        "isArchived": {
                                            "description": "Is this universe archived",
                                            "type": "boolean"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The universe's root place id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The name of the creator of the universe.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "The creator type, either \"User\" or \"Group\"",
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
            "description": "8: No universe IDs sent to get.\r\n9: Too many universe IDs sent to get, the limit is: "
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/developerproducts
```json
{
    "Method": "POST",
    "Description": "Creates a Developer Product.",
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
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "name",
            "required": true,
            "description": "The name of the developer product."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "description",
            "required": true,
            "description": "The description of the developer product."
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "priceInRobux",
            "format": "int64",
            "required": true,
            "description": "Price of the dev product in robux."
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "iconImageAssetId",
            "format": "int64",
            "description": "Asset id of the image to be used as an icon.",
        }
    },
    "Responses": {
        "500": {
            "description": "8: Unknown error occurred."
        },
        "400": {
            "description": "4: Developer product name already exists in the universe.\r\n9: Price in robux can not be negative."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model representing data about an {Roblox.Platform.VirtualEconomy.IDeveloperProduct}",
                    "properties": {
                        "shopId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "iconImageAssetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "Description": {
                            "type": "string"
                        },
                        "name": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "5: Universe not found.\r\n7: Shop id is not found."
        },
        "429": {
            "description": "11: Too many requests made in a short time. Wait for a little bit and try again."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: Product is created by another user.\r\n6: User doesn't have access to universe."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "gets developer products for a universe.",
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
            "type": "integer",
            "name": "pageNumber",
            "format": "int32",
            "required": true,
            "description": "Page number."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": "Number of developer products per page."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "A model representing data about an {Roblox.Platform.VirtualEconomy.IDeveloperProduct}",
                        "properties": {
                            "shopId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "iconImageAssetId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "id": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "Description": {
                                "type": "string"
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
        "500": {
            "description": "8: Unknown error occurred."
        },
        "400": {
            "description": "5: Universe not found.\r\n7: Shop id is not found.\r\n12: The page number must be greater than 0."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/thumbnails/{thumbnailId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes a thumbnail.",
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
            "description": "The universe Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "thumbnailId",
            "format": "int64",
            "required": true,
            "description": "The Id of the thumbnail to delete."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: You are not authorized to configure this universe."
        },
        "400": {
            "description": "5: The universe has no root place."
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
            "description": "3: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/user/notifications/statistic-reports
```json
{
    "Method": "GET",
    "Description": "Gets a list of DeveloperMetricsAvailable notifications for the authenticated user.",
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
                                    "properties": {
                                        "Expires": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "UniverseId": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "GameName": {
                                            "readOnly": true,
                                            "type": "string"
                                        },
                                        "RootPlaceId": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
                                        },
                                        "UserId": {
                                            "format": "int64",
                                            "readOnly": true,
                                            "type": "integer"
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/teamtest/{placeId}
```json
{
    "Method": "DELETE",
    "Description": "Close a game instance that is being used for team testing",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the place we are setting the metadata for."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "gameId",
            "required": true,
            "description": "the Guid of the game instance {System.Guid}"
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
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/thumbnails/order
```json
{
    "Method": "POST",
    "Description": "Changes the order of universe thumbnails to match the order of provided thumbnail ids. Ids that do not correspond to a valid thumbnail will be ignored. Existing thumbnails
not included into the list will be placed at the end.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for setting the order of game thumbnails.",
                    "properties": {
                        "thumbnailIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "List of thumbnail ids in desired order."
                        }
                    }
                }
            },
            "description": "The request body containing the list of thumbnail ids in desired order."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The request body is missing.\r\n5: The universe has no root place.\r\n7: The list of thumbnail ids is required.\r\n8: Too many thumbnail ids provided.\r\n9: One or more of the provided thumbnail ids are not valid."
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
            "description": "3: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/compatibilities
```json
{
    "Method": "GET",
    "Description": "Gets compatibility of place with different platforms placeId",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id for the place to be updated."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "Compatibilities": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model containing information about a place",
                                    "properties": {
                                        "status": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Good",
                                                "2": "Unknown",
                                                "3": "Bad"
                                            }
                                        },
                                        "crashRatePercentage": {
                                            "type": "number",
                                            "format": "double"
                                        },
                                        "platformName": {
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
            "description": "Authenticated user is not authorized to manage this place."
        },
        "400": {
            "description": "{placeId} is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/symbolic-links
```json
{
    "Method": "GET",
    "Description": "Gets all symbolic links existing for the places in a specified universe.",
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
            "description": "The id of the universe."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by the guids of the symbolic links.",
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
                                    "properties": {
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
            "description": "11: Authenticated user does not have read permissions or UseView package permission."
        },
        "404": {
            "description": "9: Game does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/teamcreate
```json
{
    "Method": "POST",
    "Description": "Edit team create settings for a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Team create settings request",
                    "properties": {
                        "isEnabled": {
                            "description": "Whether or not the universe should be enabled for team create",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The request body containing the team create settings."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.Unauthorized}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "PATCH",
    "Description": "Edit team create settings for a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Team create settings request",
                    "properties": {
                        "isEnabled": {
                            "description": "Whether or not the universe should be enabled for team create",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The request body containing the team create settings."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.Unauthorized}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets TeamCreate settings for an Roblox.Platform.Universes.IUniverse.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Team create settings",
                    "properties": {
                        "isEnabled": {
                            "description": "Whether or not the universe should be enabled for team create",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.Unauthorized}"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/toolbox/items
```json
{
    "Method": "GET",
    "Description": "toolbox items discovering",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "category",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "keyword",
            "description": "",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "sort",
            "description": "",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "creatorId",
            "format": "int64",
            "description": "user id or group id",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "num",
            "format": "int32",
            "description": "20 by default",
        },
        "6": {
            "in": "query",
            "type": "integer",
            "name": "page",
            "format": "int32",
            "description": "1 by default",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "description": "",
        },
        "8": {
            "in": "query",
            "type": "integer",
            "name": "creatorType",
            "format": "int32",
            "description": "1 for user, 2 for group",
        },
        "9": {
            "in": "query",
            "type": "string",
            "name": "cacheMode",
            "enum": {
                "1": "Normal",
                "2": "Bypass",
                "3": "ForceUpdate"
            },
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "TotalResults": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "Results": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Creator": {
                                            "$ref": {
                                                "properties": {
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "Type": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Name": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "Thumbnail": {
                                            "$ref": {
                                                "properties": {
                                                    "RetryUrl": {
                                                        "type": "string"
                                                    },
                                                    "EndpointType": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "Url": {
                                                        "type": "string"
                                                    },
                                                    "UserId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "Final": {
                                                        "type": "boolean"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "Voting": {
                                            "$ref": {
                                                "properties": {
                                                    "UserVote": {
                                                        "type": "boolean"
                                                    },
                                                    "UpVotes": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "ReasonForNotVoteable": {
                                                        "type": "string"
                                                    },
                                                    "CanVote": {
                                                        "type": "boolean"
                                                    },
                                                    "ShowVotes": {
                                                        "type": "boolean"
                                                    },
                                                    "DownVotes": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "HasVoted": {
                                                        "readOnly": true,
                                                        "type": "boolean"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "Asset": {
                                            "$ref": {
                                                "properties": {
                                                    "Created": {
                                                        "type": "string"
                                                    },
                                                    "IsEndorsed": {
                                                        "type": "boolean"
                                                    },
                                                    "TypeId": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "AssetGenres": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "Duration": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Updated": {
                                                        "type": "string"
                                                    },
                                                    "Name": {
                                                        "type": "string"
                                                    },
                                                    "CreatedRaw": {
                                                        "type": "string",
                                                        "format": "date-time"
                                                    },
                                                    "UpdatedRaw": {
                                                        "type": "string",
                                                        "format": "date-time"
                                                    },
                                                    "Description": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "Product": {
                                            "$ref": {
                                                "properties": {
                                                    "Price": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "ProductId": {
                                                        "type": "integer",
                                                        "format": "int64"
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
    "Internal": false
}
```
<hr>


## /v1/packages/assets/{assetId}/permissions
```json
{
    "Method": "GET",
    "Description": "Returns a list of permissions for a package.",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "type": "string"
            },
            "required": true,
            "name": "actionsTextToFilter"
        }
    },
    "Responses": {
        "500": {
            "description": "0: Unknown error"
        },
        "400": {
            "description": "3: Invalid action"
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
                                    "description": "Model that represents a permission assigned to a package.",
                                    "properties": {
                                        "resourceType": {
                                            "type": "string",
                                            "description": "Resource type of the permission, which is \"Package\" in this context.",
                                            "readOnly": true
                                        },
                                        "action": {
                                            "enum": {
                                                "1": "UseView",
                                                "2": "Edit",
                                                "3": "Revoked",
                                                "4": "Own"
                                            },
                                            "description": "The action granted to the subject about the resource.",
                                            "type": "string"
                                        },
                                        "upToVersion": {
                                            "format": "int32",
                                            "description": "Asset version number that granted. This is usually the number of currently published version, but it's specified when the permission is revoked.",
                                            "type": "integer"
                                        },
                                        "resourceId": {
                                            "format": "int64",
                                            "description": "ID of the resource, which is supposed to be asset Id of the package.",
                                            "type": "integer"
                                        },
                                        "subjectType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group",
                                                "3": "Roleset"
                                            },
                                            "description": "Subject type of the permission.",
                                            "type": "string"
                                        },
                                        "subjectId": {
                                            "format": "int64",
                                            "description": "Subject id of the permission.",
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
        "404": {
            "description": "1: Invalid asset id\r\n4: The referenced asset does not exist."
        },
        "403": {
            "description": "5: Authenticated user does not have Own permission."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/places/{placeId}/stats/{type}/legacy/flot
```json
{
    "Method": "GET",
    "Description": "Get statistics data for a place in a certain format.
DO NOT USE THIS ENDPOINT. It may be removed at any time. Use GetStatistics instead.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "enum": {
                "1": "Revenue",
                "2": "RevenuePerVisit",
                "3": "AverageVisitLength",
                "4": "Visits"
            },
            "required": true,
            "description": "The data type."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "timeFrame",
            "enum": {
                "1": "Hourly",
                "2": "Daily",
                "3": "Monthly"
            },
            "required": true,
            "description": "The {Roblox.Api.Develop.Models.StatisticsDataGranularity}."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "divisionType",
            "enum": {
                "1": "Device",
                "2": "Age"
            },
            "description": "Optional division type for the data.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "startTime",
            "description": "Optional time of first sample.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "endTime",
            "description": "Optional time of last sample.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "2: Not authorized to perform this action."
        },
        "404": {
            "description": "1: The place is invalid.\r\n3: Too many data points requested.\r\n4: The requested data type is not known."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/archive
```json
{
    "Method": "POST",
    "Description": "Archives an asset if not already archived.",
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
            "description": "Id of the asset"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Authenticated user does not have permissions to manage the asset."
        },
        "400": {
            "description": "4: Asset type is not supported by the requested operation."
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
            "description": "1: The referenced asset does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/social-links/{socialLinkId}
```json
{
    "Method": "PATCH",
    "Description": "Updates a social link",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe"
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "socialLinkId",
            "format": "int64",
            "required": true,
            "description": "The id of the social link being updated"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "An update request for a social link",
                    "properties": {
                        "type": {
                            "enum": {
                                "1": "Facebook",
                                "2": "Twitter",
                                "3": "YouTube",
                                "4": "Twitch",
                                "5": "GooglePlus",
                                "6": "Discord",
                                "7": "RobloxGroup"
                            },
                            "description": "What type of social media this points to",
                            "type": "string"
                        },
                        "title": {
                            "description": "The title of the link",
                            "type": "string"
                        },
                        "url": {
                            "description": "The url of the link",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {An update request for a social link}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: You do not have permission to configure this social link.\r\n10: Social links cannot be processed as this time."
        },
        "400": {
            "description": "2: The social link title is too long.\r\n3: The social link title cannot be empty.\r\n4: The social link url cannot be empty.\r\n6: The request was null.\r\n8: The social link type is invalid.\r\n11: The social link title was moderated."
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
            "description": "7: The requested social link was not found."
        },
        "503": {
            "description": "10: Social links cannot be processed as this time."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Deletes a social link",
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
            "description": "The id of the game you are editting, required for permissions checking"
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "socialLinkId",
            "format": "int64",
            "required": true,
            "description": "The id of the social link"
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
            "description": "0: Token Validation Failed\r\n1: You do not have permission to configure this social link.\r\n10: Social links cannot be processed as this time."
        },
        "404": {
            "description": "7: The requested social link was not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/gameUpdateNotifications/{universeId}
```json
{
    "Method": "POST",
    "Description": "Publishes a new Game Update Notification for a Roblox.Platform.Universes.IUniverseUniverse",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe id."
        },
        "2": {
            "in": "body",
            "name": "gameUpdateText",
            "required": true,
            "schema": {
                "type": "string"
            },
            "description": "The JSON object that will represent the body of the notification to be sent."
        }
    },
    "Responses": {
        "403": {
            "description": "User is not authorized for this action on the universe.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "Called with invalid arguments."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for a game update message.",
                    "properties": {
                        "createdOnKey": {
                            "description": "Key of Creation date ticks (dynamo table sort key).",
                            "type": "string"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "ID of the game.",
                            "type": "integer"
                        },
                        "createdOn": {
                            "format": "date-time",
                            "description": "Creation date of the update message.",
                            "type": "string"
                        },
                        "expiredOn": {
                            "format": "date-time",
                            "description": "Expiration date/time of the update message.",
                            "type": "string"
                        },
                        "impressions": {
                            "format": "int64",
                            "description": "Number of impressions of the update message.",
                            "type": "integer"
                        },
                        "unfollows": {
                            "format": "int64",
                            "description": "Number of unfollows of the update message.",
                            "type": "integer"
                        },
                        "plays": {
                            "format": "int64",
                            "description": "Number of plays of the update message.",
                            "type": "integer"
                        },
                        "creatorName": {
                            "description": "Name of the creator entity.",
                            "type": "string"
                        },
                        "creatorId": {
                            "format": "int64",
                            "description": "ID of the creator entity (user, group, etc) creating the update message.",
                            "type": "integer"
                        },
                        "content": {
                            "description": "Content of the update message.",
                            "type": "string"
                        },
                        "creatorType": {
                            "description": "Type of the creator entity of the update message: user, group, etc.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "{universeId} is invalid."
        },
        "500": {
            "description": "The game update text is blocked by the filter."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Retrieves historical records of game update messages.",
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
            "description": "The game ID"
        }
    },
    "Responses": {
        "403": {
            "description": "User is not authorized for this action on the universe."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Model for a game update message.",
                        "properties": {
                            "createdOnKey": {
                                "description": "Key of Creation date ticks (dynamo table sort key).",
                                "type": "string"
                            },
                            "universeId": {
                                "format": "int64",
                                "description": "ID of the game.",
                                "type": "integer"
                            },
                            "createdOn": {
                                "format": "date-time",
                                "description": "Creation date of the update message.",
                                "type": "string"
                            },
                            "expiredOn": {
                                "format": "date-time",
                                "description": "Expiration date/time of the update message.",
                                "type": "string"
                            },
                            "impressions": {
                                "format": "int64",
                                "description": "Number of impressions of the update message.",
                                "type": "integer"
                            },
                            "unfollows": {
                                "format": "int64",
                                "description": "Number of unfollows of the update message.",
                                "type": "integer"
                            },
                            "plays": {
                                "format": "int64",
                                "description": "Number of plays of the update message.",
                                "type": "integer"
                            },
                            "creatorName": {
                                "description": "Name of the creator entity.",
                                "type": "string"
                            },
                            "creatorId": {
                                "format": "int64",
                                "description": "ID of the creator entity (user, group, etc) creating the update message.",
                                "type": "integer"
                            },
                            "content": {
                                "description": "Content of the update message.",
                                "type": "string"
                            },
                            "creatorType": {
                                "description": "Type of the creator entity of the update message: user, group, etc.",
                                "type": "string"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "404": {
            "description": "{universeId} is invalid."
        },
        "500": {
            "description": "The Game Updates Infrastructure Service is unavailable."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/packages/assets/highest-permissions
```json
{
    "Method": "GET",
    "Description": "Get highest package permissions granted to current user for each package.",
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
            "name": "assetIds"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Representation of user permission check.",
                    "properties": {
                        "permissions": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Representation of user permission check.",
                                    "properties": {
                                        "hasPermission": {
                                            "type": "boolean"
                                        },
                                        "assetId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "action": {
                                            "type": "string",
                                            "enum": {
                                                "1": "UseView",
                                                "2": "Edit",
                                                "3": "Revoked",
                                                "4": "Own"
                                            }
                                        },
                                        "upToVersion": {
                                            "type": "integer",
                                            "format": "int32"
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
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: Unknown error"
        },
        "404": {
            "description": "1: Invalid asset id\r\n4: The referenced asset does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/groups/{groupId}/universes
```json
{
    "Method": "GET",
    "Description": "Gets a list of universes for the given group.",
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
            "description": "The group id."
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "isArchived",
            "description": "Whether or not to return archived games.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by universeId",
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
            "description": "",
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
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created {System.DateTime}",
                                            "type": "string"
                                        },
                                        "description": {
                                            "description": "The description of the universe",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The id of the user or group that created this universe.",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "isActive": {
                                            "description": "Is this universe active",
                                            "type": "boolean"
                                        },
                                        "privacyType": {
                                            "description": "The universe's privacy type.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated {System.DateTime}",
                                            "type": "string"
                                        },
                                        "isArchived": {
                                            "description": "Is this universe archived",
                                            "type": "boolean"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The universe's root place id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The name of the creator of the universe.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "The creator type, either \"User\" or \"Group\"",
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
            "description": "Invalid {groupId}."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/gametemplates
```json
{
    "Method": "GET",
    "Description": "Gets a page of templates that can be used to start off making games.",
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
                                    "description": "Represents a game template in API endpoint responses.",
                                    "properties": {
                                        "hasTutorials": {
                                            "description": "Whether this game template has tutorials.",
                                            "type": "boolean"
                                        },
                                        "universe": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Represents a universe in API endpoint results.",
                                                "properties": {
                                                    "created": {
                                                        "format": "date-time",
                                                        "description": "The created {System.DateTime}",
                                                        "type": "string"
                                                    },
                                                    "description": {
                                                        "description": "The description of the universe",
                                                        "type": "string"
                                                    },
                                                    "creatorTargetId": {
                                                        "format": "int64",
                                                        "description": "The id of the user or group that created this universe.",
                                                        "type": "integer"
                                                    },
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The universe Id.",
                                                        "type": "integer"
                                                    },
                                                    "isActive": {
                                                        "description": "Is this universe active",
                                                        "type": "boolean"
                                                    },
                                                    "privacyType": {
                                                        "description": "The universe's privacy type.",
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "description": "The name of the universe",
                                                        "type": "string"
                                                    },
                                                    "updated": {
                                                        "format": "date-time",
                                                        "description": "The updated {System.DateTime}",
                                                        "type": "string"
                                                    },
                                                    "isArchived": {
                                                        "description": "Is this universe archived",
                                                        "type": "boolean"
                                                    },
                                                    "rootPlaceId": {
                                                        "format": "int64",
                                                        "description": "The universe's root place id",
                                                        "type": "integer"
                                                    },
                                                    "creatorName": {
                                                        "description": "The name of the creator of the universe.",
                                                        "type": "string"
                                                    },
                                                    "creatorType": {
                                                        "description": "The creator type, either \"User\" or \"Group\"",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The universe of this game template."
                                        },
                                        "gameTemplateType": {
                                            "description": "The type of this game template.",
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
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/statistic-reports
```json
{
    "Method": "GET",
    "Description": "Lists all months and years for which universe statistics are available.",
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
                    "type": "object",
                    "description": "The response model for statistics about a place",
                    "properties": {
                        "reports": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "yearDashMonth": {
                                            "type": "string"
                                        },
                                        "universeId": {
                                            "type": "string"
                                        },
                                        "status": {
                                            "type": "string",
                                            "enum": {
                                                "1": "NotGenerated",
                                                "2": "Queued",
                                                "3": "ReadyForDownload"
                                            }
                                        },
                                        "spreadsheetId": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/places/{placeId}/symbolic-links/resolve
```json
{
    "Method": "GET",
    "Description": "Resolves the assets symbolic links is pointing to. Supports a maximum of 25 ids per request.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The id of the place the symbolic links are existing in."
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
            },
            "required": true,
            "description": "The guids of the symbolic links to resolve.",
            "name": "ids"
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
                                    "description": "Represents a symbolic link exisiting within the context of a place pointing to a specific version of an asset.",
                                    "properties": {
                                        "id": {
                                            "type": "string",
                                            "format": "uuid",
                                            "description": "The symbolic link's guid.",
                                            "example": "00000000-0000-0000-0000-000000000000"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "The id of the place place the link lives in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The id of the asset the symbolic link is pointing to.",
                                            "type": "integer"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int64",
                                            "description": "The version of the asset the symbolic link is pointing to.",
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
        "400": {
            "description": "1: The request body is missing.\r\n14: Too many symbolic links were specified in a single operation."
        },
        "404": {
            "description": "2: Place does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/revenue-reports/{yearDashMonth}/generate
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: \r\n11: No report found by this name: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "revenueReportStatus": {
                            "enum": {
                                "1": "NotGenerated",
                                "2": "Queued",
                                "3": "ReadyForDownload"
                            },
                            "readOnly": true,
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "14: The feature is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/places/{placeId}/stats/developer-product-aggregation
```json
{
    "Method": "GET",
    "Description": "An endpoint that returns whether the age data is available for a place.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "timeFrame",
            "enum": {
                "1": "Hourly",
                "2": "Daily",
                "3": "Monthly"
            },
            "required": true,
            "description": "The {Roblox.Api.Develop.Models.StatisticsDataGranularity}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the GetDeveloperProductAggregation endpoint.",
                    "properties": {
                        "developerProductRevenueByDevice": {
                            "type": "object",
                            "description": "Gets developerProduct Revenue from each DeviceType",
                            "properties": {
                                "Phone": {
                                    "items": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "DeveloperProductRevenue",
                                            "properties": {
                                                "developerProductName": {
                                                    "description": "DeveloperProduct Name.",
                                                    "type": "string"
                                                },
                                                "revenueAmount": {
                                                    "format": "int64",
                                                    "description": "Revenue Amount.",
                                                    "type": "integer"
                                                }
                                            }
                                        }
                                    },
                                    "type": "array"
                                },
                                "Computer": {
                                    "items": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "DeveloperProductRevenue",
                                            "properties": {
                                                "developerProductName": {
                                                    "description": "DeveloperProduct Name.",
                                                    "type": "string"
                                                },
                                                "revenueAmount": {
                                                    "format": "int64",
                                                    "description": "Revenue Amount.",
                                                    "type": "integer"
                                                }
                                            }
                                        }
                                    },
                                    "type": "array"
                                },
                                "Console": {
                                    "items": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "DeveloperProductRevenue",
                                            "properties": {
                                                "developerProductName": {
                                                    "description": "DeveloperProduct Name.",
                                                    "type": "string"
                                                },
                                                "revenueAmount": {
                                                    "format": "int64",
                                                    "description": "Revenue Amount.",
                                                    "type": "integer"
                                                }
                                            }
                                        }
                                    },
                                    "type": "array"
                                },
                                "Tablet": {
                                    "items": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "DeveloperProductRevenue",
                                            "properties": {
                                                "developerProductName": {
                                                    "description": "DeveloperProduct Name.",
                                                    "type": "string"
                                                },
                                                "revenueAmount": {
                                                    "format": "int64",
                                                    "description": "Revenue Amount.",
                                                    "type": "integer"
                                                }
                                            }
                                        }
                                    },
                                    "type": "array"
                                }
                            }
                        },
                        "allDevicesDeveloperProductRevenue": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "DeveloperProductRevenue",
                                    "properties": {
                                        "developerProductName": {
                                            "description": "DeveloperProduct Name.",
                                            "type": "string"
                                        },
                                        "revenueAmount": {
                                            "format": "int64",
                                            "description": "Revenue Amount.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets developerProduct Revenue from all DeviceTypes"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: Not authorized to perform this action."
        },
        "400": {
            "description": "1: The place is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/{userId}/is-admin-developer-console-enabled
```json
{
    "Method": "GET",
    "Description": "Check if admin dev console is enabled for user.",
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
            "description": "The id of the user."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for GetIsAdminDeveloperConsoleEnabled endpoint",
                    "properties": {
                        "isAdminDeveloperConsoleEnabled": {
                            "description": "Indicates the admin developer console is enabled for a user.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "4: Argument error."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/assets/{assetId}
```json
{
    "Method": "PATCH",
    "Description": "Update an asset.",
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
            "description": "ID of the asset."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating an asset.",
                    "properties": {
                        "locale": {
                            "type": "string"
                        },
                        "localDescription": {
                            "type": "string"
                        },
                        "name": {
                            "description": "Name of the asset",
                            "type": "string"
                        },
                        "genres": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "All",
                                    "2": "Tutorial",
                                    "3": "Scary",
                                    "4": "TownAndCity",
                                    "5": "War",
                                    "6": "Funny",
                                    "7": "Fantasy",
                                    "8": "Adventure",
                                    "9": "SciFi",
                                    "10": "Pirate",
                                    "11": "FPS",
                                    "12": "RPG",
                                    "13": "Sports",
                                    "14": "Ninja",
                                    "15": "WildWest"
                                }
                            },
                            "type": "array",
                            "description": "List of genres of the asset"
                        },
                        "localName": {
                            "type": "string"
                        },
                        "enableComments": {
                            "description": "Indicates comments enabled.",
                            "type": "boolean"
                        },
                        "isCopyingAllowed": {
                            "description": "Indicates if copying is allowed.",
                            "type": "boolean"
                        },
                        "description": {
                            "description": "Description of the asset",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Data to be updated."
        }
    },
    "Responses": {
        "500": {
            "description": "11: Unknown exception."
        },
        "400": {
            "description": "8: AssetId is invalid.\r\n9: At least one genre should be specified.\r\n13: Only a marketplace asset can be updated with IsCopyingAllowed.\r\n14: Package can not update IsCopyingAllowed.\r\n15: The name of an Asset should not be empty.\r\n16: Description too long.\r\n17: Text moderated."
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
            "description": "1: The referenced asset does not exist."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n3: Authenticated user does not have permissions to manage the asset."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/revenue-reports/{yearDashMonth}/download
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: \r\n11: No report found by this name: \r\n13: Your game may not have any transactions during this time period."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "503": {
            "description": "14: The feature is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/places/{placeId}
```json
{
    "Method": "POST",
    "Description": "Updates the place configuration for the place with the id placeId",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id for the place to be updated."
        },
        "2": {
            "in": "body",
            "name": "configuration",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place to be configured",
                    "properties": {
                        "name": {
                            "type": "string"
                        },
                        "description": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place",
                    "properties": {
                        "id": {
                            "format": "int64",
                            "description": "Returns the place id.",
                            "type": "integer"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "Returns the id of the place's universe, or null - if the place is not part of a universe.",
                            "type": "integer"
                        },
                        "name": {
                            "description": "Returns the place name.",
                            "type": "string"
                        },
                        "description": {
                            "description": "Returns the place description.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Authenticated user is not authorized to manage this place.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{placeId} is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "PATCH",
    "Description": "Updates the place configuration for the place with the id placeId",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id for the place to be updated."
        },
        "2": {
            "in": "body",
            "name": "configuration",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place to be configured",
                    "properties": {
                        "name": {
                            "type": "string"
                        },
                        "description": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place",
                    "properties": {
                        "id": {
                            "format": "int64",
                            "description": "Returns the place id.",
                            "type": "integer"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "Returns the id of the place's universe, or null - if the place is not part of a universe.",
                            "type": "integer"
                        },
                        "name": {
                            "description": "Returns the place name.",
                            "type": "string"
                        },
                        "description": {
                            "description": "Returns the place description.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Authenticated user is not authorized to manage this place.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{placeId} is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/{assetId}/restore
```json
{
    "Method": "POST",
    "Description": "Un-archive (Restore) an asset.",
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
            "description": "Id of the asset"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Authenticated user does not have permissions to manage the asset."
        },
        "400": {
            "description": "4: Asset type is not supported by the requested operation."
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
            "description": "1: The referenced asset does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/plugins/{pluginId}/install-count
```json
{
    "Method": "GET",
    "Description": "Gets number of initial installs of plugin.  (This is STUB api yet)",
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
            "description": "The plugin id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the GetPluginInstallCount endpoint.",
                    "properties": {
                        "installCount": {
                            "format": "int64",
                            "description": "The initial install count of plugin.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "3: The id is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/thumbnails/video
```json
{
    "Method": "POST",
    "Description": "Adds a video thumbnail.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for adding a video thumbnail.",
                    "properties": {
                        "url": {
                            "description": "YouTube URL.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body containing the video URL."
        }
    },
    "Responses": {
        "402": {
            "description": "15: You do not have sufficient funds to purchase a video thumbnail."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n4: You are not authorized to configure this universe.\r\n16: You are not allowed to add video thumbnails."
        },
        "400": {
            "description": "1: The request body is missing.\r\n2: The video URL is invalid.\r\n5: The universe has no root place.\r\n10: The provided video does not support embedding.\r\n11: The video duration is too long.\r\n12: The video description is too long.\r\n13: This video description is not acceptable.\r\n14: This video is not acceptable."
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
            "description": "3: The universe does not exist."
        },
        "503": {
            "description": "0: An unexpected error has occured."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/stats/creator-dashboard-metadata
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
                        "playFabDataSourceChartsAvailableByKPITypes": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "isPlayFabDataSourceChartsEnabled": {
                            "type": "boolean"
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
    "Internal": false
}
```
<hr>


## /v1/teamtest/places/{placeId}/runninggames
```json
{
    "Method": "GET",
    "Description": "Get Currently running team tests for a given place",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the place we are getting the metadata for"
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "not sorted",
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
        "403": {
            "description": "User is not authorized for this action on the place."
        },
        "400": {
            "description": "{placeId} is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/permissions
```json
{
    "Method": "GET",
    "Description": "Returns list of granted and declined permissions related to the universe with the id universeId for authenticated user",
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
                    "type": "object",
                    "description": "A model containing information about a universe permissions",
                    "properties": {
                        "canManage": {
                            "description": "Determines whether or not consumer can manage the target universe",
                            "type": "boolean"
                        },
                        "canCloudEdit": {
                            "description": "Determines whether or not consumer can cloud the target universe\r\nThis is only nullable/optional in the context of https://develop.roblox.com/docs#!/Universes/get_v1_universes_universeId_context_permissions endpoint which is consumed only internally. It should be computed and set for all other usages.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/configuration
```json
{
    "Method": "PATCH",
    "Description": "Update universe settings for an owned universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universeId."
        },
        "2": {
            "in": "body",
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings patch requests",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "universeScaleType": {
                            "enum": {
                                "1": "NoScales",
                                "2": "AllScales"
                            },
                            "description": "Whether custom scales allowed in the universe.",
                            "type": "string"
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The name of the universe.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "universeBodyType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "What avatar body types are allowed by the universe.",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe.",
                            "type": "boolean"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning type is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Model for UniverseSettings patch requests} model."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not authorized to configure this universe.\r\n14: You are not authorized to sell games."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n3: Invalid UniverseAvatarType.\r\n4: Invalid UniverseScaleType.\r\n5: Invalid UniverseAnimationType.\r\n6: Invalid UniverseCollisionType.\r\n7: New universe name or description has been rejected.\r\n8: New universe name is too long.\r\n10: Invalid UniverseBodyType.\r\n11: Invalid UniverseJointPositioningType.\r\n12: The universe has no root place.\r\n13: At least one playable device must be provided.\r\n15: Price is required when isForSale is true.\r\n16: This game cannot be offered for sale because it is not public.\r\n17: This game cannot be offered for sale because it has private servers enabled.\r\n18: The game price is outside of the allowed range.\r\n19: Invalid genre.\r\n20: The request body is missing.\r\n21: Invalid device type.\r\n22: Invalid asset type.\r\n23: Invalid value, the min must be less than or equal to the max\r\n24: Invalid scale value"
        },
        "409": {
            "description": "9: Failed to shutdown all intances of game after changing AvatarType. The change has been reverted."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings controller responses",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "id": {
                            "format": "int64",
                            "description": "The universe Id.",
                            "type": "integer"
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "universeScaleType": {
                            "enum": {
                                "1": "NoScales",
                                "2": "AllScales"
                            },
                            "description": "Whether custom scales allowed in the universe.",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The universe name.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "universeBodyType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "What avatar body types are allowed by the universe.",
                            "type": "string"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get settings for an owned universe.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings controller responses",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "id": {
                            "format": "int64",
                            "description": "The universe Id.",
                            "type": "integer"
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "universeScaleType": {
                            "enum": {
                                "1": "NoScales",
                                "2": "AllScales"
                            },
                            "description": "Whether custom scales allowed in the universe.",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The universe name.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "universeBodyType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "What avatar body types are allowed by the universe.",
                            "type": "string"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/packages
```json
{
    "Method": "GET",
    "Description": "Gets all existing packages, which the current user can access (with UseView permission) in a universe.",
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
            "description": "The id of the universe."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by the guids of the symbolic links.",
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
                                    "description": "Represents a symbolic link to be returned from /v1/universes/{universeId}/packages.",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The Asset Id of a package.",
                                            "type": "integer"
                                        },
                                        "action": {
                                            "description": "The highest level of action allowed to current user.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the asset the symbolic link is pointing to.",
                                            "type": "string"
                                        },
                                        "upToVersion": {
                                            "format": "int32",
                                            "description": "The version number that current user can access up to, when the permission is revoked.",
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
            "description": "11: Authenticated user does not have read permissions or UseView package permission."
        },
        "404": {
            "description": "9: Game does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/plugins/{pluginId}/increment-install-count
```json
{
    "Method": "POST",
    "Description": "Increments count of a plugin installation. (This is STUB api yet)",
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
            "description": "The id of the plugin."
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
            "description": "3: The id is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/deactivate
```json
{
    "Method": "POST",
    "Description": "Deactivates a universe.",
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
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n2: This universe does not have a root place."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/aliases/{name}
```json
{
    "Method": "PATCH",
    "Description": "Updates an alias.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "name",
            "required": true,
            "description": "The name of the alias to update."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for an asset alias.",
                    "properties": {
                        "type": {
                            "enum": {
                                "1": "Asset",
                                "2": "DeveloperProduct",
                                "3": "AssetVersion"
                            },
                            "description": "Alias type. Required when creating an alias, optional for an update.",
                            "type": "string"
                        },
                        "name": {
                            "description": "Alias name. Required when creating an alias, optional for an update.",
                            "type": "string"
                        },
                        "targetId": {
                            "format": "int64",
                            "description": "Alias target. Required when creating an alias, optional for an update.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request body containing the alias attributes to update."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n10: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The request body is missing.\r\n5: Either none or both alias type and target should be provided.\r\n6: The alias name is invalid."
        },
        "409": {
            "description": "8: An alias with the provided name already exists."
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
            "description": "7: The universe does not exist.\r\n9: An alias with the provided name does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Deletes an alias.",
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
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "name",
            "required": true,
            "description": "The name of the alias to delete."
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
            "description": "0: Token Validation Failed\r\n10: You are not authorized to configure this universe."
        },
        "404": {
            "description": "7: The universe does not exist.\r\n9: An alias with the provided name does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/places
```json
{
    "Method": "GET",
    "Description": "Gets a list of places for a universe.",
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
            "description": "The asset id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by placeId",
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
                                    "description": "A model containing information about a place",
                                    "properties": {
                                    }
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
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/social-links
```json
{
    "Method": "POST",
    "Description": "Posts a social links",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the game"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "An update request for a social link",
                    "properties": {
                        "type": {
                            "enum": {
                                "1": "Facebook",
                                "2": "Twitter",
                                "3": "YouTube",
                                "4": "Twitch",
                                "5": "GooglePlus",
                                "6": "Discord",
                                "7": "RobloxGroup"
                            },
                            "description": "What type of social media this points to",
                            "type": "string"
                        },
                        "title": {
                            "description": "The title of the link",
                            "type": "string"
                        },
                        "url": {
                            "description": "The url of the link",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {An update request for a social link}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: You do not have permission to configure this social link."
        },
        "400": {
            "description": "2: The social link title is too long.\r\n3: The social link title cannot be empty.\r\n4: The social link url cannot be empty.\r\n6: The request was null.\r\n8: The social link type is invalid.\r\n11: The social link title was moderated."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A social link response from a create request",
                    "properties": {
                        "Id": {
                            "format": "int64",
                            "description": "The id of the social link",
                            "type": "integer"
                        },
                        "Type": {
                            "enum": {
                                "1": "Facebook",
                                "2": "Twitter",
                                "3": "YouTube",
                                "4": "Twitch",
                                "5": "GooglePlus",
                                "6": "Discord",
                                "7": "RobloxGroup"
                            },
                            "description": "What type of social media this points to",
                            "type": "string"
                        },
                        "Title": {
                            "description": "The title of the link",
                            "type": "string"
                        },
                        "Url": {
                            "description": "The url of the link",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "7: The requested social link was not found."
        },
        "503": {
            "description": "10: Social links cannot be processed as this time."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/universes/{universeId}/statistic-reports/{yearDashMonth}
```json
{
    "Method": "GET",
    "Description": "Retrieves the status of a spreadsheet with universe statistics for a given month.",
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
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true,
            "description": "Four digit year and two digit month of data to retrieve."
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "yearDashMonth": {
                            "type": "string"
                        },
                        "universeId": {
                            "type": "string"
                        },
                        "status": {
                            "type": "string",
                            "enum": {
                                "1": "NotGenerated",
                                "2": "Queued",
                                "3": "ReadyForDownload"
                            }
                        },
                        "spreadsheetId": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "11: No report found by this name: "
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/live-stats
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "totalPlayerCount": {
                            "format": "int32",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "gameCount": {
                            "format": "int32",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "playerCountsByDeviceType": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "integer",
                                "format": "int32"
                            },
                            "readOnly": true
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n2: This universe does not have a root place."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assets/genres
```json
{
    "Method": "GET",
    "Description": "Gets a list of genres.",
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
                                "type": "string"
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


## /v1/universes/{universeId}/configuration/vip-servers
```json
{
    "Method": "GET",
    "Description": "Get settings for an owned universe's VIP servers.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for private server details responses from the UniverseSettings controller.",
                    "properties": {
                        "isEnabled": {
                            "description": "Whether or not VIP servers are enabled on this universe.",
                            "type": "boolean"
                        },
                        "activeServersCount": {
                            "format": "int64",
                            "description": "The number of active VIP servers for this universe.",
                            "type": "integer"
                        },
                        "price": {
                            "format": "int64",
                            "description": "The price of the VIP server.",
                            "type": "integer"
                        },
                        "activeSubscriptionsCount": {
                            "format": "int64",
                            "description": "The number of active VIP server subscriptions.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/revenue-reports/{yearDashMonth}
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: \r\n11: No report found by this name: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model for returning revenue stats.",
                    "properties": {
                        "RevenueReportStatus": {
                            "readOnly": true,
                            "enum": {
                                "1": "NotGenerated",
                                "2": "Queued",
                                "3": "ReadyForDownload"
                            },
                            "description": "The {Roblox.Api.Develop.Models.MonthlyRevenueReportStatus.RevenueReportStatus} for the given month and year.",
                            "type": "string"
                        },
                        "year": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "The year for which the revenue report status is computed.",
                            "type": "integer"
                        },
                        "month": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "The month for which the revenue report status is computed",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "14: The feature is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/teamcreate/memberships
```json
{
    "Method": "GET",
    "Description": "List of users allowed to TeamCreate a universe.",
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
            "description": "TeamCreate membership grant date",
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
            "description": "",
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
                                    "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                    "properties": {
                                        "username": {
                                            "type": "string"
                                        },
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
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "displayName": {
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
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.TeamCreateDisabled}"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Removes a user from a TeamCreate permissions list.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for a TeamCreate membership",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The id of the user.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.TeamCreateDisabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUniverse} OR {Roblox.Api.Develop.ResponseEnums.TeamCreateErrors.InvalidUser}"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/universes
```json
{
    "Method": "GET",
    "Description": "Gets a list of universes for the authenticated user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "boolean",
            "name": "isArchived",
            "description": "Whether or not to return archived games.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by universeId",
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
            "description": "",
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
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created {System.DateTime}",
                                            "type": "string"
                                        },
                                        "description": {
                                            "description": "The description of the universe",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "The id of the user or group that created this universe.",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "isActive": {
                                            "description": "Is this universe active",
                                            "type": "boolean"
                                        },
                                        "privacyType": {
                                            "description": "The universe's privacy type.",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The updated {System.DateTime}",
                                            "type": "string"
                                        },
                                        "isArchived": {
                                            "description": "Is this universe archived",
                                            "type": "boolean"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The universe's root place id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "The name of the creator of the universe.",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "The creator type, either \"User\" or \"Group\"",
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
            "description": "cursor is not valid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/places/{placeId}/stats/{type}
```json
{
    "Method": "GET",
    "Description": "Get statistics data for a place.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "type",
            "enum": {
                "1": "Revenue",
                "2": "RevenuePerVisit",
                "3": "AverageVisitLength",
                "4": "Visits"
            },
            "required": true,
            "description": "The data type."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "granularity",
            "enum": {
                "1": "Hourly",
                "2": "Daily",
                "3": "Monthly"
            },
            "required": true,
            "description": "The {Roblox.Api.Develop.Models.StatisticsDataGranularity}."
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "divisionType",
            "enum": {
                "1": "Device",
                "2": "Age"
            },
            "description": "Optional division type for the data.",
        },
        "5": {
            "in": "query",
            "type": "string",
            "name": "startTime",
            "description": "Optional time of first sample.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "name": "endTime",
            "description": "Optional time of last sample.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for statistics about a place",
                    "properties": {
                        "dataGranularity": {
                            "type": "string",
                            "enum": {
                                "1": "Hourly",
                                "2": "Daily",
                                "3": "Monthly"
                            }
                        },
                        "startTime": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "endTime": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "placeId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "data": {
                            "additionalProperties": {
                                "$ref": {
                                    "type": "object",
                                    "description": "The response model for a statistics data range inside of an {The response model for statistics about a place}.",
                                    "properties": {
                                        "data": {
                                            "readOnly": true,
                                            "type": "object",
                                            "additionalProperties": {
                                                "type": "number",
                                                "format": "double"
                                            },
                                            "description": "Samples by timestamp"
                                        },
                                        "type": {
                                            "type": "string",
                                            "description": "The data's subtype, e.g. the computer line of a revenue graph",
                                            "readOnly": true
                                        }
                                    }
                                }
                            },
                            "type": "object"
                        },
                        "dataType": {
                            "type": "string",
                            "enum": {
                                "1": "Revenue",
                                "2": "RevenuePerVisit",
                                "3": "AverageVisitLength",
                                "4": "Visits"
                            }
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: Not authorized to perform this action."
        },
        "404": {
            "description": "1: The place is invalid.\r\n3: Too many data points requested.\r\n4: The requested data type is not known."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/revenue-reports
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
        }
    },
    "Responses": {
        "403": {
            "description": "3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for revenue stats about a universe.",
                    "properties": {
                        "monthlyRevenueReportStatusList": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model for returning revenue stats.",
                                    "properties": {
                                        "RevenueReportStatus": {
                                            "readOnly": true,
                                            "enum": {
                                                "1": "NotGenerated",
                                                "2": "Queued",
                                                "3": "ReadyForDownload"
                                            },
                                            "description": "The {Roblox.Api.Develop.Models.MonthlyRevenueReportStatus.RevenueReportStatus} for the given month and year.",
                                            "type": "string"
                                        },
                                        "year": {
                                            "readOnly": true,
                                            "format": "int32",
                                            "description": "The year for which the revenue report status is computed.",
                                            "type": "integer"
                                        },
                                        "month": {
                                            "readOnly": true,
                                            "format": "int32",
                                            "description": "The month for which the revenue report status is computed",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "503": {
            "description": "14: The feature is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/activate
```json
{
    "Method": "POST",
    "Description": "Activates a universes.",
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
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe.\r\n6: The root place for this universe is under review and can not be activated.\r\n7: Creator already has the maximum number of places active."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n2: This universe does not have a root place."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/plugins/{pluginId}
```json
{
    "Method": "PATCH",
    "Description": "Updates a plugin.",
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
            "name": "pluginId",
            "format": "int64",
            "required": true,
            "description": "The id of the plugin."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating a plugin.",
                    "properties": {
                        "commentsEnabled": {
                            "description": "Whether or not comments should be enabled.",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The new plugin name.",
                            "type": "string"
                        },
                        "description": {
                            "description": "The new plugin description.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {A request model for updating a plugin.}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: Insufficient permissions."
        },
        "400": {
            "description": "5: Description too long.\r\n6: Text moderated.\r\n7: Invalid name.\r\n8: The request body is missing."
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
            "description": "3: The id is invalid."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/statistic-reports/{yearDashMonth}/generate
```json
{
    "Method": "POST",
    "Description": "",
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
            "required": true
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "yearDashMonth",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n10: Report name is invalid: "
        },
        "409": {
            "description": "12: Invalid report state for this operation: "
        },
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "404": {
            "description": "11: No report found by this name: "
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/universes/{universeId}/context-permissions
```json
{
    "Method": "GET",
    "Description": "Returns list of granted and declined permissions related to the universe with the id universeId for authenticated user specified in the request context",
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
                    "type": "object",
                    "description": "A model containing information about a universe permissions",
                    "properties": {
                        "canManage": {
                            "description": "Determines whether or not consumer can manage the target universe",
                            "type": "boolean"
                        },
                        "canCloudEdit": {
                            "description": "Determines whether or not consumer can cloud the target universe\r\nThis is only nullable/optional in the context of https://develop.roblox.com/docs#!/Universes/get_v1_universes_universeId_context_permissions endpoint which is consumed only internally. It should be computed and set for all other usages.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/packages/available-permission-actions
```json
{
    "Method": "GET",
    "Description": "Returns a list of available permission actions.",
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
                                "type": "string"
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


## /v1/user/studiodata
```json
{
    "Method": "POST",
    "Description": "Saves a JSON object to persistent storage.",
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
            "name": "data",
            "required": true,
            "schema": {
                "type": "object"
            },
            "description": "The data."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "clientKey",
            "description": "A Key to save this data under. Optional.",
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
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "No data was sent or the data could not be parsed as JSON"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Retrieves a JSON object from persistant storage.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "clientKey",
            "description": "A Key to find this data under. Optional.",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "type": "object"
            }
        },
        "204": {
            "description": "No data was found.",
            "schema": {
                "type": "object"
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


# <b>Develop Api v2</b>

## /v2/universes/{universeId}/permissions_batched
```json
{
    "Method": "POST",
    "Description": "Create one or more new permissions towards a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
        },
        "2": {
            "in": "body",
            "name": "permissions",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "Action": {
                                "description": "Gets or sets the permitted action, such as 'EDIT' or 'VIEW.'",
                                "type": "string"
                            },
                            "SubjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Gets or sets the type of the subject, such as 'User' or 'Group.'",
                                "type": "string"
                            },
                            "SubjectId": {
                                "description": "Gets or sets the ID of the subject.",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "Array of {Roblox.Api.Develop.Models.UniversePermissionModel}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n15: The user is not authorized to perform this action."
        },
        "400": {
            "description": "2: The request body is missing.\r\n3: The resource type is missing.\r\n5: Invalid resource ID.\r\n8: The action is missing.\r\n9: The subject type is missing.\r\n10: Invalid subject type.\r\n11: The subject ID is missing.\r\n12: Invalid subject ID."
        },
        "409": {
            "description": "13: The permission already exists."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "type": "integer",
                                "format": "int32"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "1: PermissionResolution service exception."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Remove one or more permissions towards a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
        },
        "2": {
            "in": "body",
            "name": "permissions",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "Action": {
                                "description": "Gets or sets the permitted action, such as 'EDIT' or 'VIEW.'",
                                "type": "string"
                            },
                            "SubjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Gets or sets the type of the subject, such as 'User' or 'Group.'",
                                "type": "string"
                            },
                            "SubjectId": {
                                "description": "Gets or sets the ID of the subject.",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "Array of {Roblox.Api.Develop.Models.UniversePermissionModel}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n15: The user is not authorized to perform this action."
        },
        "400": {
            "description": "2: The request body is missing.\r\n2: The request body is missing.\r\n3: The resource type is missing.\r\n4: The resource ID is missing.\r\n5: Invalid resource ID.\r\n8: The action is missing.\r\n9: The subject type is missing.\r\n10: Invalid subject type.\r\n11: The subject ID is missing."
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
                                "type": "integer",
                                "format": "int32"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "14: The permission doesn't exist."
        },
        "503": {
            "description": "1: PermissionResolution service exception."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/universes/{universeId}/symbolic-links
```json
{
    "Method": "GET",
    "Description": "Gets all packages existing for the places in a specified universe, sorted by Name and ID",
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
            "description": "The id of the universe."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by the names and ids of the packages.",
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
                                    "properties": {
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
            "description": "11: Authenticated user does not have read permissions or UseView package permission."
        },
        "404": {
            "description": "9: Game does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/places/{placeId}
```json
{
    "Method": "PATCH",
    "Description": "Updates the place configuration for the place with the id placeId",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id for the place to be updated."
        },
        "2": {
            "in": "body",
            "name": "configuration",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place to be configured",
                    "properties": {
                        "maxPlayerCount": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "socialSlotType": {
                            "type": "string"
                        },
                        "allowCopying": {
                            "type": "boolean"
                        },
                        "customSocialSlotsCount": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "description": {
                            "type": "string"
                        },
                        "name": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place",
                    "properties": {
                        "universeId": {
                            "format": "int64",
                            "description": "Returns the id of the place's universe, or null - if the place is not part of a universe.",
                            "type": "integer"
                        },
                        "socialSlotType": {
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "Returns the place id.",
                            "type": "integer"
                        },
                        "isRootPlace": {
                            "description": "Returns whether this place is the root place.",
                            "type": "boolean"
                        },
                        "maxPlayerCount": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "name": {
                            "description": "Returns the place name.",
                            "type": "string"
                        },
                        "allowCopying": {
                            "type": "boolean"
                        },
                        "currentSavedVersion": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "description": {
                            "description": "Returns the place description.",
                            "type": "string"
                        },
                        "customSocialSlotsCount": {
                            "type": "integer",
                            "format": "int32"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Authenticated user is not authorized to manage this place.\r\n0: Token Validation Failed"
        },
        "404": {
            "description": "{placeId} Place not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the place configuration for the place with the id placeId",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The place id for the place to be updated."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing information about a place",
                    "properties": {
                        "universeId": {
                            "format": "int64",
                            "description": "Returns the id of the place's universe, or null - if the place is not part of a universe.",
                            "type": "integer"
                        },
                        "socialSlotType": {
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "Returns the place id.",
                            "type": "integer"
                        },
                        "isRootPlace": {
                            "description": "Returns whether this place is the root place.",
                            "type": "boolean"
                        },
                        "maxPlayerCount": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "name": {
                            "description": "Returns the place name.",
                            "type": "string"
                        },
                        "allowCopying": {
                            "type": "boolean"
                        },
                        "currentSavedVersion": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "description": {
                            "description": "Returns the place description.",
                            "type": "string"
                        },
                        "customSocialSlotsCount": {
                            "type": "integer",
                            "format": "int32"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "Authenticated user is not authorized to manage this place."
        },
        "404": {
            "description": "{placeId} Place not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v2/assets/{id}/versions
```json
{
    "Method": "GET",
    "Description": "Retrieves asset information for the specified asset ID. The authenticated user must be able to manage the asset 
or granted by package permission.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "id",
            "format": "int64",
            "required": true,
            "description": "The ID of the asset.{Roblox.IAsset}"
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "description": "The ID of the place.{Roblox.Platform.Assets.IPlace}",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sort by version number, default is desc.",
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
                                    "type": "object",
                                    "description": "Model of an asset version.",
                                    "properties": {
                                        "creatingUniverseId": {
                                            "format": "int64",
                                            "description": "ID of the universe this asset version was created in.",
                                            "type": "integer"
                                        },
                                        "assetId": {
                                            "format": "int64",
                                            "description": "The ID of the asset.",
                                            "type": "integer"
                                        },
                                        "isPublished": {
                                            "description": "Indicates if this version is / was published.\r\nThis property is available on /v1/{assetId}/saved-versions.",
                                            "type": "boolean"
                                        },
                                        "assetVersionNumber": {
                                            "format": "int32",
                                            "description": "The version number.",
                                            "type": "integer"
                                        },
                                        "isEqualToCurrentPublishedVersion": {
                                            "description": "Indicates if this version is same to current published version.\r\nThis property is available on /v1/{assetId}/published-versions and /v1/{assetId}/version/{versionNumber}.",
                                            "type": "boolean"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The created date of this asset version.",
                                            "type": "string"
                                        },
                                        "creatorTargetId": {
                                            "format": "int64",
                                            "description": "ID of the asset version creator.",
                                            "type": "integer"
                                        },
                                        "creatorType": {
                                            "description": "Type of the asset version creator.",
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


## /v2/universes/{universeId}/configuration
```json
{
    "Method": "PATCH",
    "Description": "Update universe settings for an owned universe.
V2 Contains data for avatar scale and asset override.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universeId."
        },
        "2": {
            "in": "body",
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings patch requests",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future.",
                                "properties": {
                                    "IsThirdPartyTeleportAllowed": {
                                        "description": "Indicates if it allows game server to teleport to other games out of your universe.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyPurchaseAllowed": {
                                        "description": "Indicates if it allows script execution or insertion of models not under your control.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyAssetAllowed": {
                                        "description": "Indicates if it allows players to purchase items not created by you.",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future."
                        },
                        "universeAvatarMinScales": {
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
                            },
                            "description": "A collection of minimum scales for the universe's avatars."
                        },
                        "universeAvatarAssetOverrides": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetID": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetTypeID": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "isPlayerChoice": {
                                            "type": "boolean"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A list of avatar asset overrides."
                        },
                        "studioAccessToApisAllowed": {
                            "description": "Whether Studio can access data stores of this universe.",
                            "type": "boolean"
                        },
                        "allowPrivateServers": {
                            "type": "boolean"
                        },
                        "universeAvatarMaxScales": {
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
                            },
                            "description": "A collection of maximum scales for the universe's avatars."
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe.",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The name of the universe.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "privateServerPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "description": {
                            "description": "The description of the universe.",
                            "type": "string"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning type is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Api.Develop.Models.UniverseSettingsRequest} model."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not authorized to configure this universe.\r\n14: You are not authorized to sell games."
        },
        "400": {
            "description": "1: The universe does not exist.\r\n3: Invalid UniverseAvatarType.\r\n4: Invalid UniverseScaleType.\r\n5: Invalid UniverseAnimationType.\r\n6: Invalid UniverseCollisionType.\r\n7: New universe name or description has been rejected.\r\n8: New universe name is too long.\r\n10: Invalid UniverseBodyType.\r\n11: Invalid UniverseJointPositioningType.\r\n12: The universe has no root place.\r\n13: At least one playable device must be provided.\r\n15: Price is required when isForSale is true.\r\n16: This game cannot be offered for sale because it is not public.\r\n17: This game cannot be offered for sale because it has private servers enabled.\r\n18: The game price is outside of the allowed range.\r\n19: Invalid genre.\r\n20: The request body is missing.\r\n21: Invalid device type.\r\n22: Invalid asset type.\r\n23: Invalid value, the min must be less than or equal to the max\r\n24: Invalid scale value"
        },
        "409": {
            "description": "9: Failed to shutdown all intances of game after changing AvatarType. The change has been reverted."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings controller responses",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future.",
                                "properties": {
                                    "IsThirdPartyTeleportAllowed": {
                                        "description": "Indicates if it allows game server to teleport to other games out of your universe.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyPurchaseAllowed": {
                                        "description": "Indicates if it allows script execution or insertion of models not under your control.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyAssetAllowed": {
                                        "description": "Indicates if it allows players to purchase items not created by you.",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future."
                        },
                        "universeAvatarMinScales": {
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
                            },
                            "description": "A collection of minimum scales for the universe's avatars."
                        },
                        "universeAvatarAssetOverrides": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetID": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetTypeID": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "isPlayerChoice": {
                                            "type": "boolean"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A collection of avatar asset settings allowed by the universe."
                        },
                        "studioAccessToApisAllowed": {
                            "description": "Whether Studio can access data stores of this universe.",
                            "type": "boolean"
                        },
                        "universeAvatarMaxScales": {
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
                            },
                            "description": "A collection of maximum scales for the universe's avatars."
                        },
                        "allowPrivateServers": {
                            "type": "boolean"
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe",
                            "type": "boolean"
                        },
                        "description": {
                            "description": "The universe description.",
                            "type": "string"
                        },
                        "name": {
                            "description": "The universe name.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "privateServerPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The universe Id.",
                            "type": "integer"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get settings for an owned universe. 
V2 Contains data for avatar scale and asset override.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for UniverseSettings controller responses",
                    "properties": {
                        "universeCollisionType": {
                            "enum": {
                                "1": "InnerBox",
                                "2": "OuterBox"
                            },
                            "description": "What type of collisions are used by the universe.",
                            "type": "string"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price of the game, in Robux.",
                            "type": "integer"
                        },
                        "genre": {
                            "enum": {
                                "1": "All",
                                "2": "Tutorial",
                                "3": "Scary",
                                "4": "TownAndCity",
                                "5": "War",
                                "6": "Funny",
                                "7": "Fantasy",
                                "8": "Adventure",
                                "9": "SciFi",
                                "10": "Pirate",
                                "11": "FPS",
                                "12": "RPG",
                                "13": "Sports",
                                "14": "Ninja",
                                "15": "WildWest"
                            },
                            "description": "Game genre.",
                            "type": "string"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future.",
                                "properties": {
                                    "IsThirdPartyTeleportAllowed": {
                                        "description": "Indicates if it allows game server to teleport to other games out of your universe.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyPurchaseAllowed": {
                                        "description": "Indicates if it allows script execution or insertion of models not under your control.",
                                        "type": "boolean"
                                    },
                                    "IsThirdPartyAssetAllowed": {
                                        "description": "Indicates if it allows players to purchase items not created by you.",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Plugin permissions for third party.\r\nCurrently, this is a part of configuration, but will be separated into permission system in the future."
                        },
                        "universeAvatarMinScales": {
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
                            },
                            "description": "A collection of minimum scales for the universe's avatars."
                        },
                        "universeAvatarAssetOverrides": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetID": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assetTypeID": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "isPlayerChoice": {
                                            "type": "boolean"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A collection of avatar asset settings allowed by the universe."
                        },
                        "studioAccessToApisAllowed": {
                            "description": "Whether Studio can access data stores of this universe.",
                            "type": "boolean"
                        },
                        "universeAvatarMaxScales": {
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
                            },
                            "description": "A collection of maximum scales for the universe's avatars."
                        },
                        "allowPrivateServers": {
                            "type": "boolean"
                        },
                        "playableDevices": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "List of device types this game can be played on."
                        },
                        "isFriendsOnly": {
                            "description": "Whether game access is limited to friends for user-owned games or group members for group-owned games.",
                            "type": "boolean"
                        },
                        "universeAvatarType": {
                            "enum": {
                                "1": "MorphToR6",
                                "2": "PlayerChoice",
                                "3": "MorphToR15"
                            },
                            "description": "Which avatar types are allowed in the universe.",
                            "type": "string"
                        },
                        "isArchived": {
                            "description": "Archive status of the universe",
                            "type": "boolean"
                        },
                        "description": {
                            "description": "The universe description.",
                            "type": "string"
                        },
                        "name": {
                            "description": "The universe name.",
                            "type": "string"
                        },
                        "isForSale": {
                            "description": "Whether the game is offered for sale.",
                            "type": "boolean"
                        },
                        "privateServerPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The universe Id.",
                            "type": "integer"
                        },
                        "universeJointPositioningType": {
                            "enum": {
                                "1": "Standard",
                                "2": "ArtistIntent"
                            },
                            "description": "What avatar joint positioning is allowed by the universe.",
                            "type": "string"
                        },
                        "universeAnimationType": {
                            "enum": {
                                "1": "Standard",
                                "2": "PlayerChoice"
                            },
                            "description": "Whether custom animations are allowed in the universe.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "2: You are not authorized to configure this universe."
        },
        "400": {
            "description": "1: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/universes/{universeId}/shutdown
```json
{
    "Method": "POST",
    "Description": "Shuts down all game instances for a universe.",
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
        "403": {
            "description": "0: Token Validation Failed\r\n3: You are not authorized to configure this universe."
        },
        "404": {
            "description": "1: The universe does not exist."
        },
        "500": {
            "description": "0: Unknown error."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/universes/{universeId}/permissions
```json
{
    "Method": "POST",
    "Description": "Create one or more new permissions towards a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
        },
        "2": {
            "in": "body",
            "name": "permissions",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "Action": {
                                "description": "Gets or sets the permitted action, such as 'EDIT' or 'VIEW.'",
                                "type": "string"
                            },
                            "SubjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Gets or sets the type of the subject, such as 'User' or 'Group.'",
                                "type": "string"
                            },
                            "SubjectId": {
                                "description": "Gets or sets the ID of the subject.",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "Array of {Roblox.Api.Develop.Models.UniversePermissionModel}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The request body is missing.\r\n3: The resource type is missing.\r\n5: Invalid resource ID.\r\n8: The action is missing.\r\n9: The subject type is missing.\r\n10: Invalid subject type.\r\n11: The subject ID is missing.\r\n12: Invalid subject ID."
        },
        "409": {
            "description": "13: The permission already exists."
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
            "description": "1: PermissionResolution service exception."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Remove one or more permissions towards a universe.",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
        },
        "2": {
            "in": "body",
            "name": "permissions",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "Action": {
                                "description": "Gets or sets the permitted action, such as 'EDIT' or 'VIEW.'",
                                "type": "string"
                            },
                            "SubjectType": {
                                "enum": {
                                    "1": "User",
                                    "2": "Group",
                                    "3": "Roleset"
                                },
                                "description": "Gets or sets the type of the subject, such as 'User' or 'Group.'",
                                "type": "string"
                            },
                            "SubjectId": {
                                "description": "Gets or sets the ID of the subject.",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "Array of {Roblox.Api.Develop.Models.UniversePermissionModel}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The request body is missing.\r\n2: The request body is missing.\r\n3: The resource type is missing.\r\n4: The resource ID is missing.\r\n5: Invalid resource ID.\r\n8: The action is missing.\r\n9: The subject type is missing.\r\n10: Invalid subject type.\r\n11: The subject ID is missing."
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
            "description": "14: The permission doesn't exist."
        },
        "503": {
            "description": "1: PermissionResolution service exception."
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get all permissions for a universe.",
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
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
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
                                "additionalProperties": {
                                    "type": "string"
                                },
                                "type": "object"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "15: The user is not authorized to perform this action."
        },
        "400": {
            "description": "5: Invalid resource ID."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/universes/{universeId}/places
```json
{
    "Method": "GET",
    "Description": "Gets a page of places for a universe sorted by name.",
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
            "type": "boolean",
            "name": "extendedSettings",
            "description": "If additional settings should be returned including current version and instance constraints",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by place name",
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
                                    "type": "object",
                                    "description": "A model containing information about a place",
                                    "properties": {
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
        "500": {
            "description": "0: Unknown error."
        },
        "400": {
            "description": "1: The universe does not exist."
        },
        "404": {
            "description": "1: The universe does not exist."
        }
    },
    "Internal": true
}
```
<hr>


## /v2/universes/{universeId}/users-have-permission/{permissionAction}
```json
{
    "Method": "GET",
    "Description": "Retrieve specified permissions on the universe resource if one exists.",
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
            "description": "Id of {Roblox.Platform.Universes.IUniverse}"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "permissionAction",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "Id of {!:IUser}",
            "name": "userIds"
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
                                    "description": "Representation of user permission check.",
                                    "properties": {
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userHasPermission": {
                                            "type": "boolean"
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
            "description": "5: Invalid resource ID.\r\n8: The action is missing.\r\n12: Invalid subject ID.\r\n16: The maximum number of permission checks has been exceeded."
        }
    },
    "Internal": true
}
```
<hr>


