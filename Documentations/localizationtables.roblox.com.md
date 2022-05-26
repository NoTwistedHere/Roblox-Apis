# <b>LocalizationTables Api v1</b>

## /v1/auto-localization-table/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Ingests entries for auto localization. Only available for game servers.",
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
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": "The game id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "An ingest content request to IngestAutoScrapedContentForGame.",
                    "properties": {
                        "metadata": {
                            "$ref": {
                                "type": "object",
                                "description": "The metadata of an ingest content request.",
                                "properties": {
                                    "placeInformation": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "The place information metadata of an ingest content request.",
                                            "properties": {
                                                "placeId": {
                                                    "format": "int64",
                                                    "description": "The place id of an ingest content request.",
                                                    "type": "integer"
                                                },
                                                "placeVersionNumber": {
                                                    "format": "int32",
                                                    "description": "The place version number of an ingest content request.",
                                                    "type": "integer"
                                                }
                                            }
                                        },
                                        "description": "The place information metadata of an ingest content request."
                                    }
                                }
                            },
                            "description": "The metadata of an ingest content request."
                        },
                        "entries": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "meta": {
                                            "$ref": {
                                                "properties": {
                                                    "sessionId": {
                                                        "format": "uuid",
                                                        "example": "00000000-0000-0000-0000-000000000000",
                                                        "type": "string"
                                                    },
                                                    "text": {
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "osPlatform": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "context": {
                                            "type": "string"
                                        },
                                        "source": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The entries of an ingest content request."
                        }
                    }
                }
            },
            "description": "The request body."
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Game-Id",
            "required": true,
            "description": "The id of the game instance from RCC."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "400": {
            "description": "10: Maximum entries exceeded. Please keep the number of entries per request below the maximum.\r\n13: Request body can't be null\r\n16: Entries can't be null or empty"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{tableId}/language-translation-counts
```json
{
    "Method": "GET",
    "Description": "Gets the language translation counts for the specified table.
The languages to retrieve must be provided.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tableId",
            "required": true,
            "description": "The table id"
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "required": true,
            "description": "The locales corresponding to the language translation counts to retrieve. This will return 0 for the translation count of locales that do not exist for the given table.",
            "name": "locales"
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "description": "The game id",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for GetLanguageTranslationCountsForTable.",
                    "properties": {
                        "tableId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "Id of the table that the translation counts were retrieved for.",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "languageTranslationCounts": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Model containing a translation count for a language and relevant language information.",
                                    "properties": {
                                        "locale": {
                                            "description": "The locale of the language.",
                                            "type": "string"
                                        },
                                        "translationCount": {
                                            "format": "int32",
                                            "description": "The translation count value.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The translation counts with relevant language information."
                        },
                        "gameId": {
                            "format": "int64",
                            "description": "Id of the game that the translation counts were retrieved for.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "2: You do not have permission to get this table.\r\n3: Invalid table id.\r\n46: Locales can't be null or empty"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/auto-localization-table/games/{gameId}/auto-scrape-cleanup-request
```json
{
    "Method": "POST",
    "Description": "Enqueues an event to flush the auto scraped entries which doesn't have translations.",
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
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": "The id of the game."
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "maxAgeForFlush": {
                            "description": "The time range to remove entries from. Following ISO 8601 Durations format",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "14: Invalid game id\r\n31: You do not have permission to flush auto scraped entries asset for this game.\r\n32: LocalizationTable is not available for the game.\r\n34: Actor provided is invalid"
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
        "429": {
            "description": "33: Too many attempts to flush the game.Please try again later."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{tableId}/entry-count
```json
{
    "Method": "GET",
    "Description": "Gets the number of entries in the specified table",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tableId",
            "required": true,
            "description": "The table id"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "description": "The game id",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "id": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "entryCount": {
                            "type": "integer",
                            "format": "int32"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "2: You do not have permission to get this table.\r\n3: Invalid table id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/auto-localization-table/games/{gameId}/assets-generation-request
```json
{
    "Method": "POST",
    "Description": "Generates localization asset of a game.",
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
            "description": "The game id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "3: Invalid table id.\r\n14: Invalid game id\r\n29: You do not have permission to generate asset for this table.\r\n32: LocalizationTable is not available for the game.\r\n34: Actor provided is invalid"
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
            "description": "24: Too many attempts.Please try again later."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{tableId}/entries
```json
{
    "Method": "GET",
    "Description": "Gets a batch of entries for a table.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tableId",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "If null, there are no more entries in the table and you've reached the last page.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "description": "",
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
                                        "translations": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "locale": {
                                                            "type": "string"
                                                        },
                                                        "translationText": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "metadata": {
                                            "$ref": {
                                                "properties": {
                                                    "gameLocations": {
                                                        "items": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "path": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "array"
                                                    },
                                                    "example": {
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{assetId}
```json
{
    "Method": "GET",
    "Description": "Get table information by the assetId of the table.",
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
            "description": "The asset id associated with the table."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "ownerId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "name": {
                            "type": "string"
                        },
                        "id": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "ownerType": {
                            "type": "string",
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            }
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "12: Invalid asset id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/limits
```json
{
    "Method": "GET",
    "Description": "Get limits for translation table entries operations",
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
                        "entryOperationLimits": {
                            "$ref": {
                                "properties": {
                                    "maxSourceLength": {
                                        "format": "int32",
                                        "description": "Maximum character limit for entry source text",
                                        "type": "integer"
                                    },
                                    "maxKeyLength": {
                                        "format": "int32",
                                        "description": "Maximum character limit for entry key",
                                        "type": "integer"
                                    },
                                    "maxExampleLength": {
                                        "format": "int32",
                                        "description": "Maximum character limit for entry example",
                                        "type": "integer"
                                    },
                                    "maxGameLocationPathLength": {
                                        "format": "int32",
                                        "description": "Maximum character limit for game location path",
                                        "type": "integer"
                                    },
                                    "maxContextLength": {
                                        "format": "int32",
                                        "description": "Maximum character limit for entry context",
                                        "type": "integer"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Settings for entry operation limits"
                        },
                        "tableOperationLimits": {
                            "$ref": {
                                "properties": {
                                    "maxEntriesPerUpdate": {
                                        "format": "int32",
                                        "description": "Maximum number of entries for a patch request",
                                        "type": "integer"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Settings for a localization table operation limits"
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


## /v1/localization-table/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata for localization UI",
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
                        "isBulkUploadFeatureEnabled": {
                            "description": "Is bulk upload feature enabled",
                            "type": "boolean"
                        },
                        "isUntranslatedFilterEnabled": {
                            "description": "Is untranslated filter on UI is enabled",
                            "type": "boolean"
                        },
                        "isAutomaticTranslationFilterEnabled": {
                            "description": "Is filter for automatic translations on UI is enabled",
                            "type": "boolean"
                        },
                        "isCsvDownloadEnabled": {
                            "description": "Is CSV download feature enabled",
                            "type": "boolean"
                        },
                        "isTranslationManagementRedirectionEnabled": {
                            "description": "Is access to translation metadata feature enabled",
                            "type": "boolean"
                        },
                        "isAccessToTranslationMetaDataEnabled": {
                            "description": "Is access to translation metadata feature enabled",
                            "type": "boolean"
                        }
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


## /v1/localization-table/available-languages
```json
{
    "Method": "GET",
    "Description": "Gets the supported language codes that can be used by localization tables.",
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
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "nativeName": {
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
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables
```json
{
    "Method": "POST",
    "Description": "Creates a Localization Table with the given data.",
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
                        "ownerType": {
                            "type": "string",
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            }
                        },
                        "name": {
                            "type": "string"
                        },
                        "ownerId": {
                            "type": "integer",
                            "format": "int64"
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
                    "properties": {
                        "id": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
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
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{tableId}/entries/translation-history
```json
{
    "Method": "POST",
    "Description": "Gets the translation history for each entry passed in.",
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
            "name": "tableId",
            "required": true,
            "description": "The entries' tableId."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "locale": {
                            "type": "string"
                        },
                        "entries": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model that contains an entry identifier and an associated cursor for paged lookups.",
                                    "properties": {
                                        "sortOrder": {
                                            "enum": {
                                                "1": "Asc",
                                                "2": "Desc"
                                            },
                                            "description": "In which order the data is sorted.",
                                            "type": "string"
                                        },
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "An identifier for an entry."
                                        },
                                        "cursor": {
                                            "description": "The location to begin our query.",
                                            "type": "string"
                                        },
                                        "count": {
                                            "format": "int32",
                                            "description": "The translation history count to get.",
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
            },
            "description": "A request body containing all relevant data for entry history lookup."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "description": "The game id.",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to get this table."
        },
        "400": {
            "description": "3: Invalid table id.\r\n13: Request body can't be null\r\n16: Entries can't be null or empty\r\n35: The entries provided are invalid\r\n37: Invalid locale code.\r\n38: Invalid entry identifier.\r\n39: Count should be at least 1.\r\n45: Invalid exclusive start id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for GetTableEntriesTranslationHistory.",
                    "properties": {
                        "tableId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The entries' tableId.",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "failedEntries": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "count": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "error": {
                                            "$ref": {
                                                "properties": {
                                                    "errorCode": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "errorMessage": {
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
                            "type": "array",
                            "description": "The failed entries."
                        },
                        "locale": {
                            "description": "The locale of the translations.",
                            "type": "string"
                        },
                        "entries": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The identifier for the entry whose history was served."
                                        },
                                        "history": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "A model containing a translation, translator, and translation time.",
                                                    "properties": {
                                                        "created": {
                                                            "format": "date-time",
                                                            "description": "The time the translation was provided.",
                                                            "type": "string"
                                                        },
                                                        "translator": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "id": {
                                                                        "type": "integer",
                                                                        "format": "int64"
                                                                    },
                                                                    "agentType": {
                                                                        "type": "string",
                                                                        "enum": {
                                                                            "1": "User",
                                                                            "2": "Automation"
                                                                        }
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "description": "The agent that provided the translation. Can be null if recorded before history auditing was enabled."
                                                        },
                                                        "translationText": {
                                                            "description": "The translation provided by the translator.",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "A batch of TranslationHistory for the given entry identifier."
                                        },
                                        "nextCursor": {
                                            "description": "The cursor to send up on the next request if more history data is required.",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The entries with their identifier, translation history, and next cursor."
                        }
                    }
                }
            }
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/localization-table/tables/{tableId}
```json
{
    "Method": "PATCH",
    "Description": "Updates the tables contents based on what is provided.",
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
            "name": "tableId",
            "required": true,
            "description": "The table guid for the table to update."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "name": {
                            "type": "string"
                        },
                        "entries": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "translations": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "locale": {
                                                            "type": "string"
                                                        },
                                                        "delete": {
                                                            "type": "boolean"
                                                        },
                                                        "translationText": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "delete": {
                                            "type": "boolean"
                                        },
                                        "metadata": {
                                            "$ref": {
                                                "properties": {
                                                    "gameLocations": {
                                                        "items": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "path": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "array"
                                                    },
                                                    "example": {
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
            },
            "description": "The metadata object is optional."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "description": "The game id.",
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "3: Invalid table id.\r\n4: Table does not exist.\r\n6: You do not have permission to create this table.\r\n10: Maximum entries exceeded. Please keep the number of entries per request below the maximum.\r\n13: Request body can't be null"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "failedEntriesAndTranslations": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "translations": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "locale": {
                                                            "type": "string"
                                                        },
                                                        "translationText": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "identifier": {
                                            "$ref": {
                                                "properties": {
                                                    "source": {
                                                        "type": "string"
                                                    },
                                                    "context": {
                                                        "type": "string"
                                                    },
                                                    "key": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "error": {
                                            "$ref": {
                                                "properties": {
                                                    "errorCode": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "errorMessage": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "metadata": {
                                            "$ref": {
                                                "properties": {
                                                    "gameLocations": {
                                                        "items": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "path": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "array"
                                                    },
                                                    "example": {
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
    "Internal": true
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get table information by the id of the table.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tableId",
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
                        "ownerId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "name": {
                            "type": "string"
                        },
                        "id": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "ownerType": {
                            "type": "string",
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            }
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "3: Invalid table id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


