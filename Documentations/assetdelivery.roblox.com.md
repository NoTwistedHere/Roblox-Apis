# <b>Asset Delivery Api v1</b>

## /v1/assetHash/{hash}
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
            "type": "string",
            "name": "hash",
            "required": true
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "8": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/assetId/{assetId}
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
            "name": "assetId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "8": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/alias/{alias}
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
            "type": "string",
            "name": "alias",
            "required": true
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "8": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/asset
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
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "id",
            "format": "int64",
        },
        "8": {
            "in": "query",
            "type": "integer",
            "name": "userAssetId",
            "format": "int64",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "assetVersionId",
            "format": "int64",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "version",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "13": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "14": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "15": {
            "in": "query",
            "type": "string",
            "name": "serverplaceid",
        },
        "16": {
            "in": "query",
            "type": "string",
            "name": "assetName",
        },
        "17": {
            "in": "query",
            "type": "string",
            "name": "hash",
        },
        "18": {
            "in": "query",
            "type": "string",
            "name": "marAssetHash",
        },
        "19": {
            "in": "query",
            "type": "string",
            "name": "marCheckSum",
        },
        "20": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        },
        "21": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "Location": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "Request": {
                            "readOnly": true,
                            "type": "object"
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


## /v1/userAssetId/{userAssetId}
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
            "name": "userAssetId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "8": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/marAssetHash/{marAssetHash}/marCheckSum/{marCheckSum}
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
            "type": "string",
            "name": "marAssetHash",
            "required": true
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "marCheckSum",
            "required": true
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "4": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "8": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "9": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "14": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/assetId/{assetId}/version/{version}
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
            "name": "assetId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "version",
            "format": "int32",
            "required": true
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "4": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "8": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "9": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "14": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


## /v1/assets/batch
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                "items": {
                    "$ref": {
                        "properties": {
                            "universeId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "assetName": {
                                "type": "string"
                            },
                            "userAssetId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "placeId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "assetType": {
                                "type": "string"
                            },
                            "assetId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "modulePlaceId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "clientInsert": {
                                "type": "boolean"
                            },
                            "accept": {
                                "type": "string"
                            },
                            "assetVersionId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "serverPlaceId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "assetFormat": {
                                "type": "string"
                            },
                            "scriptInsert": {
                                "type": "boolean"
                            },
                            "version": {
                                "type": "integer",
                                "format": "int32"
                            },
                            "roblox-assetFormat": {
                                "type": "string"
                            },
                            "encoding": {
                                "type": "string"
                            },
                            "hash": {
                                "type": "string"
                            },
                            "requestId": {
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "name": "assetRequestItems"
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Browser-Asset-Request",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "IsHashDynamic": {
                                "type": "boolean"
                            },
                            "IsArchived": {
                                "readOnly": true,
                                "type": "boolean"
                            },
                            "Errors": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "Message": {
                                                "type": "string"
                                            },
                                            "Code": {
                                                "type": "integer",
                                                "format": "int32"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array"
                            },
                            "Location": {
                                "type": "string"
                            },
                            "IsCopyrightProtected": {
                                "type": "boolean"
                            },
                            "RequestId": {
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            }
        }
    },
    "Internal": false
}
```
<hr>


## /v1/assetVersionId/{assetVersionId}
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
            "name": "assetVersionId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Accept-Encoding",
        },
        "3": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
        },
        "4": {
            "in": "header",
            "type": "string",
            "name": "AssetType",
        },
        "5": {
            "in": "header",
            "type": "string",
            "name": "Accept",
        },
        "6": {
            "in": "header",
            "type": "string",
            "name": "AssetFormat",
        },
        "7": {
            "in": "header",
            "type": "string",
            "name": "Roblox-AssetFormat",
        },
        "8": {
            "in": "query",
            "type": "boolean",
            "name": "skipSigningScripts",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "clientInsert",
            "format": "int32",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "scriptinsert",
            "format": "int32",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "modulePlaceId",
            "format": "int64",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "serverplaceid",
            "format": "int64",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "expectedAssetType",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "IsHashDynamic": {
                            "type": "boolean"
                        },
                        "IsArchived": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "Errors": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Message": {
                                            "type": "string"
                                        },
                                        "Code": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Location": {
                            "type": "string"
                        },
                        "IsCopyrightProtected": {
                            "type": "boolean"
                        },
                        "RequestId": {
                            "type": "string"
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


