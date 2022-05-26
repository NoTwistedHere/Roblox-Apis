# <b>AccountSettings Api v1</b>

## /v1/email
```json
{
    "Method": "POST",
    "Description": "Updates the authenticated user's email address",
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
            "name": "requestBody",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for updating an email",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        },
                        "skipVerificationEmail": {
                            "description": "Should the email controller skip sending the verification email.",
                            "type": "boolean"
                        },
                        "emailAddress": {
                            "description": "The new email address to set.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: PIN is locked.\r\n3: There are too many accounts associated with this email address."
        },
        "400": {
            "description": "8: Password is incorrect.\r\n9: Invalid email address."
        },
        "409": {
            "description": "4: This is already the current email."
        },
        "200": {
            "description": "The user's email was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "2: This feature is currently disabled. Please try again later."
        },
        "429": {
            "description": "6: Too many attempts to update email. Please try again later.\r\n7: Too many attempts to send verification email. Please try again later."
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
    "Description": "Updates the authenticated user's email address",
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
            "name": "requestBody",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for updating an email",
                    "properties": {
                        "password": {
                            "description": "The user's password.",
                            "type": "string"
                        },
                        "skipVerificationEmail": {
                            "description": "Should the email controller skip sending the verification email.",
                            "type": "boolean"
                        },
                        "emailAddress": {
                            "description": "The new email address to set.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: PIN is locked.\r\n3: There are too many accounts associated with this email address."
        },
        "400": {
            "description": "8: Password is incorrect.\r\n9: Invalid email address."
        },
        "409": {
            "description": "4: This is already the current email."
        },
        "200": {
            "description": "The user's email was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "2: This feature is currently disabled. Please try again later."
        },
        "429": {
            "description": "6: Too many attempts to update email. Please try again later.\r\n7: Too many attempts to send verification email. Please try again later."
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
    "Description": "Gets the authenticated user's email address and verified status",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "Get user's email address and verified status successfully.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for getting the user's email address and verified status",
                    "properties": {
                        "emailAddress": {
                            "description": "The masked and formatted email address",
                            "type": "string"
                        },
                        "verified": {
                            "description": "The verified status of the email",
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
    "Internal": false
}
```
<hr>


