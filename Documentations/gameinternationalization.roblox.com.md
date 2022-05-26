# <b>GameInternationalization Api v1</b>

## /v1/autolocalization/games/{gameId}/autoscrape-cleanup-request
```json
{
    "Method": "POST",
    "Description": "Enqueues an event to Flush the autoscraped entries which doesnt have translations",
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
}
```
<hr>


## /v1/automatic-translation/games/{gameId}/quota
```json
{
    "Method": "GET",
    "Description": "Returns the automatic translation quota info for a game.
The user must still have proper permissions for the game to get this info.",
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
            "description": "18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for getting the automatic translation quota info of a game.",
                    "properties": {
                        "monthlyQuota": {
                            "$ref": {
                                "properties": {
                                    "capacity": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "remaining": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "nextRefreshDate": {
                                        "type": "string",
                                        "format": "date-time"
                                    },
                                    "previousRefreshDate": {
                                        "type": "string",
                                        "format": "date-time"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "bankQuota": {
                            "$ref": {
                                "properties": {
                                    "capacity": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "remaining": {
                                        "type": "integer",
                                        "format": "int64"
                                    }
                                },
                                "type": "object"
                            }
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-passes/{gamePassId}/name-description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name and description of a game pass",
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
            "name": "gamePassId",
            "format": "int64",
            "required": true,
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name/description to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating game pass name and description",
                    "properties": {
                        "name": {
                            "description": "Game pass name",
                            "type": "string"
                        },
                        "description": {
                            "description": "Game pass description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating game pass name and description",
                    "properties": {
                        "name": {
                            "description": "Game pass name saved",
                            "type": "string"
                        },
                        "description": {
                            "description": "Game pass description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete localized name and description of a game pass",
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
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name and description to delete"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
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
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-thumbnails/games/{gameId}/language-codes/{languageCode}/images/order
```json
{
    "Method": "POST",
    "Description": "Orders the specified image Ids for the game thumbnails.",
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
            "description": "The game identifier."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for sorting of image Ids for game thumbnails",
                    "properties": {
                        "mediaAssetIds": {
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
            "description": "The request."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n53: Language is not supported for the game."
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
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/automatic-translation/languages/{languageCode}/target-languages
```json
{
    "Method": "GET",
    "Description": "Checks if the requested target languages are allowed for automatic translation based on the source language.
If there are no requested target languages, then all allowed target languages for the source language will be returned.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The source language."
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "description": "Optional target languages. If not passed in, all allowed target languages for the source language will be returned.",
            "name": "targetLanguages",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for getting the automatic translation allowed status of target languages.",
                    "properties": {
                        "targetLanguages": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "languageCode": {
                                            "description": "The language code.",
                                            "type": "string"
                                        },
                                        "isAutomaticTranslationAllowed": {
                                            "description": "Indicates whether or not automatic translation is allowed for the target language.",
                                            "type": "boolean"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The target languages with the automatic translation allowed status.\r\nThe status basically says if automatic translation can be enabled for the source and target."
                        },
                        "sourceLanguage": {
                            "description": "The source language.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "73: Maximum languages exceeded. Please keep the number of languages per request below the maximum.\r\n74: A target language cannot be null or whitespace."
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/icons
```json
{
    "Method": "GET",
    "Description": "Get all icons for a badge",
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
            "description": "The id of the badge"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "The width of the icon to request",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "The height of the icon to request",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "52: Image dimensions are invalid\r\n62: Invalid game badge id"
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Approved",
                                                "2": "PendingReview",
                                                "3": "UnAvailable",
                                                "4": "Rejected",
                                                "5": "Error"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "imageId": {
                                            "type": "string"
                                        },
                                        "languageCode": {
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/player-policies-rcc
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
            "in": "query",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "ipAddress",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "userAgent",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "allowedExternalLinkReferences": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "arePaidRandomItemsRestricted": {
                            "type": "boolean"
                        },
                        "isPaidItemTradingAllowed": {
                            "type": "boolean"
                        },
                        "isSubjectToChinaPolicies": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "17: Feature is disabled"
        },
        "400": {
            "description": "63: Invalid user id\r\n64: Invalid ip address\r\n65: Invalid user agent"
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/name-description
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
            "name": "badgeId",
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
        "503": {
            "description": "17: Feature is disabled"
        },
        "400": {
            "description": "62: Invalid game badge id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/game-icon/games/{gameId}/language-codes/{languageCode}
```json
{
    "Method": "POST",
    "Description": "Update a game's icon",
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
            "description": "The id of the game"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of this icon to update"
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n45: File uploaded does not match known image format\r\n46: File not present in request\r\n53: Language is not supported for the game."
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
            "description": "17: Feature is disabled"
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete a localized icon from a game",
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
            "description": "The id of the game"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the localized icon to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game."
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/name-description/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Updates a game's name and description in multiple languages.",
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
            "name": "request",
            "required": true,
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
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n23: You can't delete translations for source language\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "successOperations": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "description": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "failedOperations": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "errorCode": {
                                            "type": "integer",
                                            "format": "int32"
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
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a game's name and description in all supported languages",
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
            "description": "The id of the game"
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
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
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
            "description": "14: Invalid game id"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/developer-products/{developerProductId}/description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized description of a developer product",
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
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The developer product id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the description to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating developer product description",
                    "properties": {
                        "description": {
                            "description": "Developer product description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating developer product description",
                    "properties": {
                        "description": {
                            "description": "Developer product description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/developer-products/{developerProductId}/name-description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name and description of a developer product",
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
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The developer product id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name and description to Update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating developer product name and description",
                    "properties": {
                        "name": {
                            "description": "Developer product name",
                            "type": "string"
                        },
                        "description": {
                            "description": "Developer product description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating developer product name and description",
                    "properties": {
                        "name": {
                            "description": "Developer product name saved",
                            "type": "string"
                        },
                        "description": {
                            "description": "Developer product description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete localized name and description of a developer product",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The developer product id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name and description to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/developer-products/{developerProductId}/name/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name of a developer product",
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
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The developer product id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating developer product name",
                    "properties": {
                        "name": {
                            "description": "Developer product name",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating developer product name",
                    "properties": {
                        "name": {
                            "description": "Developer product name saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/automatic-translation/games/{gameId}/feature-status
```json
{
    "Method": "GET",
    "Description": "Checks if automatic translation can be enabled for a game.
The user must still have proper permissions for the game to get this info.",
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
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for getting the automatic translation allowed status of a game.",
                    "properties": {
                        "isAutomaticTranslationSwitchesUIEnabled": {
                            "description": "Indicates whether or not automatic translation switches are enabled for the game.",
                            "type": "boolean"
                        },
                        "isAutomaticTranslationAllowed": {
                            "description": "Indicates whether or not automatic translation is allowed for the game.",
                            "type": "boolean"
                        },
                        "gameId": {
                            "format": "int64",
                            "description": "The game id.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "18: You do not have permission to manage this game"
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/icons/language-codes/{languageCode}
```json
{
    "Method": "POST",
    "Description": "Update a badge's icon",
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
            "description": "The id of the badge"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of this icon to update"
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n26: You can't update translations for source language\r\n45: File uploaded does not match known image format\r\n46: File not present in request\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
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
            "description": "17: Feature is disabled"
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete a localized icon from a badge",
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
            "description": "The id of the badge"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the localized icon to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/game-localization-status/{gameId}/translation-counts
```json
{
    "Method": "GET",
    "Description": "Gets the language translation counts for all languages of a game",
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
            "description": "GameID of the game to get translation counts for"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model that contains game info for getting a translation count.",
                    "properties": {
                        "languagesOrLocales": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "categories": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "A response model that contains category info for getting a translation count.",
                                                    "properties": {
                                                        "translationCounts": {
                                                            "items": {
                                                                "$ref": {
                                                                    "type": "object",
                                                                    "description": "A model that contains the count value of a translation count and relevant metadata.",
                                                                    "properties": {
                                                                        "translatorType": {
                                                                            "enum": {
                                                                                "1": "Automation",
                                                                                "2": "User"
                                                                            },
                                                                            "description": "Gets or sets the type of the translator associated with the count, or null if the count is not associated with a specific type of translator.",
                                                                            "type": "string"
                                                                        },
                                                                        "count": {
                                                                            "type": "integer",
                                                                            "format": "int32"
                                                                        },
                                                                        "translationStatus": {
                                                                            "type": "string",
                                                                            "enum": {
                                                                                "1": "Approved"
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            },
                                                            "type": "array",
                                                            "description": "The translation counts."
                                                        },
                                                        "totalTranslatableItemCount": {
                                                            "format": "int32",
                                                            "description": "The total number of translatable items.\r\nThe translation count percentage can be calculated by doing translationCounts / totalTranslatableItemCount.",
                                                            "type": "integer"
                                                        },
                                                        "category": {
                                                            "enum": {
                                                                "1": "InGameContent"
                                                            },
                                                            "description": "The category of the translation counts.",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "Categories of translation counts."
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "status": {
                                            "enum": {
                                                "1": "Success",
                                                "2": "LanguageOrLocaleNotSupportedForGame"
                                            },
                                            "description": "The status of the response for the requested game.",
                                            "type": "string"
                                        },
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "languageCodeType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Language",
                                                "2": "Locale"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The list of languages/locales of the game."
                        },
                        "gameId": {
                            "format": "int64",
                            "description": "The game id.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "4: Table does not exist.\r\n14: Invalid game id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/translation-analytics/games/{gameId}/request-translation-analytics-report
```json
{
    "Method": "POST",
    "Description": "Request translation analytics report to be generated",
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
            "description": "The game's id"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "endDateTime": {
                            "format": "date-time",
                            "description": "The exclusive end dateTime of report in UTC",
                            "type": "string"
                        },
                        "startDateTime": {
                            "format": "date-time",
                            "description": "The inclusive start dateTime of report in UTC",
                            "type": "string"
                        },
                        "reportSubjectTargetId": {
                            "format": "int64",
                            "description": "The report subject target id",
                            "type": "integer"
                        },
                        "reportType": {
                            "enum": {
                                "1": "GameTranslationStatus",
                                "2": "GameTranslationStatusForTranslatorGroup",
                                "3": "GameTranslationStatusForTranslator",
                                "4": "Test"
                            },
                            "description": "The report type",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The request body"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "reportGenerationStatus": {
                            "type": "string",
                            "enum": {
                                "1": "inProgress",
                                "2": "ready",
                                "3": "unavailable"
                            }
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n57: You do not have permission to request translation analytics report."
        },
        "400": {
            "description": "14: Invalid game id\r\n56: You need to provide a valid translator group id to get report.\r\n58: Start datetime or end datetime is invlaid.\r\n59: Report type is invalid"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/ui-configurations
```json
{
    "Method": "GET",
    "Description": "Get ui configurations for frontend to use.",
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
                        "isDeveloperProductEnabled": {
                            "description": "Developer product translation management is enabled or not.",
                            "type": "boolean"
                        },
                        "isGamePassEnabled": {
                            "description": "Game pass translation management is enabled or not.",
                            "type": "boolean"
                        },
                        "isBadgeIconEnabled": {
                            "description": "Badge Icon translation management is enabled or not.",
                            "type": "boolean"
                        },
                        "isGameProductsEnabled": {
                            "description": "Game products translation management page is enabled or not.",
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
}
```
<hr>


## /v1/player-policies/all-values
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
                        "allowedExternalLinkReferences": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "arePaidRandomItemsRestricted": {
                            "type": "boolean"
                        },
                        "isPaidItemTradingAllowed": {
                            "type": "boolean"
                        },
                        "isSubjectToChinaPolicies": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/supported-languages/games/{gameId}/languages/{languageCode}/universe-display-info-automatic-translation-settings
```json
{
    "Method": "PATCH",
    "Description": "Update the switch which controls if the UniverseDisplayInformation should be automatically translated.",
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
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "body",
            "name": "enableUniverseDisplayInfoAutomaticTranslation",
            "required": true,
            "schema": {
                "type": "boolean"
            },
            "description": ""
        }
    },
    "Responses": {
        "500": {
            "description": "77: Content localization set settings return error code invalid\r\n79: Invalid content instance settings\r\n80: Invalid quota settings\r\n81: Invalid change agent\r\n82: Failed to update UniverseDisplayInformation content instance auto translation settings"
        },
        "400": {
            "description": "14: Invalid game id\r\n72: Automatic translation cannot be enabled for game."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for getting the automatic translation allowed status for game information.",
                    "properties": {
                        "isUniverseDisplayInfoAutomaticTranslationEnabled": {
                            "description": "Indicates universeDisplayInformation automatic translation is enabled.",
                            "type": "boolean"
                        },
                        "languageCode": {
                            "description": "The language code.",
                            "type": "string"
                        },
                        "gameId": {
                            "format": "int64",
                            "description": "The game id.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/autolocalization/games/{gameId}/autolocalizationtable
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
            "name": "gameId",
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
                        "isAutolocalizationEnabled": {
                            "type": "boolean"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "shouldUseLocalizationTable": {
                            "type": "boolean"
                        },
                        "autoLocalizationTableId": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
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

```json
{
    "Method": "PATCH",
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
            "in": "path",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "tableId": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/localizationtable/tables/{tableId}/entries
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
            "name": "tableId",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "cursor",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
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
}
```
<hr>


## /v1/localizationtable/tables/{tableId}/entry-count
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
}
```
<hr>


## /v1/developer-products/{developerProductId}/icons
```json
{
    "Method": "GET",
    "Description": "Get all icons for a developer product",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The id of the developer product"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "The width of the icon to request",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "The height of the icon to request",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "52: Image dimensions are invalid\r\n70: Invalid developer product id"
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
                                    "description": "A response model for getting developer product icon",
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Approved",
                                                "2": "PendingReview",
                                                "3": "UnAvailable",
                                                "4": "Rejected",
                                                "5": "Error"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "imageId": {
                                            "type": "string"
                                        },
                                        "languageCode": {
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/localizationtable/available-languages
```json
{
    "Method": "GET",
    "Description": "Gets the supported language codes that can be used by localization tables",
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
}
```
<hr>


## /v1/localizationtable/tables/{tableId}/entries/translation-history
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
            "description": "3: Invalid table id.\r\n13: Request body can't be null\r\n16: Entries can't be null or empty\r\n35: The entries provided are invalid\r\n37: Invalid locale code.\r\n38: Invalid entry identifier.\r\n39: Count should be at least 1.\r\n55: Invalid exclusive start Id"
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
}
```
<hr>


## /v1/autolocalization/games/{gameId}/settings
```json
{
    "Method": "PATCH",
    "Description": "Sets a game's auto-localization related settings",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "isAutolocalizationEnabled": {
                            "type": "boolean"
                        },
                        "shouldUseLocalizationTable": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id"
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
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/autolocalization/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Ingests entries for auto localization.",
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
                    "properties": {
                        "entries": {
                            "items": {
                                "$ref": {
                                    "properties": {
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
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The request body."
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
}
```
<hr>

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
            "name": "gameId",
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
                        "isAutolocalizationEnabled": {
                            "type": "boolean"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "shouldUseLocalizationTable": {
                            "type": "boolean"
                        },
                        "autoLocalizationTableId": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
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


## /v1/translation-analytics/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata related to UI and rollout settings",
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
                        "minimumDateTimeForAnalyticsReport": {
                            "format": "date-time",
                            "description": "Date-Time since the Analytics Reports can be downloaded",
                            "type": "string"
                        },
                        "isFeatureEnabledOnUI": {
                            "description": "Is Translation Analytics feature enabled on UI",
                            "type": "boolean"
                        },
                        "reportRequestPollingIntervalSeconds": {
                            "format": "int32",
                            "description": "Number of seconds to poll the server for report availability",
                            "type": "integer"
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


## /v1/localizationtable/gametables/{gameId}
```json
{
    "Method": "PATCH",
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
            "in": "path",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "tables": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "id": {
                                            "format": "uuid",
                                            "example": "00000000-0000-0000-0000-000000000000",
                                            "type": "string"
                                        },
                                        "dissociate": {
                                            "type": "boolean"
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
            "name": "request"
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


## /v1/game-passes/{gamePassId}/name-description
```json
{
    "Method": "GET",
    "Description": "Get all names and descriptions of a game pass",
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
            "description": "The game pass Id"
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
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
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
        "503": {
            "description": "17: Feature is disabled"
        },
        "400": {
            "description": "61: Invalid game pass id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/name-description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name and description of a badge",
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
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name and description to Update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating badge name and description",
                    "properties": {
                        "name": {
                            "description": "Badge name",
                            "type": "string"
                        },
                        "description": {
                            "description": "Badge description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating badge name and description",
                    "properties": {
                        "name": {
                            "description": "Badge name saved",
                            "type": "string"
                        },
                        "description": {
                            "description": "Badge description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete localized name and description of a badge",
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
            "description": "The badge id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name and description to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/name/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name of a badge",
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
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating badge name",
                    "properties": {
                        "name": {
                            "description": "Badge name",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating badge name",
                    "properties": {
                        "name": {
                            "description": "Badge name saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/game-icon/games/{gameId}
```json
{
    "Method": "GET",
    "Description": "Get all icons for a game",
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
            "description": "The id of the game"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "The width of the icon to request",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "The height of the icon to request",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "14: Invalid game id\r\n52: Image dimensions are invalid"
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
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Approved",
                                                "2": "PendingReview",
                                                "3": "UnAvailable",
                                                "4": "Rejected",
                                                "5": "Error"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "imageId": {
                                            "type": "string"
                                        },
                                        "languageCode": {
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/developer-products/{developerProductId}/name-description
```json
{
    "Method": "GET",
    "Description": "Get all names and descriptions of a developer product",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The developer product Id"
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
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "name": {
                                            "type": "string"
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
        "503": {
            "description": "17: Feature is disabled"
        },
        "400": {
            "description": "70: Invalid developer product id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/translation-analytics/games/{gameId}/download-translation-analytics-report
```json
{
    "Method": "GET",
    "Description": "Download translation analytics report after the report is ready",
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
            "description": "The game's id"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "startDateTime",
            "required": true,
            "description": "The inclusive start dateTime of report in UTC"
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "endDateTime",
            "required": true,
            "description": "The exclusive end dateTime of report in UTC"
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "reportType",
            "enum": {
                "1": "GameTranslationStatus",
                "2": "GameTranslationStatusForTranslatorGroup",
                "3": "GameTranslationStatusForTranslator",
                "4": "Test"
            },
            "required": true,
            "description": "The report type"
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "reportSubjectTargetId",
            "format": "int64",
            "required": true,
            "description": "The translator group id"
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
            "description": "57: You do not have permission to request translation analytics report."
        },
        "400": {
            "description": "14: Invalid game id\r\n56: You need to provide a valid translator group id to get report.\r\n58: Start datetime or end datetime is invlaid.\r\n59: Report type is invalid"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/localizationtable/games/{gameId}/assets-generation-request
```json
{
    "Method": "POST",
    "Description": "Generates localization asset of a game",
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
            "description": "The game id"
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
}
```
<hr>


## /v1/autolocalization/metadata
```json
{
    "Method": "GET",
    "Description": "Metadata for AutoLocalization Configuration",
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
                        "isReactVersionEnabledForAutoLocalizationSettings": {
                            "description": "Is React Implementation of AutoLocalization Settings Enabled",
                            "type": "boolean"
                        },
                        "isTabbedUIEnabledForConfigureLocalizationPage": {
                            "description": "Is Tabbed UI Enabled for Configure Localization Page",
                            "type": "boolean"
                        },
                        "isAutomaticTranslationToggleUIEnabled": {
                            "description": "Is Toggle UI Enabled for Automatic Translations",
                            "type": "boolean"
                        },
                        "isAutomaticTranslationQuotaUIEnabled": {
                            "description": "Is Quota UI Enabled for Automatic Translations",
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
}
```
<hr>


## /v1/source-language/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Sets the source language of a game",
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
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "500": {
            "description": "85: Failed to disable automatic translation status for languages"
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the source language of a game",
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
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
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
            }
        },
        "400": {
            "description": "14: Invalid game id"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/player-policies-client
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
                        "allowedExternalLinkReferences": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "arePaidRandomItemsRestricted": {
                            "type": "boolean"
                        },
                        "isPaidItemTradingAllowed": {
                            "type": "boolean"
                        },
                        "isSubjectToChinaPolicies": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "17: Feature is disabled"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/supported-languages/games/{gameId}/universe-display-info-automatic-translation-settings
```json
{
    "Method": "GET",
    "Description": "Get UniverseDisplayInfo automatic translation settings..",
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
        "500": {
            "description": "0: An unknown error occurred.\r\n22: Invalid language code\r\n83: Failed to get UniverseDisplayInformation content instance auto translation settings\r\n84: Count of language code is larger than max batch get size"
        },
        "400": {
            "description": "14: Invalid game id"
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
                                    "properties": {
                                        "languageCode": {
                                            "description": "The language code.",
                                            "type": "string"
                                        },
                                        "isUniverseDisplayInfoAutomaticTranslationEnabled": {
                                            "description": "Indicates whether or not automatic translation is currently enabled for Game and Place Information for a game and language.",
                                            "type": "boolean"
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
            "description": "18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/supported-languages/games/{gameId}/automatic-translation-status
```json
{
    "Method": "GET",
    "Description": "Get the automatic translation status of supported languages for a game.",
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
        }
    },
    "Responses": {
        "403": {
            "description": "18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id"
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
                                    "properties": {
                                        "isAutomaticTranslationEnabled": {
                                            "description": "Indicates whether or not automatic translation is currently enabled for the game and language.",
                                            "type": "boolean"
                                        },
                                        "languageCode": {
                                            "description": "The language code.",
                                            "type": "string"
                                        },
                                        "languageCodeType": {
                                            "enum": {
                                                "1": "Language",
                                                "2": "Locale"
                                            },
                                            "description": "The language code type.",
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/name-description/metadata
```json
{
    "Method": "GET",
    "Description": "Rollout settings for name/description migration to new page",
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
                        "isNameDescriptionMigrationEnabled": {
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
}
```
<hr>


## /v1/game-passes/{gamePassId}/icons
```json
{
    "Method": "GET",
    "Description": "Get all icons for a game pass",
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
            "description": "The game pass id"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "The width of the icon to request",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "The height of the icon to request",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "52: Image dimensions are invalid\r\n61: Invalid game pass id"
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
                                    "description": "A response model for getting game pass icon",
                                    "properties": {
                                        "state": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Approved",
                                                "2": "PendingReview",
                                                "3": "UnAvailable",
                                                "4": "Rejected",
                                                "5": "Error"
                                            }
                                        },
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "imageId": {
                                            "type": "string"
                                        },
                                        "languageCode": {
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
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/supported-languages/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Add or remove supported languages for a game.",
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
            "name": "languages",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "delete": {
                                "description": "An optional field used to indicate whether a language should be deleted from this game's list of supported languages.",
                                "type": "boolean"
                            },
                            "languageCode": {
                                "description": "The language code for the language to edit.",
                                "type": "string"
                            },
                            "languageCodeType": {
                                "enum": {
                                    "1": "Language",
                                    "2": "Locale"
                                },
                                "description": "The language code type.",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            },
            "description": "The languages to add or remove. LanguageCodeType can be \"Language\" or \"Locale\"."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n49: Duplicate language codes are not allowed."
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
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get the supported languages for a game.",
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
                                        "languageCodeType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Language",
                                                "2": "Locale"
                                            }
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "languageCode": {
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
            "description": "14: Invalid game id"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-localization-status/translation-counts-for-language-or-locale
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
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "List of game ids to retrieve translation counts for.",
            "name": "gameIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "languageOrLocaleCode",
            "required": true,
            "description": "The code for the language or locale."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "languageOrLocaleType",
            "enum": {
                "1": "Language",
                "2": "Locale"
            },
            "required": true,
            "description": "Indicates whether the languageOrLocaleCode represents a language or locale."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for getting translation counts for a language or locale.",
                    "properties": {
                        "games": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A response model that contains game info for getting a translation count.",
                                    "properties": {
                                        "status": {
                                            "enum": {
                                                "1": "LanguageOrLocaleSupportedForGame",
                                                "2": "LanguageOrLocaleNotSupportedForGame",
                                                "3": "LanguageOrLocaleIsSource",
                                                "4": "InsufficientPermission",
                                                "5": "GameDoesNotExist",
                                                "6": "GameDoesNotHaveTable",
                                                "7": "UnknownError"
                                            },
                                            "description": "The status of the response for the requested game.",
                                            "type": "string"
                                        },
                                        "categories": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "A response model that contains category info for getting a translation count.",
                                                    "properties": {
                                                        "translationCounts": {
                                                            "items": {
                                                                "$ref": {
                                                                    "type": "object",
                                                                    "description": "A model that contains the count value of a translation count and relevant metadata.",
                                                                    "properties": {
                                                                        "translatorType": {
                                                                            "enum": {
                                                                                "1": "Automation",
                                                                                "2": "User"
                                                                            },
                                                                            "description": "Gets or sets the type of the translator associated with the count, or null if the count is not associated with a specific type of translator.",
                                                                            "type": "string"
                                                                        },
                                                                        "count": {
                                                                            "type": "integer",
                                                                            "format": "int32"
                                                                        },
                                                                        "translationStatus": {
                                                                            "type": "string",
                                                                            "enum": {
                                                                                "1": "Approved"
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            },
                                                            "type": "array",
                                                            "description": "The translation counts."
                                                        },
                                                        "totalTranslatableItemCount": {
                                                            "format": "int32",
                                                            "description": "The total number of translatable items.\r\nThe translation count percentage can be calculated by doing translationCounts / totalTranslatableItemCount.",
                                                            "type": "integer"
                                                        },
                                                        "category": {
                                                            "enum": {
                                                                "1": "InGameContent"
                                                            },
                                                            "description": "The category of the translation counts.",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "Categories of translation counts."
                                        },
                                        "gameId": {
                                            "format": "int64",
                                            "description": "The game id.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Info for the requested games, including their translation counts for the specified language or locale."
                        },
                        "languageOrLocaleType": {
                            "enum": {
                                "1": "Language",
                                "2": "Locale"
                            },
                            "description": "An indicator that says whether the passed in language/locale code represents a language or locale.",
                            "type": "string"
                        },
                        "languageOrLocaleCode": {
                            "description": "The code of the language or locale.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "66: Games can't be null or empty\r\n67: Maximum games exceeded. Please keep the number of games per request below the maximum.\r\n68: LanguageOrLocaleCode is null or whitespace"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/game-passes/{gamePassId}/description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized description of a game pass",
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
            "name": "gamePassId",
            "format": "int64",
            "required": true,
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of description to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating game pass description",
                    "properties": {
                        "description": {
                            "description": "Game pass description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating game pass description",
                    "properties": {
                        "description": {
                            "description": "Game pass description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/badges/{badgeId}/description/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized description of a badge",
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
            "name": "badgeId",
            "format": "int64",
            "required": true,
            "description": "The badge id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the description to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating badge description",
                    "properties": {
                        "description": {
                            "description": "Badge description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n62: Invalid game badge id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating badge description",
                    "properties": {
                        "description": {
                            "description": "Badge description saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/game-passes/{gamePassId}/icons/language-codes/{languageCode}
```json
{
    "Method": "POST",
    "Description": "Update a game pass's icon",
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
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of this icon to update"
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n26: You can't update translations for source language\r\n45: File uploaded does not match known image format\r\n46: File not present in request\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
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
            "description": "17: Feature is disabled"
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete a localized icon from a game pass",
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
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the localized icon to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/supported-languages/games/{gameId}/languages/{languageCode}/automatic-translation-status
```json
{
    "Method": "PATCH",
    "Description": "Enable or disable automatic translation for a game and language.",
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
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language to enable or disable for automatic translation."
        },
        "3": {
            "in": "body",
            "name": "enableAutomaticTranslation",
            "required": true,
            "schema": {
                "type": "boolean"
            },
            "description": "Flag to indicate if automatic translation should be enabled or disabled."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n53: Language is not supported for the game.\r\n72: Automatic translation cannot be enabled for game.\r\n75: Automatic translation cannot be enabled for language."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "isAutomaticTranslationEnabled": {
                            "description": "Indicates whether or not automatic translation is currently enabled for the game and language.",
                            "type": "boolean"
                        },
                        "languageCode": {
                            "description": "The language code.",
                            "type": "string"
                        },
                        "gameId": {
                            "format": "int64",
                            "description": "The game id.",
                            "type": "integer"
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
}
```
<hr>


## /v1/game-thumbnails/games/{gameId}/images
```json
{
    "Method": "GET",
    "Description": "Get the localized image ids in all languages for a game.",
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
            "description": "The game identifier."
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "The width.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "The height.",
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
                                        "languageCode": {
                                            "type": "string"
                                        },
                                        "mediaAssets": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "state": {
                                                            "type": "string",
                                                            "enum": {
                                                                "1": "Approved",
                                                                "2": "PendingReview",
                                                                "3": "UnAvailable",
                                                                "4": "Rejected",
                                                                "5": "Error"
                                                            }
                                                        },
                                                        "mediaAssetUrl": {
                                                            "type": "string"
                                                        },
                                                        "mediaAssetId": {
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
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "14: Invalid game id\r\n52: Image dimensions are invalid"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-thumbnails/games/{gameId}/language-codes/{languageCode}/image
```json
{
    "Method": "POST",
    "Description": "Uploads the game thumbnail.",
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
            "description": "The game identifier."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code."
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "gameThumbnailRequest.files",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "mediaAssetId": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


## /v1/localizationtable/tables
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
            "name": "request"
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
}
```
<hr>

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
            "in": "query",
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/name-description/games/{gameId}/history
```json
{
    "Method": "POST",
    "Description": "Gets the history for name or description in a provided language.",
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
            "description": "The id of the game"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model containing request for getting history of name or description.",
                    "properties": {
                        "sortOrder": {
                            "type": "string",
                            "enum": {
                                "1": "Asc",
                                "2": "Desc"
                            }
                        },
                        "count": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "requestType": {
                            "type": "string",
                            "enum": {
                                "1": "Name",
                                "2": "Description"
                            }
                        },
                        "languageCode": {
                            "type": "string"
                        },
                        "cursor": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request."
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "13: Request body can't be null\r\n14: Invalid game id\r\n18: You do not have permission to manage this game\r\n22: Invalid language code\r\n39: Count should be at least 1.\r\n53: Language is not supported for the game.\r\n54: No history available for source data\r\n55: Invalid exclusive start Id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "lastEvaluatedId": {
                            "type": "string"
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
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/supported-languages/metadata
```json
{
    "Method": "GET",
    "Description": "Rollout settings for supported languages of a game",
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
                        "areAllLanguagesEnabled": {
                            "type": "boolean"
                        },
                        "isFeatureEnabled": {
                            "type": "boolean"
                        },
                        "isSupportedLanguagesChildLocalesUIEnabled": {
                            "description": "Is Language Locales UI Enabled for Supported Languages",
                            "type": "boolean"
                        },
                        "isAutomaticTranslationProgressUIEnabled": {
                            "description": "Is translation progress for automatic translations enabled on UI",
                            "type": "boolean"
                        },
                        "isHumanTranslationProgressUIEnabled": {
                            "description": "Is translation progress for human translations enabled on UI",
                            "type": "boolean"
                        },
                        "minimumUniverseIdForFeature": {
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


## /v1/localizationtable/tables/{tableId}
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
}
```
<hr>

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
            "name": "tableId",
            "required": true
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/game-passes/{gamePassId}/name/language-codes/{languageCode}
```json
{
    "Method": "PATCH",
    "Description": "Update localized name of a game pass",
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
            "name": "gamePassId",
            "format": "int64",
            "required": true,
            "description": "The game pass id"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the name to update"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating game pass name",
                    "properties": {
                        "name": {
                            "description": "Game pass name",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "13: Request body can't be null\r\n19: New name is null or whitespaces or new name/description is too long\r\n20: New name or description is moderated\r\n22: Invalid language code\r\n26: You can't update translations for source language\r\n53: Language is not supported for the game.\r\n61: Invalid game pass id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for updating game pass name",
                    "properties": {
                        "name": {
                            "description": "Game pass name saved",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-thumbnails/games/{gameId}/language-codes/{languageCode}/images/{imageId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes the game thumbnail.",
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
            "description": "The game identifier."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code."
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "imageId",
            "format": "int64",
            "required": true,
            "description": "The image identifier."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        },
        "400": {
            "description": "14: Invalid game id\r\n22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game."
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
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/developer-products/{developerProductId}/icons/language-codes/{languageCode}
```json
{
    "Method": "POST",
    "Description": "Update a developer product's icon",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The id of the developer product"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of this icon to update"
        },
        "3": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n26: You can't update translations for source language\r\n45: File uploaded does not match known image format\r\n46: File not present in request\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
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
            "description": "17: Feature is disabled"
        },
        "429": {
            "description": "24: Too many attempts.Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Delete a localized icon from a developer product",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "developerProductId",
            "format": "int64",
            "required": true,
            "description": "The id of the developer product"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "languageCode",
            "required": true,
            "description": "The language code of the localized icon to delete"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "22: Invalid language code\r\n23: You can't delete translations for source language\r\n53: Language is not supported for the game.\r\n70: Invalid developer product id"
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
            "description": "17: Feature is disabled"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: You do not have permission to manage this game"
        }
    },
}
```
<hr>


# <b>GameInternationalization Api v2</b>

## /v2/supported-languages/games/{gameId}
```json
{
    "Method": "GET",
    "Description": "Get the supported languages for a game.",
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
                                        "childLocales": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "locale": {
                                                            "type": "string",
                                                            "enum": {
                                                                "1": "en_us",
                                                                "2": "es_es",
                                                                "3": "fr_fr",
                                                                "4": "id_id",
                                                                "5": "it_it",
                                                                "6": "ja_jp",
                                                                "7": "ko_kr",
                                                                "8": "ru_ru",
                                                                "9": "th_th",
                                                                "10": "tr_tr",
                                                                "11": "vi_vn",
                                                                "12": "pt_br",
                                                                "13": "de_de",
                                                                "14": "zh_cn",
                                                                "15": "zh_tw",
                                                                "16": "bg_bg",
                                                                "17": "bn_bd",
                                                                "18": "cs_cz",
                                                                "19": "da_dk",
                                                                "20": "el_gr",
                                                                "21": "et_ee",
                                                                "22": "fi_fi",
                                                                "23": "hi_in",
                                                                "24": "hr_hr",
                                                                "25": "hu_hu",
                                                                "26": "ka_ge",
                                                                "27": "kk_kz",
                                                                "28": "km_kh",
                                                                "29": "lt_lt",
                                                                "30": "lv_lv",
                                                                "31": "ms_my",
                                                                "32": "my_mm",
                                                                "33": "nb_no",
                                                                "34": "nl_nl",
                                                                "35": "fil_ph",
                                                                "36": "pl_pl",
                                                                "37": "ro_ro",
                                                                "38": "uk_ua",
                                                                "39": "si_lk",
                                                                "40": "sk_sk",
                                                                "41": "sl_sl",
                                                                "42": "sq_al",
                                                                "43": "bs_ba",
                                                                "44": "sr_rs",
                                                                "45": "sv_se",
                                                                "46": "zh_cjv"
                                                            }
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "id": {
                                                            "type": "integer",
                                                            "format": "int32"
                                                        },
                                                        "language": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "id": {
                                                                        "type": "integer",
                                                                        "format": "int32"
                                                                    },
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
                                                        "localeCode": {
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
                                        },
                                        "languageFamily": {
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
            "description": "14: Invalid game id"
        },
        "503": {
            "description": "17: Feature is disabled"
        }
    },
}
```
<hr>


