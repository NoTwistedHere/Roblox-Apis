# <b>Notifications Api v2</b>

## /v2/stream-notifications/get-recent
```json
{
    "Method": "GET",
    "Description": "Gets the recent entries from the notification stream",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "startIndex",
            "format": "int32",
            "description": "Index to start the entries from. (Optional : Defaults to 0 which means the most recent entry)",
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "maxRows",
            "format": "int32",
            "description": "Number of entries to be returned. (Optional : Defaults to 10 entries)",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "isInteracted": {
                                "description": "Has the user interacted with the notification stream entry",
                                "type": "boolean"
                            },
                            "notificationSourceType": {
                                "enum": {
                                    "1": "Test",
                                    "2": "FriendRequestReceived",
                                    "3": "FriendRequestAccepted",
                                    "4": "PartyInviteReceived",
                                    "5": "PartyMemberJoined",
                                    "6": "ChatNewMessage",
                                    "7": "PrivateMessageReceived",
                                    "8": "UserAddedToPrivateServerWhiteList",
                                    "9": "ConversationUniverseChanged",
                                    "10": "TeamCreateInvite",
                                    "11": "GameUpdate",
                                    "12": "DeveloperMetricsAvailable"
                                },
                                "description": "Type of the notification source",
                                "type": "string"
                            },
                            "metadataCollection": {
                                "items": {
                                    "type": "object"
                                },
                                "type": "array",
                                "description": "List of metadata objects showing more details related to the notification stream entry"
                            },
                            "eventCount": {
                                "format": "int64",
                                "description": "Count of events corresponding to the group of notification stream entry",
                                "type": "integer"
                            },
                            "id": {
                                "type": "string",
                                "format": "uuid",
                                "description": "Id of the notification stream entry",
                                "example": "00000000-0000-0000-0000-000000000000"
                            },
                            "eventDate": {
                                "format": "date-time",
                                "description": "Datetime when the notification stream entry event had occured",
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


## /v2/stream-notifications/suppress-prompt
```json
{
    "Method": "POST",
    "Description": "Supresses the notification stream prompt",
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
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/notifications/notification-source-types/allow
```json
{
    "Method": "POST",
    "Description": "Allows the specified notification source types",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "sourceType": {
                            "enum": {
                                "1": "Test",
                                "2": "FriendRequestReceived",
                                "3": "FriendRequestAccepted",
                                "4": "PartyInviteReceived",
                                "5": "PartyMemberJoined",
                                "6": "ChatNewMessage",
                                "7": "PrivateMessageReceived",
                                "8": "UserAddedToPrivateServerWhiteList",
                                "9": "ConversationUniverseChanged",
                                "10": "TeamCreateInvite",
                                "11": "GameUpdate",
                                "12": "DeveloperMetricsAvailable"
                            },
                            "description": "Type of the notification source",
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
            "description": "Http response message",
            "schema": {
                "type": "object"
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


## /v2/notifications/get-rollout-settings
```json
{
    "Method": "GET",
    "Description": "Gets the notification settings related to rollout",
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
                "type": "string"
            },
            "required": true,
            "description": "names of features to get the corresponding rollout values",
            "name": "featureNames"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "rollOutFeatureEnabledList": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "isValidFeature": {
                                            "description": "Is the feature name specified a valid feature",
                                            "type": "boolean"
                                        },
                                        "isRolloutEnabled": {
                                            "description": "Is the rollout feature enabled",
                                            "type": "boolean"
                                        },
                                        "featureName": {
                                            "description": "Name of the rollout feature\r\nValid Feature Names : \"PushNotifications\" / \"NotificationStream\" / \"NativeSignalR\"",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of models to specify feature and corresponding enable/disable pairs"
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


## /v2/push-notifications/deregister-current-device
```json
{
    "Method": "POST",
    "Description": "De-register current device to diable push notifications",
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
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/chrome-manifest
```json
{
    "Method": "GET",
    "Description": "Get Chrome Manifest to link GCM project to Chrome Browser",
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
                    "description": "Chrome Manifest to link GCM project to Chrome browser",
                    "properties": {
                        "gcm_sender_id": {
                            "type": "string"
                        },
                        "name": {
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


## /v2/notifications/notification-source-types/opt-out
```json
{
    "Method": "POST",
    "Description": "Opts out from the specified notification source types",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "sourceType": {
                            "enum": {
                                "1": "Test",
                                "2": "FriendRequestReceived",
                                "3": "FriendRequestAccepted",
                                "4": "PartyInviteReceived",
                                "5": "PartyMemberJoined",
                                "6": "ChatNewMessage",
                                "7": "PrivateMessageReceived",
                                "8": "UserAddedToPrivateServerWhiteList",
                                "9": "ConversationUniverseChanged",
                                "10": "TeamCreateInvite",
                                "11": "GameUpdate",
                                "12": "DeveloperMetricsAvailable"
                            },
                            "description": "Type of the notification source",
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
            "description": "Http response message",
            "schema": {
                "type": "object"
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


## /v2/push-notifications/get-destinations
```json
{
    "Method": "GET",
    "Description": "Gets valid destinations associated with the signed user",
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
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "destinations": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "supportsUpdateNotifications": {
                                            "description": "Is Update notification feature supported",
                                            "type": "boolean"
                                        },
                                        "platform": {
                                            "enum": {
                                                "1": "ChromeOnDesktop",
                                                "2": "AndroidNative",
                                                "3": "FirefoxOnDesktop",
                                                "4": "IOSNative",
                                                "5": "AndroidAmazon",
                                                "6": "IOSTencent",
                                                "7": "AndroidTencentService"
                                            },
                                            "description": "Platform for the corresponding notification",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the destination",
                                            "type": "string"
                                        },
                                        "user": {
                                            "$ref": {
                                                "properties": {
                                                    "name": {
                                                        "description": "Name of the user",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "format": "int64",
                                                        "description": "Id of the user",
                                                        "type": "integer"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "Notification user"
                                        },
                                        "userPushNotificationDestinationId": {
                                            "format": "int64",
                                            "description": "Destination Id for the push notification",
                                            "type": "integer"
                                        },
                                        "notificationToken": {
                                            "description": "Token for the corresponding notification",
                                            "type": "string"
                                        },
                                        "application": {
                                            "description": "application for the corresponding notification\r\nExample : \"Roblox\"",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of destinations for the user push notification"
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


## /v2/push-notifications/notification-ids
```json
{
    "Method": "GET",
    "Description": "Gets the notificationIds for the specified notification token",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "notificationToken",
            "required": true,
            "description": "Token for the notification"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "limit",
            "format": "int32",
            "required": true,
            "description": "Max number of notifications to get"
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "cursor",
            "format": "int32",
            "description": "starting point to get the notifications",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "ids": {
                            "items": {
                                "format": "uuid",
                                "example": "00000000-0000-0000-0000-000000000000",
                                "type": "string"
                            },
                            "type": "array",
                            "description": "List of notification Ids"
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


## /v2/notifications/get-settings
```json
{
    "Method": "GET",
    "Description": "Gets settings related to notifications for the signed in user",
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
                        "optedOutReceiverDestinationTypes": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "DesktopPush",
                                    "2": "MobilePush",
                                    "3": "NotificationStream"
                                }
                            },
                            "type": "array",
                            "description": "List of strings to specify the opted out receiver destination types"
                        },
                        "notificationBandSettings": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "notificationSourceType": {
                                            "enum": {
                                                "1": "Test",
                                                "2": "FriendRequestReceived",
                                                "3": "FriendRequestAccepted",
                                                "4": "PartyInviteReceived",
                                                "5": "PartyMemberJoined",
                                                "6": "ChatNewMessage",
                                                "7": "PrivateMessageReceived",
                                                "8": "UserAddedToPrivateServerWhiteList",
                                                "9": "ConversationUniverseChanged",
                                                "10": "TeamCreateInvite",
                                                "11": "GameUpdate",
                                                "12": "DeveloperMetricsAvailable"
                                            },
                                            "description": "Type of the notification",
                                            "type": "string"
                                        },
                                        "isSetByReceiver": {
                                            "description": "Is the corresponding notification set by the receiver",
                                            "type": "boolean"
                                        },
                                        "isOverridable": {
                                            "description": "Is the corresponding notification overridable",
                                            "type": "boolean"
                                        },
                                        "isEnabled": {
                                            "description": "Is the corresponding notification enabled",
                                            "type": "boolean"
                                        },
                                        "receiverDestinationType": {
                                            "enum": {
                                                "1": "DesktopPush",
                                                "2": "MobilePush",
                                                "3": "NotificationStream"
                                            },
                                            "description": "Type of the destination of the notification",
                                            "type": "string"
                                        },
                                        "pushNotificationDestinationPreferences": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "platform": {
                                                            "enum": {
                                                                "1": "ChromeOnDesktop",
                                                                "2": "AndroidNative",
                                                                "3": "FirefoxOnDesktop",
                                                                "4": "IOSNative",
                                                                "5": "AndroidAmazon",
                                                                "6": "IOSTencent",
                                                                "7": "AndroidTencentService"
                                                            },
                                                            "description": "Platform corresponding to the destination setting",
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "description": "Name of the destination setting",
                                                            "type": "string"
                                                        },
                                                        "isEnabled": {
                                                            "description": "Is the notification for the corresponding destination enabled",
                                                            "type": "boolean"
                                                        },
                                                        "destinationId": {
                                                            "format": "int64",
                                                            "description": "Id of the destination",
                                                            "type": "integer"
                                                        },
                                                        "isSetByReceiver": {
                                                            "description": "Is the notification for the corresponding destination set by the receiver",
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "List of models that specify the different preferences of push notification destinations for the user"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Settings model for notifications"
                        },
                        "optedOutNotificationSourceTypes": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Test",
                                    "2": "FriendRequestReceived",
                                    "3": "FriendRequestAccepted",
                                    "4": "PartyInviteReceived",
                                    "5": "PartyMemberJoined",
                                    "6": "ChatNewMessage",
                                    "7": "PrivateMessageReceived",
                                    "8": "UserAddedToPrivateServerWhiteList",
                                    "9": "ConversationUniverseChanged",
                                    "10": "TeamCreateInvite",
                                    "11": "GameUpdate",
                                    "12": "DeveloperMetricsAvailable"
                                }
                            },
                            "type": "array",
                            "description": "List of strings to specify the opted out notification source types"
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


## /v2/push-notifications/mark-as-read
```json
{
    "Method": "POST",
    "Description": "Marks the specified notification as read.",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "platformType": {
                            "enum": {
                                "1": "ChromeOnDesktop",
                                "2": "AndroidNative",
                                "3": "FirefoxOnDesktop",
                                "4": "IOSNative",
                                "5": "AndroidAmazon",
                                "6": "IOSTencent",
                                "7": "AndroidTencentService"
                            },
                            "description": "Platform type sending the mark-as-read notification",
                            "type": "string"
                        },
                        "notificationId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "Id of the Notification",
                            "example": "00000000-0000-0000-0000-000000000000"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/notifications/receiver-destination-types/allow
```json
{
    "Method": "POST",
    "Description": "Allows the specified notification receiver destination types",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "destinationType": {
                            "enum": {
                                "1": "DesktopPush",
                                "2": "MobilePush",
                                "3": "NotificationStream"
                            },
                            "description": "Type of notification receiver destination type",
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
            "description": "Http response message",
            "schema": {
                "type": "object"
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


## /v2/stream-notifications/get-prompt-settings
```json
{
    "Method": "GET",
    "Description": "Gets the Notification stream prompt settings",
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
                        "hasUserInteractedWithNotificationStream": {
                            "description": "Has user interacted with the notification stream",
                            "type": "boolean"
                        },
                        "showNotificationStreamPrompt": {
                            "description": "Should the notification stream prompt be visible for the user",
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


## /v2/push-notifications/register-android-amazon
```json
{
    "Method": "POST",
    "Description": "Register Amazon Android for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "oldNotificationToken": {
                            "description": "Old notification token",
                            "type": "string"
                        },
                        "deviceName": {
                            "description": "Name of the requesting device",
                            "type": "string"
                        },
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "authorizeForUser": {
                            "description": "Is call authorized for the user",
                            "type": "boolean"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/stream-notifications/get-latest-game-updates
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
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "List of universe IDs",
            "name": "universeIds"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "sinceDateTime",
            "description": "For retrieving only updates that created after a time point.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Model for a game update message to be displayed in notification stream.",
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
                            "rootPlaceId": {
                                "format": "int64",
                                "description": "ID of the game.",
                                "type": "integer"
                            },
                            "content": {
                                "description": "Content of the update message.",
                                "type": "string"
                            },
                            "universeName": {
                                "description": "Name of the game.",
                                "type": "string"
                            }
                        }
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


## /v2/stream-notifications/game-update-notification-read
```json
{
    "Method": "POST",
    "Description": "Sends metrics when a Game Update Notification is Read from the Game Update Notifications Section of the Notification Stream",
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
                        "universeId": {
                            "format": "int64",
                            "description": "id of the universe whose notification was interacted with",
                            "type": "integer"
                        },
                        "createdOn": {
                            "description": "Date time string of the created on date of the notification formatted as unix timestamp",
                            "type": "string"
                        },
                        "currentUserId": {
                            "format": "int64",
                            "description": "Id of the user that is being tracked",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "requestModel"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/notifications/update-destination-setting
```json
{
    "Method": "POST",
    "Description": "Updates the notification destination setting",
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
                        "isEnabled": {
                            "description": "Is Notification enabled for tje destination",
                            "type": "boolean"
                        },
                        "notificationSourceType": {
                            "enum": {
                                "1": "Test",
                                "2": "FriendRequestReceived",
                                "3": "FriendRequestAccepted",
                                "4": "PartyInviteReceived",
                                "5": "PartyMemberJoined",
                                "6": "ChatNewMessage",
                                "7": "PrivateMessageReceived",
                                "8": "UserAddedToPrivateServerWhiteList",
                                "9": "ConversationUniverseChanged",
                                "10": "TeamCreateInvite",
                                "11": "GameUpdate",
                                "12": "DeveloperMetricsAvailable"
                            },
                            "description": "Notification source type",
                            "type": "string"
                        },
                        "destinationId": {
                            "format": "int64",
                            "description": "Notification destination Id",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "requestModel"
        }
    },
    "Responses": {
        "200": {
            "description": "Http response Message",
            "schema": {
                "type": "object"
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


## /v2/stream-notifications/metadata
```json
{
    "Method": "GET",
    "Description": "Get Notification Stream metadata.",
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
                        "bannerDismissTimeSpan": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "canLaunchGameFromGameUpdate": {
                            "type": "boolean"
                        },
                        "signalRDisconnectionResponseInMilliseconds": {
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/register-firefox
```json
{
    "Method": "POST",
    "Description": "Registers Firefox for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "notificationEndpoint": {
                            "description": "Endpoint for the notification",
                            "type": "string"
                        },
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "initiatedByUser": {
                            "description": "Is the call initiated by the user",
                            "type": "boolean"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/notifications/receiver-destination-types/opt-out
```json
{
    "Method": "POST",
    "Description": "Opts out from the specified notification receiver destination types",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "destinationType": {
                            "enum": {
                                "1": "DesktopPush",
                                "2": "MobilePush",
                                "3": "NotificationStream"
                            },
                            "description": "Type of notification receiver destination type",
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
            "description": "Http response message",
            "schema": {
                "type": "object"
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


## /v2/stream-notifications/clear-unread
```json
{
    "Method": "POST",
    "Description": "Clears the unread Notification stream count",
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
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/notifications/update-notification-settings
```json
{
    "Method": "POST",
    "Description": "Updated the notification band settings",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "updatedSettings": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "isEnabled": {
                                            "description": "Is the notification band enabled",
                                            "type": "boolean"
                                        },
                                        "notificationSourceType": {
                                            "enum": {
                                                "1": "Test",
                                                "2": "FriendRequestReceived",
                                                "3": "FriendRequestAccepted",
                                                "4": "PartyInviteReceived",
                                                "5": "PartyMemberJoined",
                                                "6": "ChatNewMessage",
                                                "7": "PrivateMessageReceived",
                                                "8": "UserAddedToPrivateServerWhiteList",
                                                "9": "ConversationUniverseChanged",
                                                "10": "TeamCreateInvite",
                                                "11": "GameUpdate",
                                                "12": "DeveloperMetricsAvailable"
                                            },
                                            "description": "Type of notication source",
                                            "type": "string"
                                        },
                                        "receiverDestinationType": {
                                            "enum": {
                                                "1": "DesktopPush",
                                                "2": "MobilePush",
                                                "3": "NotificationStream"
                                            },
                                            "description": "Type of receiver destination type",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of notification band settings model"
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
            "description": "Http response Message",
            "schema": {
                "type": "object"
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


## /v2/stream-notifications/mark-interacted
```json
{
    "Method": "POST",
    "Description": "Marks a Notification Stream Entry as Interacted",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "eventId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "Event Id to be marked interacted",
                            "example": "00000000-0000-0000-0000-000000000000"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "eventId (Guid) : Id corresponding to the Notification stream Entry to be marked as Interacted"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/get-current-device-destination
```json
{
    "Method": "GET",
    "Description": "Gets the current device destination",
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
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "destination": {
                            "$ref": {
                                "properties": {
                                    "supportsUpdateNotifications": {
                                        "description": "Is Update notification feature supported",
                                        "type": "boolean"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Platform for the corresponding notification",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the destination",
                                        "type": "string"
                                    },
                                    "user": {
                                        "$ref": {
                                            "properties": {
                                                "name": {
                                                    "description": "Name of the user",
                                                    "type": "string"
                                                },
                                                "userId": {
                                                    "format": "int64",
                                                    "description": "Id of the user",
                                                    "type": "integer"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Notification user"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Destination Id for the push notification",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Token for the corresponding notification",
                                        "type": "string"
                                    },
                                    "application": {
                                        "description": "application for the corresponding notification\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Notification destination for push"
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


## /v2/push-notifications/deregister-all-devices
```json
{
    "Method": "POST",
    "Description": "De-register all devices to disable push notifications",
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
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/register-android-native
```json
{
    "Method": "POST",
    "Description": "Register Android Native for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "oldNotificationToken": {
                            "description": "Old notification token",
                            "type": "string"
                        },
                        "deviceName": {
                            "description": "Name of the requesting device",
                            "type": "string"
                        },
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "authorizeForUser": {
                            "description": "Is this call authorized for user",
                            "type": "boolean"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/register-android-tencent-service
```json
{
    "Method": "POST",
    "Description": "Register Android Tencent service device for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "deviceName": {
                            "description": "Name of the requesting device",
                            "type": "string"
                        },
                        "destinationIdentifier": {
                            "description": "Identifier string for the destination",
                            "type": "string"
                        },
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "authorizeForUser": {
                            "description": "Is call authorized for user",
                            "type": "boolean"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/stream-notifications/game-update-notification-interacted
```json
{
    "Method": "POST",
    "Description": "Sends metrics for when a Game Update Notification as Interacted. This differs from an the MarkStreamEntryInteracted function because it comes from an interaction
              on the Game Update Notifications section not the aggregated Notification Stream view",
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
                    "description": "The request model for game update notification interacted event",
                    "properties": {
                        "createdOnKey": {
                            "type": "string"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "id of the universe whose notification was interacted with",
                            "type": "integer"
                        },
                        "currentUserId": {
                            "format": "int64",
                            "description": "Id of the user that is being tracked",
                            "type": "integer"
                        },
                        "interactionType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Seen",
                                "3": "Played",
                                "4": "Unfollowed"
                            },
                            "description": "type of interaction, current usage includes [\"Seen\", \"Played\", \"Unfollowed\"] in the future we will expand it to include other actions",
                            "type": "string"
                        }
                    }
                }
            },
            "name": "requestModel"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/mark-category-as-read
```json
{
    "Method": "POST",
    "Description": "Mark all notifications in the specified stacking category up until the specified date read",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "latestNotificationId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "Id of the latest notification",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "notificationType": {
                            "enum": {
                                "1": "Test",
                                "2": "FriendRequestReceived",
                                "3": "FriendRequestAccepted",
                                "4": "PartyInviteReceived",
                                "5": "PartyMemberJoined",
                                "6": "ChatNewMessage",
                                "7": "PrivateMessageReceived",
                                "8": "UserAddedToPrivateServerWhiteList",
                                "9": "ConversationUniverseChanged",
                                "10": "TeamCreateInvite",
                                "11": "GameUpdate",
                                "12": "DeveloperMetricsAvailable"
                            },
                            "description": "Type of notification to mark category as read",
                            "type": "string"
                        },
                        "category": {
                            "description": "Category of notification",
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/stream-notifications/unread-count
```json
{
    "Method": "GET",
    "Description": "Gets the count of unread Notification stream entries",
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
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "unreadNotifications": {
                            "format": "int64",
                            "description": "Count of unread notifications in the stream",
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/metadata
```json
{
    "Method": "GET",
    "Description": "Gets the corresponding metadata for the specified notification",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "notificationToken",
            "required": true,
            "description": "Token for the notification"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "notificationId",
            "required": true,
            "description": "Id of the specified notification"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "metadata": {
                            "$ref": {
                                "properties": {
                                    "fallbackDelivered": {
                                        "description": "Is fallback delivered for the notification metadata",
                                        "type": "boolean"
                                    },
                                    "type": {
                                        "description": "Type of the push client notification",
                                        "type": "string"
                                    },
                                    "detail": {
                                        "description": "Details corresponding to the notification",
                                        "type": "object"
                                    },
                                    "notificationId": {
                                        "type": "string",
                                        "format": "uuid",
                                        "description": "Id for the push client notification",
                                        "example": "00000000-0000-0000-0000-000000000000"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Metadata for the push notification client"
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


## /v2/push-notifications/register-chrome
```json
{
    "Method": "POST",
    "Description": "Registers Chrome for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "initiatedByUser": {
                            "description": "Is the call initiated by user",
                            "type": "boolean"
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/push-notifications/register-ios-native
```json
{
    "Method": "POST",
    "Description": "Registers IOS device for push notifications",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "oldNotificationToken": {
                            "description": "Old notification token",
                            "type": "string"
                        },
                        "deviceName": {
                            "description": "Name of the requesting device",
                            "type": "string"
                        },
                        "authorizeForUser": {
                            "description": "Is call authorized for user",
                            "type": "boolean"
                        },
                        "destinationIdentifier": {
                            "description": "Identifier string for the destination",
                            "type": "string"
                        },
                        "notificationToken": {
                            "description": "Token for notification",
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
                            "type": "string"
                        },
                        "registration": {
                            "$ref": {
                                "properties": {
                                    "application": {
                                        "description": "Notification application\r\nExample : \"Roblox\"",
                                        "type": "string"
                                    },
                                    "platform": {
                                        "enum": {
                                            "1": "ChromeOnDesktop",
                                            "2": "AndroidNative",
                                            "3": "FirefoxOnDesktop",
                                            "4": "IOSNative",
                                            "5": "AndroidAmazon",
                                            "6": "IOSTencent",
                                            "7": "AndroidTencentService"
                                        },
                                        "description": "Notification platform",
                                        "type": "string"
                                    },
                                    "name": {
                                        "description": "Name of the push Notification destination",
                                        "type": "string"
                                    },
                                    "userPushNotificationDestinationId": {
                                        "format": "int64",
                                        "description": "Id of the push notification destination",
                                        "type": "integer"
                                    },
                                    "notificationToken": {
                                        "description": "Notification token",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Push notification registration model"
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
    "Internal": false
}
```
<hr>


## /v2/notifications/settings/realtime
```json
{
    "Method": "GET",
    "Description": "Gets the notification settings related to realtime",
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
                        "fallbackDomain": {
                            "description": "Fallback RealTime domain to use",
                            "type": "string"
                        },
                        "primaryDomain": {
                            "description": "Primary RealTime domain to use",
                            "type": "string"
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


## /v2/push-notifications/mark-interaction
```json
{
    "Method": "POST",
    "Description": "Marks Interaction status for push notification",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "notificationToken": {
                            "description": "Token for notification",
                            "type": "string"
                        },
                        "notificationId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "Id for notification",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "platformType": {
                            "enum": {
                                "1": "ChromeOnDesktop",
                                "2": "AndroidNative",
                                "3": "FirefoxOnDesktop",
                                "4": "IOSNative",
                                "5": "AndroidAmazon",
                                "6": "IOSTencent",
                                "7": "AndroidTencentService"
                            },
                            "description": "Type of platform making the request",
                            "type": "string"
                        },
                        "interactionType": {
                            "enum": {
                                "1": "Click",
                                "2": "Dismiss",
                                "3": "Action"
                            },
                            "description": "Type of interation with the notification",
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
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": false
}
```
<hr>


## /v2/verification/send-test-notification
```json
{
    "Method": "POST",
    "Description": "Send a test notification",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "testGuid",
            "description": "Test Guid (optional)",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Message for the success response",
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
    "Internal": true
}
```
<hr>


