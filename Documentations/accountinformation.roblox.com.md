# <b>Account Information Api v1</b>

## /v1/phone/verify
```json
{
    "Method": "POST",
    "Description": "Verify Phone",
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
                    "description": "Verify Phone Request",
                    "properties": {
                        "code": {
                            "description": "Code to verify phone",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.VerifyPhoneRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "400": {
            "description": "2: Invalid Phone Number\r\n3: Phone Number Already Associated\r\n7: Invalid Code"
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
            "description": "1: This feature is currently disabled. Please try again later."
        },
        "429": {
            "description": "6: Flooded"
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/users/{userId}/promotion-channels
```json
{
    "Method": "GET",
    "Description": "Get promotion channels for a given user ID",
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
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The promotion channels response",
                    "properties": {
                        "facebook": {
                            "description": "The Facebook channel",
                            "type": "string"
                        },
                        "twitter": {
                            "description": "The Twitter channel",
                            "type": "string"
                        },
                        "youtube": {
                            "description": "The YouTube channel",
                            "type": "string"
                        },
                        "twitch": {
                            "description": "The Twitch channel",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: User not found."
        }
    },
}
```
<hr>


## /v1/promotion-channels
```json
{
    "Method": "POST",
    "Description": "Update the user's promotion channels",
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
                    "description": "The promotion channels request",
                    "properties": {
                        "promotionChannelsVisibilityPrivacy": {
                            "description": "The promotion channels visibility privacy level",
                            "type": "string"
                        },
                        "youtube": {
                            "description": "The YouTube channel",
                            "type": "string"
                        },
                        "twitch": {
                            "description": "The Twitch channel",
                            "type": "string"
                        },
                        "facebook": {
                            "description": "The Facebook channel",
                            "type": "string"
                        },
                        "twitter": {
                            "description": "The Twitter channel",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.AccountInformation.Api.Models.PromotionChannelsRequest}"
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
            "description": "0: Token Validation Failed\r\n3: PIN is locked.\r\n4: Only users who are over twelve years of age may edit social network channels."
        },
        "400": {
            "description": "2: The request was empty.\r\n11: The Facebook profile url is invalid.\r\n12: The Twitter handle is invalid.\r\n13: The YouTube url is invalid.\r\n14: The Twitch profile url is invalid."
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
    "Description": "Get the user's promotion channels",
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
                    "description": "The promotion channels response",
                    "properties": {
                        "promotionChannelsVisibilityPrivacy": {
                            "description": "The promotion channels visibility privacy level",
                            "type": "string"
                        },
                        "youtube": {
                            "description": "The YouTube channel",
                            "type": "string"
                        },
                        "twitch": {
                            "description": "The Twitch channel",
                            "type": "string"
                        },
                        "facebook": {
                            "description": "The Facebook channel",
                            "type": "string"
                        },
                        "twitter": {
                            "description": "The Twitter channel",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: User not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/birthdate
```json
{
    "Method": "POST",
    "Description": "Update the user's birthdate",
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
                    "description": "The birthdate request",
                    "properties": {
                        "birthYear": {
                            "format": "int32",
                            "description": "The birth year",
                            "type": "integer"
                        },
                        "birthMonth": {
                            "format": "int32",
                            "description": "The birth month",
                            "type": "integer"
                        },
                        "birthDay": {
                            "format": "int32",
                            "description": "The birth day",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The {Roblox.AccountInformation.Api.Models.BirthdateRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured.\r\n5: Invalid birthdate change."
        },
        "400": {
            "description": "1: User not found.\r\n4: The birthdate provided is invalid."
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
            "description": "0: Token Validation Failed\r\n2: PIN is locked.\r\n5: Invalid birthdate change."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get the user's birthdate",
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
                    "description": "The birthdate response",
                    "properties": {
                        "birthYear": {
                            "format": "int32",
                            "description": "The birth year",
                            "type": "integer"
                        },
                        "birthMonth": {
                            "format": "int32",
                            "description": "The birth month",
                            "type": "integer"
                        },
                        "birthDay": {
                            "format": "int32",
                            "description": "The birth day",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: User not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/star-code-affiliates
```json
{
    "Method": "POST",
    "Description": "Adds a star code affiliate supporter for the authenticated user",
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
                    "description": "The star code affiliate request",
                    "properties": {
                        "code": {
                            "description": "The star code affiliate code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.StarCodeAffiliateRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "400": {
            "description": "1: The code was invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The star code affiliate response",
                    "properties": {
                        "name": {
                            "description": "The star code affiliate name",
                            "type": "string"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The star code affiliate user id",
                            "type": "integer"
                        },
                        "code": {
                            "description": "The star code affiliate code",
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

```json
{
    "Method": "DELETE",
    "Description": "Removes the star code affiliate supporter for the authenticated user",
    "Consumes": "NONE",
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
                    },
                    "type": "object"
                }
            }
        },
        "500": {
            "description": "0: An unknown error occured."
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
    "Description": "Gets a star code affiliate supporter for the authenticated user",
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
                    "description": "The star code affiliate response",
                    "properties": {
                        "name": {
                            "description": "The star code affiliate name",
                            "type": "string"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "The star code affiliate user id",
                            "type": "integer"
                        },
                        "code": {
                            "description": "The star code affiliate code",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: An unknown error occured."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/description
```json
{
    "Method": "POST",
    "Description": "Update the user's description",
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
                    "description": "The description request",
                    "properties": {
                        "description": {
                            "description": "The description",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.AccountInformation.Api.Models.DescriptionRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "400": {
            "description": "1: User not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The description response",
                    "properties": {
                        "description": {
                            "description": "The description",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "3: This feature is currently disabled. Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: PIN is locked."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get the user's description",
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
                    "description": "The description response",
                    "properties": {
                        "description": {
                            "description": "The description",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: User not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/metadata
```json
{
    "Method": "GET",
    "Description": "Get the metadata",
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
                    "description": "The metadata response",
                    "properties": {
                        "isUserBlockEndpointsUpdated": {
                            "type": "boolean"
                        },
                        "MaxUserDescriptionLength": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "isAccountSettingsPolicyEnabled": {
                            "type": "boolean"
                        },
                        "isPhoneNumberEnabled": {
                            "type": "boolean"
                        },
                        "isUserDescriptionEnabled": {
                            "type": "boolean"
                        },
                        "isAllowedNotificationsEndpointDisabled": {
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


## /v1/gender
```json
{
    "Method": "POST",
    "Description": "Update the user's gender",
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
                    "description": "The gender request",
                    "properties": {
                        "gender": {
                            "description": "The gender",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.AccountInformation.Api.Models.GenderRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "400": {
            "description": "1: User not found.\r\n6: The gender provided is invalid."
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
            "description": "0: Token Validation Failed\r\n2: PIN is locked."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get the user's gender",
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
                    "description": "The gender response",
                    "properties": {
                        "gender": {
                            "format": "int32",
                            "description": "The gender",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: User not found."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/phone/delete
```json
{
    "Method": "POST",
    "Description": "Delete Phone",
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
                    "description": "The phone request",
                    "properties": {
                        "password": {
                            "description": "Password",
                            "type": "string"
                        },
                        "phone": {
                            "description": "The Phone number",
                            "type": "string"
                        },
                        "prefix": {
                            "description": "The Phone Prefix",
                            "type": "string"
                        },
                        "countryCode": {
                            "description": "The country Code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.PhoneRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "503": {
            "description": "1: This feature is currently disabled. Please try again later."
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
            "description": "6: Flooded"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n4: Account Pin Locked\r\n5: Incorrect Password"
        }
    },
}
```
<hr>


## /v1/xbox-live/consecutive-login-days
```json
{
    "Method": "GET",
    "Description": "Returns number of consecutive login days for xbox users",
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
                    "description": "The consecutive login days response",
                    "properties": {
                        "count": {
                            "format": "int32",
                            "description": "Consecutive login days",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n7: The account is not connected to an Xbox Live account"
        }
    },
}
```
<hr>


## /v1/phone/resend
```json
{
    "Method": "POST",
    "Description": "Resend Phone code",
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
                    "description": "The phone request",
                    "properties": {
                        "password": {
                            "description": "Password",
                            "type": "string"
                        },
                        "phone": {
                            "description": "The Phone number",
                            "type": "string"
                        },
                        "prefix": {
                            "description": "The Phone Prefix",
                            "type": "string"
                        },
                        "countryCode": {
                            "description": "The country Code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.PhoneRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "503": {
            "description": "1: This feature is currently disabled. Please try again later."
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
            "description": "6: Flooded"
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/phone
```json
{
    "Method": "POST",
    "Description": "Set Phone Number",
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
                    "description": "The phone request",
                    "properties": {
                        "password": {
                            "description": "Password",
                            "type": "string"
                        },
                        "phone": {
                            "description": "The Phone number",
                            "type": "string"
                        },
                        "prefix": {
                            "description": "The Phone Prefix",
                            "type": "string"
                        },
                        "countryCode": {
                            "description": "The country Code",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.PhoneRequest}"
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occured."
        },
        "400": {
            "description": "2: Invalid Phone Number\r\n3: Phone Number Already Associated"
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
            "description": "1: This feature is currently disabled. Please try again later."
        },
        "429": {
            "description": "6: Flooded"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n4: Account Pin Locked\r\n5: Incorrect Password"
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get Verified Phone Number",
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
                    "description": "The phone response",
                    "properties": {
                        "countryCode": {
                            "description": "The country Code",
                            "type": "string"
                        },
                        "isVerified": {
                            "description": "Is the phone verified",
                            "type": "boolean"
                        },
                        "prefix": {
                            "description": "The Phone Prefix",
                            "type": "string"
                        },
                        "phone": {
                            "description": "The Phone number",
                            "type": "string"
                        },
                        "verificationCodeLength": {
                            "format": "int32",
                            "description": "Verification Code Length",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: An unknown error occured."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/roblox-badges
```json
{
    "Method": "GET",
    "Description": "Returns a list of Roblox badges belonging to a user.",
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
                "items": {
                    "$ref": {
                        "properties": {
                            "id": {
                                "format": "int32",
                                "description": "The ID belonging to this Roblox badge.",
                                "type": "integer"
                            },
                            "imageUrl": {
                                "description": "The URL corresponding to the image which represents this Roblox badge.",
                                "type": "string"
                            },
                            "name": {
                                "description": "The name of this Roblox badge.",
                                "type": "string"
                            },
                            "description": {
                                "description": "The description belonging to this Roblox badge.",
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
}
```
<hr>


## /v1/email/verify
```json
{
    "Method": "POST",
    "Description": "Verify the user's email address from token",
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
                    "description": "Verify Email Request",
                    "properties": {
                        "ticket": {
                            "description": "Ticket to verify email",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AccountInformation.Api.Models.VerifyEmailRequest}"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The verify email response",
                    "properties": {
                        "verifiedUserHatAssetId": {
                            "type": "integer",
                            "format": "int32"
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


