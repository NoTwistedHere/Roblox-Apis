# Voice Api V1

## /v1/calls/{channelId}/users

```json
{
    "Method": "GET",
    "Description": "Returns a list of the ids for all users active/publishing in a call (except for the user making the request)",
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": {
        "channelId": "", // Required, The unique channel Id of the call
    },
    "Responses": {
        "200": {},
        "401": "0: Authorization has been denied for this request."
    }
}
```
<hr>

## /v1/settings

```json
{
    "Method": "GET",
    "Description": "Returns voice chat settings details for the requesting user",
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": "NONE",
    "Responses": {
        "200": {},
        "401": "0: Authorization has been denied for this request."
    }
}
```
<hr>

## /v1/turn/auth

```json
{
    "Method": "GET",
    "Description": "Returns turn server auth details for the requesting user",
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": "NONE",
    "Responses": {
        "200": {},
        "401": "0: Authorization has been denied for this request."
    }
}
```
<hr>

## /v1/calls/{channelId}/leave

```json
{
    "Method": "POST",
    "Description": "Leave a named voice channel",
    "Consumes": "NONE",
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": {
        "channelId": "" // Required
    },
    "Responses": {
        "200": {},
        "401": "0: Authorization has been denied for this request.",
        "403": "0: Token Validation Failed"
    }
}
```
<hr>

Am I fuck going to document all of this manually, I'll make something to do it for me in the morning... https://imgur.com/a/I6fBnL7

# Voice Api v2

## /v2/tokens

```json
{
    "Method": "POST",
    "Description": "Creates a new signed JWT token containing the channel and user details from the request.",
    "Consumes": [
        "application/json",
        "text/json",
        "application/x-www-form-urlencoded"
    ],
    "Produces": [
        "application/json",
        "text/json"
    ],
    "Parameters": {
        "requestModel": [], // [VoiceChannelTokenRequest], Required Body
        "Roblox-Place-Id": 1 // Int64, Optional Header
    },
    "Responses": {
        "200": {},
    }
}
```
<hr>