## /v1/themes/{consumerType}/{consumerId}
```json
{
    "Method": "PATCH",
    "Description": "Modify the theme type for consumer.",
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
                    "description": "Response model for get user's theme type",
                    "properties": {
                        "themeType": {
                            "description": "theme Type",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "An {Response model for get user's theme type}."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "consumerType",
            "enum": {
                "1": "User"
            },
            "required": true,
            "description": "The consumer type"
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "consumerId",
            "format": "int64",
            "required": true,
            "description": "The consumer's theme configuration to modify. If the consumerType is User always modify the AuthenticatedUser's theme type."
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
        "400": {
            "description": "2: Invalid theme type."
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
    "Description": "returns the theme type for a specific consumer.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "consumerType",
            "enum": {
                "1": "User"
            },
            "required": true,
            "description": "The consumer type"
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "consumerId",
            "format": "int64",
            "required": true,
            "description": "The consumer's theme configuration to get. If the consumerType is User always return the AuthenticatedUser's theme type."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for get user's theme type",
                    "properties": {
                        "themeType": {
                            "description": "theme Type",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "3: Invalid consumer type."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/trade-value
```json
{
    "Method": "POST",
    "Description": "Updates a user's trade quality filter setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for trade value setting update",
                    "properties": {
                        "tradeValue": {
                            "enum": {
                                "1": "Undefined",
                                "2": "None",
                                "3": "Low",
                                "4": "Medium",
                                "5": "High"
                            },
                            "description": "The desired trade value setting for the active user",
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
            "description": "The trade value setting was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.AccountLocked}\r\n            OR\r\n            {Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.UserCannotTrade}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.InvalidTradeValue}"
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
    "Description": "Get a user's trade quality filter setting",
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
                    "description": "Response model for getting the user's trade value settings",
                    "properties": {
                        "tradeValue": {
                            "description": "The current trade value setting for the current user",
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


## /v1/user/screens/contact-upsell
```json
{
    "Method": "GET",
    "Description": "Determines if the contact (e.g. email or phone) upsell screen should be shown to the current user and gets data related to it",
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
                    "description": "A class representing response for contact upsell screen",
                    "properties": {
                        "upsellScreenType": {
                            "enum": {
                                "1": "None",
                                "2": "AddContactMethod",
                                "3": "VerifyEmail",
                                "4": "ContactFriendFinder",
                                "5": "FreeHat",
                                "6": "VerifyEmailFreeHat",
                                "7": "AddContactMethodBanner",
                                "8": "VerifyEmailBanner",
                                "9": "AfterGamePlay",
                                "10": "VerifyEmailAfterGamePlay"
                            },
                            "description": "Returns {Roblox.Web.Prompts.ContactUpsell.ContactUpsellType} to display",
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


## /v1/users/{userId}/unblock
```json
{
    "Method": "POST",
    "Description": "Unblocks a previously blocked user.",
    "Consumes": "NONE",
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
            "description": "The user ID to unblock."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: Target user does not exist.\r\n6: Target user for unblock request is not currently blocked."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n1: User sending block request not logged in."
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
            "description": "5: User blocking is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/privacy/info
```json
{
    "Method": "GET",
    "Description": "Gets a user's privacy settings info.",
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
                    "description": "Response model for getting the user's privacy settings info.",
                    "properties": {
                        "isPhoneDiscoveryEnabled": {
                            "description": "Whether the phone discovery privacy setting is enabled.",
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
    "Internal": false
}
```
<hr>


## /v1/app-chat-privacy
```json
{
    "Method": "POST",
    "Description": "Updates a user's app chat privacy setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for app chat privacy setting update",
                    "properties": {
                        "appChatPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The desired app chat privacy setting for the active user",
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
            "description": "The app chat privacy setting was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.AccountLocked}\r\n            OR\r\n            {Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.SettingLockedCuratedGamesEnabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.InvalidSettingOption}"
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
    "Description": "Get a user's app chat privacy setting",
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
                    "description": "Response model for getting the user's app chat privacy setting GET",
                    "properties": {
                        "appChatPrivacy": {
                            "description": "The current app chat privacy setting for the current user",
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


## /v1/xbox/is-username-valid
```json
{
    "Method": "GET",
    "Description": "Determines whether the username requested is valid.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "header",
            "type": "string",
            "name": "Authorization",
            "description": "The authorization header.",
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Signature",
            "description": "The signature header.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "request.username",
            "description": "The username to run the validation against.",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A class representing response for Username validation",
                    "properties": {
                        "isValid": {
                            "description": "Returns true if  the username is valid.",
                            "type": "boolean"
                        },
                        "errorMessage": {
                            "description": "Gets the error message.",
                            "type": "string"
                        },
                        "errorCode": {
                            "enum": {
                                "1": "UserNameValid",
                                "2": "UserNameAlreadyInUseErrorCode",
                                "3": "UserNameModerationErrorCode",
                                "4": "UserNameLengthErrorCode",
                                "5": "UserNameStartEndUnderscoreErrorCode",
                                "6": "UserNameAtMostUnderscoreErrorCode",
                                "7": "UserNameNoSpaceErrorCode",
                                "8": "UserNameAllowedCharErrorCode",
                                "9": "UnknownErrorCode",
                                "10": "UsernameNull",
                                "11": "UsernameContainsPii",
                                "12": "InvalidBirthDateForUsername",
                                "13": "UsernameContainsReservedUsername"
                            },
                            "description": "Gets the error code.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "If this endpoint was called with an authenticated user in context."
        },
        "400": {
            "description": "If this endpoint was called with wrong arguments."
        },
        "500": {
            "description": "If an unknown error has occured."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/email/verify
```json
{
    "Method": "POST",
    "Description": "Send verify email to the authenticated user's email address",
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
                    "description": "Request model for sending a verify email request",
                    "properties": {
                        "freeItem": {
                            "description": "Whether the user will see messaging that they received a free item after verifying their email",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: PIN is locked."
        },
        "400": {
            "description": "10: No email address is associated with the account."
        },
        "409": {
            "description": "5: The email is already verified."
        },
        "200": {
            "description": "The verification email has been sent successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "2: This feature is currently disabled. Please try again later."
        },
        "429": {
            "description": "7: Too many attempts to send verification email. Please try again later."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/promotion-channels
```json
{
    "Method": "POST",
    "Description": "Updates a user's promotion channels and their visibility settings on their profile",
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
                    "description": "Request model to update a user's promotion channels and privacy settings",
                    "properties": {
                        "youtube": {
                            "description": "The Youtube url",
                            "type": "string"
                        },
                        "twitch": {
                            "description": "The Twitch url",
                            "type": "string"
                        },
                        "facebook": {
                            "description": "The Facebook url",
                            "type": "string"
                        },
                        "socialNetworksVisibilityPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The privacy level type of the user's promotion channels",
                            "type": "string"
                        },
                        "twitter": {
                            "description": "The Twitter handle",
                            "type": "string"
                        }
                    }
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: PIN is locked.\r\n3: Only users who are over twelve years of age may edit social network channels."
        },
        "400": {
            "description": "1: The request was empty.\r\n11: The Facebook profile url is invalid.\r\n12: The Twitter handle is invalid.\r\n13: The YouTube url is invalid.\r\n14: The Twitch profile url is invalid."
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
            "description": "4: Too many attempts. Please try again later."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/inventory-privacy
```json
{
    "Method": "POST",
    "Description": "Updates a user's inventory privacy setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for inventory privacy setting update",
                    "properties": {
                        "inventoryPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The desired inventory privacy setting for the active user",
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
            "description": "The inventory privacy setting was successfully updated.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for updating the user's inventory privacy settings",
                    "properties": {
                        "privacySettingResponse": {
                            "enum": {
                                "1": "Success",
                                "2": "Conflict"
                            },
                            "description": "The response state after updating inventory privacy",
                            "type": "string"
                        },
                        "tradePrivacy": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Disabled",
                                "3": "NoOne",
                                "4": "Friends",
                                "5": "TopFriends",
                                "6": "Following",
                                "7": "Followers",
                                "8": "All"
                            },
                            "description": "The trade privacy setting after updating",
                            "type": "string"
                        },
                        "inventoryPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The inventory privacy setting after updating",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.InventoryHidingFeatureDisabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.AccountLocked}"
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
    "Description": "Get a user's inventory privacy setting",
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
                    "description": "Response model for getting the user's inventory privacy settings",
                    "properties": {
                        "inventoryPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The current inventory privacy setting for the current user",
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


## /v1/account/settings/settings-groups
```json
{
    "Method": "GET",
    "Description": "Used by the site and mobile apps to determine titles and locations of
settings groups such as "Notifications" and "Billing"",
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
                            "Url": {
                                "description": "The absolute Url of the page containing the corresponding group of settings",
                                "type": "string"
                            },
                            "Title": {
                                "description": "The text displayed to the user for the tab",
                                "type": "string"
                            },
                            "Suffix": {
                                "description": "The url hash suffix",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v1/game-chat-privacy
```json
{
    "Method": "POST",
    "Description": "Updates a user's game chat privacy setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for game chat privacy setting update",
                    "properties": {
                        "gameChatPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The desired game chat privacy setting for the active user",
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
            "description": "The game chat privacy setting was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.AccountLocked}\r\n            OR\r\n            {Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.SettingLockedCuratedGamesEnabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.InvalidSettingOption}"
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
    "Description": "Get a user's game chat privacy setting",
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
                    "description": "Response model for getting the user's game chat privacy settings",
                    "properties": {
                        "gameChatPrivacy": {
                            "description": "The current game chat privacy setting for the current user",
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


## /v1/user/screens/contact-upsell/suppress
```json
{
    "Method": "POST",
    "Description": "Suppresses the ContactUpsell screen for the authenticated user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "boolean",
            "name": "suppress",
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
    "Internal": false
}
```
<hr>


## /v1/private-message-privacy
```json
{
    "Method": "POST",
    "Description": "Updates a user's private message privacy setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for private message privacy setting update",
                    "properties": {
                        "privateMessagePrivacy": {
                            "enum": {
                                "1": "All",
                                "2": "TopFriends",
                                "3": "Friends",
                                "4": "NoOne",
                                "5": "Disabled",
                                "6": "Following",
                                "7": "Followers"
                            },
                            "description": "The desired private message privacy setting for the active user",
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
            "description": "The private message privacy setting was successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.AccountLocked}\r\n            OR\r\n            {Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.SettingLockedCuratedGamesEnabled}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.ContactSettingsErrors.InvalidSettingOption}"
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
    "Description": "Get a user's private message privacy setting",
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
                    "description": "Response model for getting the user's private message privacy settings",
                    "properties": {
                        "privateMessagePrivacy": {
                            "description": "The current private message privacy setting for the current user",
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


## /v1/users/{userId}/block
```json
{
    "Method": "POST",
    "Description": "Blocks another user.",
    "Consumes": "NONE",
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
            "description": "The user ID to block."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: Target user does not exist.\r\n3: Target user already blocked.\r\n4: User sending block request has reached their block limit."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n1: User sending block request not logged in."
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
            "description": "5: User blocking is disabled."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/content-restriction
```json
{
    "Method": "POST",
    "Description": "Sets the user's content restriction level.
User must be authenticated and also the PIN needs to be unlocked to perform the request.",
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
                    "description": "API request to set content level restriction for a user.",
                    "properties": {
                        "contentRestrictionLevel": {
                            "enum": {
                                "1": "NoRestrictions",
                                "2": "Teen",
                                "3": "PreTeen",
                                "4": "Child"
                            },
                            "description": "Content restriction level to set.",
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
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n0: PIN is locked."
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
    "Description": "Gets the user's content restriction level.
User must be authenticated to perform the request.",
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
                    "description": "API response when getting the content restriction level.",
                    "properties": {
                        "contentRestrictionLevel": {
                            "type": "string",
                            "enum": {
                                "1": "NoRestrictions",
                                "2": "Teen",
                                "3": "PreTeen",
                                "4": "Child"
                            }
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


## /v1/trade-privacy
```json
{
    "Method": "POST",
    "Description": "Updates a user's trade privacy setting",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for trade privacy setting update",
                    "properties": {
                        "tradePrivacy": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Disabled",
                                "3": "NoOne",
                                "4": "Friends",
                                "5": "TopFriends",
                                "6": "Following",
                                "7": "Followers",
                                "8": "All"
                            },
                            "description": "The desired trade privacy setting for the active user",
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
            "description": "The trade privacy setting was successfully updated.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for updating the user's trade privacy settings",
                    "properties": {
                        "privacySettingResponse": {
                            "enum": {
                                "1": "Success",
                                "2": "Conflict"
                            },
                            "description": "The response state after updating trade privacy",
                            "type": "string"
                        },
                        "tradePrivacy": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Disabled",
                                "3": "NoOne",
                                "4": "Friends",
                                "5": "TopFriends",
                                "6": "Following",
                                "7": "Followers",
                                "8": "All"
                            },
                            "description": "The trade privacy setting after updating",
                            "type": "string"
                        },
                        "inventoryPrivacy": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The inventory privacy setting after updating",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.AccountLocked}\r\n            OR\r\n            {Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.UserCannotTrade}\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "{Roblox.AccountSettings.Api.ResponseEnums.TradeSettingsErrors.InvalidTradePrivacy}"
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
    "Description": "Get a user's trade privacy setting",
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
                    "description": "Response model for getting the user's trade privacy settings",
                    "properties": {
                        "tradePrivacy": {
                            "description": "The current trade privacy setting for the current user",
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


## /v1/privacy
```json
{
    "Method": "PATCH",
    "Description": "Updates a user's privacy settings.",
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
            "name": "model",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for privacy settings update",
                    "properties": {
                        "phoneDiscovery": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The desired privacy settings for the active user.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Request model for privacy settings update}"
        }
    },
    "Responses": {
        "200": {
            "description": "The user's privacy settings were successfully updated.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n1: The account is locked. Unlock the acount before performing the action.\r\n4: The user is not authorized to perform this operation."
        },
        "400": {
            "description": "3: The option for that setting is invalid or does not exist."
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
    "Description": "Gets a user's privacy settings.",
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
                    "description": "Response model for getting the user's privacy settings.",
                    "properties": {
                        "phoneDiscovery": {
                            "enum": {
                                "1": "NoOne",
                                "2": "Friends",
                                "3": "FriendsAndFollowing",
                                "4": "FriendsFollowingAndFollowers",
                                "5": "AllAuthenticatedUsers",
                                "6": "AllUsers"
                            },
                            "description": "The phone discovery privacy setting.",
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


## /v1/themes/types
```json
{
    "Method": "GET",
    "Description": "returns all the enabled theme types.",
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
        }
    },
    "Internal": false
}
```
<hr>


