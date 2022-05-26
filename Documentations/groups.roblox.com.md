# <b>Groups Api v0</b>

## /v0/groups/{groupId}
```json
{
    "Method": "GET",
    "Description": "Retrieves information for the specified group ID.",
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
            "description": "The group id to fetch information for"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "Name": {
                            "type": "string"
                        },
                        "Description": {
                            "type": "string"
                        },
                        "Roles": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Name": {
                                            "type": "string"
                                        },
                                        "Rank": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Owner": {
                            "$ref": {
                                "properties": {
                                    "Name": {
                                        "type": "string"
                                    },
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "EmblemUrl": {
                            "type": "string"
                        },
                        "Id": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v0/groups/{groupId}/relationships
```json
{
    "Method": "GET",
    "Description": "Retrieves a paged list of allied or enemy groups.",
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
            "description": "The ID of the group"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "relationshipType",
            "enum": {
                "1": "Ally",
                "2": "Enemy"
            },
            "required": true,
            "description": "The group relationship type."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "page",
            "format": "int32",
            "description": "The page number to retrieve",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Returns a page of allied or enemy groups.",
                    "properties": {
                        "Groups": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Name": {
                                            "type": "string"
                                        },
                                        "Description": {
                                            "type": "string"
                                        },
                                        "Roles": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "Name": {
                                                            "type": "string"
                                                        },
                                                        "Rank": {
                                                            "type": "integer",
                                                            "format": "int32"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "Owner": {
                                            "$ref": {
                                                "properties": {
                                                    "Name": {
                                                        "type": "string"
                                                    },
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "EmblemUrl": {
                                            "type": "string"
                                        },
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The related groups."
                        },
                        "FinalPage": {
                            "description": "Whether the request is the final page.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v0/users/{userId}/groups
```json
{
    "Method": "GET",
    "Description": "Lists a user's groups.",
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
            "description": "The ID of the user"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "IsInClan": {
                                "type": "boolean"
                            },
                            "Role": {
                                "type": "string"
                            },
                            "Name": {
                                "type": "string"
                            },
                            "IsPrimary": {
                                "type": "boolean"
                            },
                            "Id": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "EmblemUrl": {
                                "type": "string"
                            },
                            "EmblemId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "Rank": {
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
        "404": {
            "description": "3: The user is invalid or does not exist."
        }
    },
}
```
<hr>


# <b>Groups Api v1</b>

## /v1/groups/{groupId}/claim-ownership
```json
{
    "Method": "POST",
    "Description": "Claims ownership of the group as the authenticated user",
    "Consumes": "NONE",
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
            "description": "The group Id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n11: You are not authorized to claim this group\r\n12: This group already has an owner\r\n13: Too many attempts to claim groups. Please try again later."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/change-owner
```json
{
    "Method": "POST",
    "Description": "Changes the group owner to another user.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "changeOwnerRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for changing the group owner.",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The user id.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request."
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
            "description": "0: Token Validation Failed\r\n17: You are not authorized to change the owner of this group.\r\n25: 2-Step Verification is required to make further transactions. Go to Settings > Security to complete 2-Step Verification."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n3: The user is invalid or does not exist.\r\n15: User is not a member of the group.\r\n16: The user does not have the necessary level of premium membership.\r\n24: You cannot perform this action with a locked pin."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/wall/posts/{postId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes a group wall post.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "integer",
            "name": "postId",
            "format": "int64",
            "required": true,
            "description": "The group wall post id."
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
            "description": "0: Token Validation Failed\r\n2: You do not have permission to access this group wall."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n3: The group wall post id is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/roles/{roleSetId}/users
```json
{
    "Method": "GET",
    "Description": "Gets a list of users in a group for a specific roleset.",
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
            "in": "path",
            "type": "integer",
            "name": "roleSetId",
            "format": "int32",
            "required": true,
            "description": "The group's role set id."
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by user group join date",
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
                                    "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                    "properties": {
                                        "username": {
                                            "type": "string"
                                        },
                                        "buildersClubMembershipType": {
                                            "enum": {
                                                "1": "None",
                                                "2": "BC",
                                                "3": "TBC",
                                                "4": "OBC",
                                                "5": "RobloxPremium"
                                            },
                                            "description": "The user's builders club membership type",
                                            "type": "string"
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
            "description": "2: The roleset is invaid or does not exist."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/social-links/{socialLinkId}
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
            "name": "groupId",
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
            "description": "The {Roblox.Groups.Api.SocialLinkRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to configure this social link."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n3: The social link title is too long.\r\n4: The social link title cannot be empty.\r\n5: The social link url cannot be empty.\r\n6: The social link url was improperly formatted.\r\n7: The request was null.\r\n8: The requested group or social link was not found.\r\n9: The social link type is invalid.\r\n10: The social link is not for a group.\r\n12: The social link title was moderated.\r\n16: A social link with this type already exists on this group."
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
            "description": "11: Social links cannot be processed as this time."
        },
        "503": {
            "description": "11: Social links cannot be processed as this time."
        }
    },
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
            "name": "groupId",
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
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to configure this social link.\r\n13: Only users who are over thirteen years of age may edit social links."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n10: The social link is not for a group.\r\n15: The social link id doesn't match the group id."
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
            "description": "11: Social links cannot be processed as this time."
        }
    },
}
```
<hr>


## /v1/user/groups/pending
```json
{
    "Method": "GET",
    "Description": "Gets groups that the authenticated user has requested to join",
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
                                    "description": "A detailed group response model",
                                    "properties": {
                                        "description": {
                                            "description": "The group description",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group id",
                                            "type": "integer"
                                        },
                                        "owner": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The owner of the group"
                                        },
                                        "memberCount": {
                                            "format": "int32",
                                            "description": "The number of members in the group",
                                            "type": "integer"
                                        },
                                        "isBuildersClubOnly": {
                                            "description": "Whether the group is Builders Club only",
                                            "type": "boolean"
                                        },
                                        "isLocked": {
                                            "description": "Whether the group is locked",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "The group name",
                                            "type": "string"
                                        },
                                        "shout": {
                                            "$ref": {
                                                "properties": {
                                                    "created": {
                                                        "format": "date-time",
                                                        "description": "The shout's created time",
                                                        "type": "string"
                                                    },
                                                    "updated": {
                                                        "format": "date-time",
                                                        "description": "The shout's last updated time",
                                                        "type": "string"
                                                    },
                                                    "poster": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The shout's poster"
                                                    },
                                                    "body": {
                                                        "description": "The shout's message",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The group shout/status"
                                        },
                                        "publicEntryAllowed": {
                                            "description": "Whether the group is public (no approval required)",
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/audit-log
```json
{
    "Method": "GET",
    "Description": "Gets the Group's audit log",
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
            "description": "The id of the group the user is in."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "actionType",
            "enum": {
                "1": "DeletePost",
                "2": "RemoveMember",
                "3": "AcceptJoinRequest",
                "4": "DeclineJoinRequest",
                "5": "PostStatus",
                "6": "ChangeRank",
                "7": "BuyAd",
                "8": "SendAllyRequest",
                "9": "CreateEnemy",
                "10": "AcceptAllyRequest",
                "11": "DeclineAllyRequest",
                "12": "DeleteAlly",
                "13": "DeleteEnemy",
                "14": "AddGroupPlace",
                "15": "RemoveGroupPlace",
                "16": "CreateItems",
                "17": "ConfigureItems",
                "18": "SpendGroupFunds",
                "19": "ChangeOwner",
                "20": "Delete",
                "21": "AdjustCurrencyAmounts",
                "22": "Abandon",
                "23": "Claim",
                "24": "Rename",
                "25": "ChangeDescription",
                "26": "InviteToClan",
                "27": "KickFromClan",
                "28": "CancelClanInvite",
                "29": "BuyClan",
                "30": "CreateGroupAsset",
                "31": "UpdateGroupAsset",
                "32": "ConfigureGroupAsset",
                "33": "RevertGroupAsset",
                "34": "CreateGroupDeveloperProduct",
                "35": "ConfigureGroupGame",
                "36": "Lock",
                "37": "Unlock",
                "38": "CreateGamePass",
                "39": "CreateBadge",
                "40": "ConfigureBadge",
                "41": "SavePlace",
                "42": "PublishPlace",
                "43": "UpdateRolesetRank",
                "44": "UpdateRolesetData"
            },
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "description": "Filter for specific user id",
        },
        "4": {
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
        "5": {
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
        "6": {
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
                    "type": "object",
                    "description": "ApiPageResponse for group audit log",
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
                                    "description": "A group audit log response model",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "Date the group action was performed",
                                            "type": "string"
                                        },
                                        "actor": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A user group role response model",
                                                "properties": {
                                                    "role": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A group role response model",
                                                            "properties": {
                                                                "name": {
                                                                    "description": "The role name",
                                                                    "type": "string"
                                                                },
                                                                "id": {
                                                                    "format": "int64",
                                                                    "description": "The role id",
                                                                    "type": "integer"
                                                                },
                                                                "memberCount": {
                                                                    "format": "int64",
                                                                    "description": "The number of members in the role.",
                                                                    "type": "integer"
                                                                },
                                                                "description": {
                                                                    "description": "The role description",
                                                                    "type": "string"
                                                                },
                                                                "rank": {
                                                                    "format": "int32",
                                                                    "description": "The role rank",
                                                                    "type": "integer"
                                                                }
                                                            }
                                                        },
                                                        "description": "The user's group role"
                                                    },
                                                    "user": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The user"
                                                    }
                                                }
                                            },
                                            "description": "The auditors username"
                                        },
                                        "description": {
                                            "description": "Information on the action performed",
                                            "type": "object"
                                        },
                                        "actionType": {
                                            "description": "The action type",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "23: Insufficient permissions to complete the request."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/users
```json
{
    "Method": "POST",
    "Description": "Joins a group",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "joinGroupModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for joining group.",
                    "properties": {
                        "captchaToken": {
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        }
                    }
                }
            },
            "description": "Only supplied when captcha has been solved."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: You must pass the captcha test before joining this group.\r\n6: You are already in the maximum number of groups.\r\n9: You do not have the builders club membership necessary to join this group.\r\n14: You cannot join a closed group."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        },
        "409": {
            "description": "7: You have already requested to join this group.\r\n8: You are already a member of this group."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        },
        "429": {
            "description": "10: Too many attempts to join the group. Please try again later."
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
    "Description": "Gets a list of users in a group.",
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
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
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
                                    "description": "A user group role response model",
                                    "properties": {
                                        "role": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A group role response model",
                                                "properties": {
                                                    "name": {
                                                        "description": "The role name",
                                                        "type": "string"
                                                    },
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The role id",
                                                        "type": "integer"
                                                    },
                                                    "memberCount": {
                                                        "format": "int64",
                                                        "description": "The number of members in the role.",
                                                        "type": "integer"
                                                    },
                                                    "description": {
                                                        "description": "The role description",
                                                        "type": "string"
                                                    },
                                                    "rank": {
                                                        "format": "int32",
                                                        "description": "The role rank",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The user's group role"
                                        },
                                        "user": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The user"
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
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/status
```json
{
    "Method": "PATCH",
    "Description": "Sets group status",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "statusRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for setting the authenticated user's primary group.",
                    "properties": {
                        "message": {
                            "description": "The message to set the group status to.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.PostGroupStatusRequest}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "created": {
                            "format": "date-time",
                            "description": "The shout's created time",
                            "type": "string"
                        },
                        "updated": {
                            "format": "date-time",
                            "description": "The shout's last updated time",
                            "type": "string"
                        },
                        "poster": {
                            "$ref": {
                                "type": "object",
                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                "properties": {
                                    "username": {
                                        "type": "string"
                                    },
                                    "buildersClubMembershipType": {
                                        "enum": {
                                            "1": "None",
                                            "2": "BC",
                                            "3": "TBC",
                                            "4": "OBC",
                                            "5": "RobloxPremium"
                                        },
                                        "description": "The user's builders club membership type",
                                        "type": "string"
                                    },
                                    "userId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "The shout's poster"
                        },
                        "body": {
                            "description": "The shout's message",
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
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n6: You are not authorized to set the status of this group\r\n7: Missing group status content."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/search/lookup
```json
{
    "Method": "GET",
    "Description": "Looks up groups by a name. Prioritizes an exact match as the first result.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "groupName",
            "required": true,
            "description": "The group name."
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
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "memberCount": {
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
        "400": {
            "description": "1: Name is missing or has invalid characters."
        }
    },
}
```
<hr>


## /v1/groups/icon
```json
{
    "Method": "PATCH",
    "Description": "Updates the group icon.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "413": {
            "description": "0: Unknown error."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n23: Insufficient permissions to complete the request."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n16: The group icon is missing from the request.\r\n17: Too many requests.\r\n30: Invalid file type for group icon."
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
        }
    },
}
```
<hr>


## /v1/users/{userId}/friends/groups/roles
```json
{
    "Method": "GET",
    "Description": "Gets a list of all groups the specified users' friends are in.",
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
            "description": "The user id."
        }
    },
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
                                    "description": "A users group membership response model",
                                    "properties": {
                                        "groups": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "A group membership response model",
                                                    "properties": {
                                                        "group": {
                                                            "$ref": {
                                                                "type": "object",
                                                                "description": "A detailed group response model",
                                                                "properties": {
                                                                    "description": {
                                                                        "description": "The group description",
                                                                        "type": "string"
                                                                    },
                                                                    "id": {
                                                                        "format": "int64",
                                                                        "description": "The group id",
                                                                        "type": "integer"
                                                                    },
                                                                    "owner": {
                                                                        "$ref": {
                                                                            "type": "object",
                                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                                            "properties": {
                                                                                "username": {
                                                                                    "type": "string"
                                                                                },
                                                                                "buildersClubMembershipType": {
                                                                                    "enum": {
                                                                                        "1": "None",
                                                                                        "2": "BC",
                                                                                        "3": "TBC",
                                                                                        "4": "OBC",
                                                                                        "5": "RobloxPremium"
                                                                                    },
                                                                                    "description": "The user's builders club membership type",
                                                                                    "type": "string"
                                                                                },
                                                                                "userId": {
                                                                                    "type": "integer",
                                                                                    "format": "int64"
                                                                                },
                                                                                "displayName": {
                                                                                    "type": "string"
                                                                                }
                                                                            }
                                                                        },
                                                                        "description": "The owner of the group"
                                                                    },
                                                                    "memberCount": {
                                                                        "format": "int32",
                                                                        "description": "The number of members in the group",
                                                                        "type": "integer"
                                                                    },
                                                                    "isBuildersClubOnly": {
                                                                        "description": "Whether the group is Builders Club only",
                                                                        "type": "boolean"
                                                                    },
                                                                    "isLocked": {
                                                                        "description": "Whether the group is locked",
                                                                        "type": "boolean"
                                                                    },
                                                                    "name": {
                                                                        "description": "The group name",
                                                                        "type": "string"
                                                                    },
                                                                    "shout": {
                                                                        "$ref": {
                                                                            "properties": {
                                                                                "created": {
                                                                                    "format": "date-time",
                                                                                    "description": "The shout's created time",
                                                                                    "type": "string"
                                                                                },
                                                                                "updated": {
                                                                                    "format": "date-time",
                                                                                    "description": "The shout's last updated time",
                                                                                    "type": "string"
                                                                                },
                                                                                "poster": {
                                                                                    "$ref": {
                                                                                        "type": "object",
                                                                                        "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                                                        "properties": {
                                                                                            "username": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "buildersClubMembershipType": {
                                                                                                "enum": {
                                                                                                    "1": "None",
                                                                                                    "2": "BC",
                                                                                                    "3": "TBC",
                                                                                                    "4": "OBC",
                                                                                                    "5": "RobloxPremium"
                                                                                                },
                                                                                                "description": "The user's builders club membership type",
                                                                                                "type": "string"
                                                                                            },
                                                                                            "userId": {
                                                                                                "type": "integer",
                                                                                                "format": "int64"
                                                                                            },
                                                                                            "displayName": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        }
                                                                                    },
                                                                                    "description": "The shout's poster"
                                                                                },
                                                                                "body": {
                                                                                    "description": "The shout's message",
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "description": "The group shout/status"
                                                                    },
                                                                    "publicEntryAllowed": {
                                                                        "description": "Whether the group is public (no approval required)",
                                                                        "type": "boolean"
                                                                    }
                                                                }
                                                            },
                                                            "description": "The group"
                                                        },
                                                        "role": {
                                                            "$ref": {
                                                                "type": "object",
                                                                "description": "A group role response model",
                                                                "properties": {
                                                                    "name": {
                                                                        "description": "The role name",
                                                                        "type": "string"
                                                                    },
                                                                    "id": {
                                                                        "format": "int64",
                                                                        "description": "The role id",
                                                                        "type": "integer"
                                                                    },
                                                                    "memberCount": {
                                                                        "format": "int64",
                                                                        "description": "The number of members in the role.",
                                                                        "type": "integer"
                                                                    },
                                                                    "description": {
                                                                        "description": "The role description",
                                                                        "type": "string"
                                                                    },
                                                                    "rank": {
                                                                        "format": "int32",
                                                                        "description": "The role rank",
                                                                        "type": "integer"
                                                                    }
                                                                }
                                                            },
                                                            "description": "The role"
                                                        },
                                                        "isPrimaryGroup": {
                                                            "description": "Whether the group is the user's Primary Group",
                                                            "type": "boolean"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "The list of group memberships"
                                        },
                                        "user": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The group"
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
            "description": "3: The user is invalid or does not exist."
        },
        "401": {
            "description": "3: The user is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/payout-restriction
```json
{
    "Method": "GET",
    "Description": "Gets a value indicating whether the group can use payout feature",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for Group Payout Restriction",
                    "properties": {
                        "canUseOneTimePayout": {
                            "description": "Whether the group can use one-time payout feature.",
                            "type": "boolean"
                        },
                        "canUseRecurringPayout": {
                            "description": "Whether the group can use recurring payout feature.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "9: You don't have permission to view this group's payouts."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/relationships/{groupRelationshipType}
```json
{
    "Method": "GET",
    "Description": "Gets a group's relationships",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type, enemies or allies."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "model.startRowIndex",
            "format": "int32",
            "description": "The start index of the page request",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "model.maxRows",
            "format": "int32",
            "description": "The maximum number of rows for the page request, should be at least 1.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group relationships response model",
                    "properties": {
                        "totalGroupCount": {
                            "format": "int64",
                            "description": "The total number of groups for this relationship type",
                            "type": "integer"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        },
                        "nextRowIndex": {
                            "format": "int64",
                            "description": "The index for the next page of related groups",
                            "type": "integer"
                        },
                        "relationshipType": {
                            "enum": {
                                "1": "Allies",
                                "2": "Enemies"
                            },
                            "description": "The group relationship type",
                            "type": "string"
                        },
                        "relatedGroups": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A detailed group response model",
                                    "properties": {
                                        "description": {
                                            "description": "The group description",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group id",
                                            "type": "integer"
                                        },
                                        "owner": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The owner of the group"
                                        },
                                        "memberCount": {
                                            "format": "int32",
                                            "description": "The number of members in the group",
                                            "type": "integer"
                                        },
                                        "isBuildersClubOnly": {
                                            "description": "Whether the group is Builders Club only",
                                            "type": "boolean"
                                        },
                                        "isLocked": {
                                            "description": "Whether the group is locked",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "The group name",
                                            "type": "string"
                                        },
                                        "shout": {
                                            "$ref": {
                                                "properties": {
                                                    "created": {
                                                        "format": "date-time",
                                                        "description": "The shout's created time",
                                                        "type": "string"
                                                    },
                                                    "updated": {
                                                        "format": "date-time",
                                                        "description": "The shout's last updated time",
                                                        "type": "string"
                                                    },
                                                    "poster": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The shout's poster"
                                                    },
                                                    "body": {
                                                        "description": "The shout's message",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The group shout/status"
                                        },
                                        "publicEntryAllowed": {
                                            "description": "Whether the group is public (no approval required)",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The related or requested groups"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n4: Group relationship type or request type is invalid.\r\n8: Invalid or missing pagination parameters"
        }
    },
}
```
<hr>


## /v1/users/{userId}/groups/primary/role
```json
{
    "Method": "GET",
    "Description": "Gets a user's primary group.",
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
            "description": "The user id."
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group membership response model",
                    "properties": {
                        "group": {
                            "$ref": {
                                "type": "object",
                                "description": "A detailed group response model",
                                "properties": {
                                    "description": {
                                        "description": "The group description",
                                        "type": "string"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "The group id",
                                        "type": "integer"
                                    },
                                    "owner": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "username": {
                                                    "type": "string"
                                                },
                                                "buildersClubMembershipType": {
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC",
                                                        "5": "RobloxPremium"
                                                    },
                                                    "description": "The user's builders club membership type",
                                                    "type": "string"
                                                },
                                                "userId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "displayName": {
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "The owner of the group"
                                    },
                                    "memberCount": {
                                        "format": "int32",
                                        "description": "The number of members in the group",
                                        "type": "integer"
                                    },
                                    "isBuildersClubOnly": {
                                        "description": "Whether the group is Builders Club only",
                                        "type": "boolean"
                                    },
                                    "isLocked": {
                                        "description": "Whether the group is locked",
                                        "type": "boolean"
                                    },
                                    "name": {
                                        "description": "The group name",
                                        "type": "string"
                                    },
                                    "shout": {
                                        "$ref": {
                                            "properties": {
                                                "created": {
                                                    "format": "date-time",
                                                    "description": "The shout's created time",
                                                    "type": "string"
                                                },
                                                "updated": {
                                                    "format": "date-time",
                                                    "description": "The shout's last updated time",
                                                    "type": "string"
                                                },
                                                "poster": {
                                                    "$ref": {
                                                        "type": "object",
                                                        "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                        "properties": {
                                                            "username": {
                                                                "type": "string"
                                                            },
                                                            "buildersClubMembershipType": {
                                                                "enum": {
                                                                    "1": "None",
                                                                    "2": "BC",
                                                                    "3": "TBC",
                                                                    "4": "OBC",
                                                                    "5": "RobloxPremium"
                                                                },
                                                                "description": "The user's builders club membership type",
                                                                "type": "string"
                                                            },
                                                            "userId": {
                                                                "type": "integer",
                                                                "format": "int64"
                                                            },
                                                            "displayName": {
                                                                "type": "string"
                                                            }
                                                        }
                                                    },
                                                    "description": "The shout's poster"
                                                },
                                                "body": {
                                                    "description": "The shout's message",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "The group shout/status"
                                    },
                                    "publicEntryAllowed": {
                                        "description": "Whether the group is public (no approval required)",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "The group"
                        },
                        "role": {
                            "$ref": {
                                "type": "object",
                                "description": "A group role response model",
                                "properties": {
                                    "name": {
                                        "description": "The role name",
                                        "type": "string"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "The role id",
                                        "type": "integer"
                                    },
                                    "memberCount": {
                                        "format": "int64",
                                        "description": "The number of members in the role.",
                                        "type": "integer"
                                    },
                                    "description": {
                                        "description": "The role description",
                                        "type": "string"
                                    },
                                    "rank": {
                                        "format": "int32",
                                        "description": "The role rank",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The role"
                        },
                        "isPrimaryGroup": {
                            "description": "Whether the group is the user's Primary Group",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "4: User is invalid or does not exist."
        },
        "404": {
            "description": "3: The user specified does not have a primary group."
        }
    },
}
```
<hr>


## /v1/groups/search/metadata
```json
{
    "Method": "GET",
    "Description": "Get suggested groups and other miscellaneous information needed for the group/join page like flags",
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
                    "description": "Response Model For Group Search Metadata Endpoint",
                    "properties": {
                        "SuggestedGroupKeywords": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "Suggested Group Category translation keys"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "5: No Localized Version of group search category exists"
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/roles/permissions
```json
{
    "Method": "GET",
    "Description": "Gets all permissions for each role",
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
                                    "description": "A group role's permissions response model",
                                    "properties": {
                                        "permissions": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model for group permissions/&gt;",
                                                "properties": {
                                                    "groupEconomyPermissions": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "viewGroupPayouts": {
                                                                    "description": "Manage group games permission",
                                                                    "type": "boolean"
                                                                },
                                                                "manageGroupGames": {
                                                                    "description": "Manage group games permission",
                                                                    "type": "boolean"
                                                                },
                                                                "createItems": {
                                                                    "description": "Create items permission",
                                                                    "type": "boolean"
                                                                },
                                                                "manageItems": {
                                                                    "description": "Manage items permission",
                                                                    "type": "boolean"
                                                                },
                                                                "advertiseGroup": {
                                                                    "description": "Advertise group permission",
                                                                    "type": "boolean"
                                                                },
                                                                "spendGroupFunds": {
                                                                    "description": "Spend group funds permission",
                                                                    "type": "boolean"
                                                                },
                                                                "addGroupPlaces": {
                                                                    "description": "Add group places permission",
                                                                    "type": "boolean"
                                                                }
                                                            }
                                                        },
                                                        "description": "Group economy permissions"
                                                    },
                                                    "groupMembershipPermissions": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "changeRank": {
                                                                    "description": "View wall permission",
                                                                    "type": "boolean"
                                                                },
                                                                "removeMembers": {
                                                                    "description": "Delete from wall permission",
                                                                    "type": "boolean"
                                                                },
                                                                "inviteMembers": {
                                                                    "description": "Post to wall permission",
                                                                    "type": "boolean"
                                                                }
                                                            }
                                                        },
                                                        "description": "Group membership permissions"
                                                    },
                                                    "groupPostsPermissions": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing group posts permissions",
                                                            "properties": {
                                                                "postToStatus": {
                                                                    "description": "Post to status permission",
                                                                    "type": "boolean"
                                                                },
                                                                "viewStatus": {
                                                                    "description": "View status permission",
                                                                    "type": "boolean"
                                                                },
                                                                "postToWall": {
                                                                    "description": "Post to wall permission",
                                                                    "type": "boolean"
                                                                },
                                                                "deleteFromWall": {
                                                                    "description": "Delete from wall permission",
                                                                    "type": "boolean"
                                                                },
                                                                "viewWall": {
                                                                    "description": "View wall permission",
                                                                    "type": "boolean"
                                                                }
                                                            }
                                                        },
                                                        "description": "Group posts permissions"
                                                    },
                                                    "groupManagementPermissions": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "viewAuditLogs": {
                                                                    "description": "View audit logs permission",
                                                                    "type": "boolean"
                                                                },
                                                                "manageClan": {
                                                                    "description": "Manage clan permission",
                                                                    "type": "boolean"
                                                                },
                                                                "manageRelationships": {
                                                                    "description": "Manage group relationships permission",
                                                                    "type": "boolean"
                                                                }
                                                            }
                                                        },
                                                        "description": "Group management permissions"
                                                    }
                                                }
                                            },
                                            "description": "The group role's permissions"
                                        },
                                        "role": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A group role response model",
                                                "properties": {
                                                    "name": {
                                                        "description": "The role name",
                                                        "type": "string"
                                                    },
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The role id",
                                                        "type": "integer"
                                                    },
                                                    "memberCount": {
                                                        "format": "int64",
                                                        "description": "The number of members in the role.",
                                                        "type": "integer"
                                                    },
                                                    "description": {
                                                        "description": "The role description",
                                                        "type": "string"
                                                    },
                                                    "rank": {
                                                        "format": "int32",
                                                        "description": "The role rank",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The group role"
                                        },
                                        "groupId": {
                                            "format": "int64",
                                            "description": "The group id",
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
}
```
<hr>


## /v1/groups/{groupId}/settings
```json
{
    "Method": "PATCH",
    "Description": "Updates the group's settings",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group the user is in."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating a group's settings.",
                    "properties": {
                        "areGroupFundsVisible": {
                            "description": "Whether funds are publicly visible.",
                            "type": "boolean"
                        },
                        "isApprovalRequired": {
                            "description": "Whether public entry is allowed.",
                            "type": "boolean"
                        },
                        "areGroupGamesVisible": {
                            "description": "Whether games are publicly visible.",
                            "type": "boolean"
                        },
                        "areEnemiesAllowed": {
                            "description": "Whether enemy club declarations are allowed.",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "{Roblox.Groups.Api.UpdateGroupSettingsRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n23: Insufficient permissions to complete the request."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
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
            "description": "31: Service is currently unavailable."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the Group's settings",
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
            "description": "The id of the group the user is in."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for Group Settings",
                    "properties": {
                        "areEnemiesAllowed": {
                            "description": "Whether enemy club declarations are allowed.",
                            "type": "boolean"
                        },
                        "areGroupFundsVisible": {
                            "description": "Whether funds are publicly visible.",
                            "type": "boolean"
                        },
                        "isApprovalRequired": {
                            "description": "Whether public entry is allowed.",
                            "type": "boolean"
                        },
                        "areGroupGamesVisible": {
                            "description": "Whether games are publicly visible.",
                            "type": "boolean"
                        },
                        "isBuildersClubRequired": {
                            "description": "Whether Builder's Club is required.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "23: Insufficient permissions to complete the request."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/user/groups/primary
```json
{
    "Method": "POST",
    "Description": "Sets the authenticated user's primary group",
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
                    "description": "A request model for setting the authenticated user's primary group.",
                    "properties": {
                        "groupId": {
                            "format": "int64",
                            "description": "The group id.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request body containing the group id."
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
            "description": "0: Token Validation Failed\r\n2: You aren't a member of the group specified."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
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
    "Method": "DELETE",
    "Description": "Removes the authenticated user's primary group",
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


## /v1/users/{userId}/groups/roles
```json
{
    "Method": "GET",
    "Description": "Gets a list of all group roles for groups the specified user is in.",
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
            "description": "The user id."
        }
    },
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
                                    "description": "A group membership response model",
                                    "properties": {
                                        "group": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A detailed group response model",
                                                "properties": {
                                                    "description": {
                                                        "description": "The group description",
                                                        "type": "string"
                                                    },
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The group id",
                                                        "type": "integer"
                                                    },
                                                    "owner": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The owner of the group"
                                                    },
                                                    "memberCount": {
                                                        "format": "int32",
                                                        "description": "The number of members in the group",
                                                        "type": "integer"
                                                    },
                                                    "isBuildersClubOnly": {
                                                        "description": "Whether the group is Builders Club only",
                                                        "type": "boolean"
                                                    },
                                                    "isLocked": {
                                                        "description": "Whether the group is locked",
                                                        "type": "boolean"
                                                    },
                                                    "name": {
                                                        "description": "The group name",
                                                        "type": "string"
                                                    },
                                                    "shout": {
                                                        "$ref": {
                                                            "properties": {
                                                                "created": {
                                                                    "format": "date-time",
                                                                    "description": "The shout's created time",
                                                                    "type": "string"
                                                                },
                                                                "updated": {
                                                                    "format": "date-time",
                                                                    "description": "The shout's last updated time",
                                                                    "type": "string"
                                                                },
                                                                "poster": {
                                                                    "$ref": {
                                                                        "type": "object",
                                                                        "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                                        "properties": {
                                                                            "username": {
                                                                                "type": "string"
                                                                            },
                                                                            "buildersClubMembershipType": {
                                                                                "enum": {
                                                                                    "1": "None",
                                                                                    "2": "BC",
                                                                                    "3": "TBC",
                                                                                    "4": "OBC",
                                                                                    "5": "RobloxPremium"
                                                                                },
                                                                                "description": "The user's builders club membership type",
                                                                                "type": "string"
                                                                            },
                                                                            "userId": {
                                                                                "type": "integer",
                                                                                "format": "int64"
                                                                            },
                                                                            "displayName": {
                                                                                "type": "string"
                                                                            }
                                                                        }
                                                                    },
                                                                    "description": "The shout's poster"
                                                                },
                                                                "body": {
                                                                    "description": "The shout's message",
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "description": "The group shout/status"
                                                    },
                                                    "publicEntryAllowed": {
                                                        "description": "Whether the group is public (no approval required)",
                                                        "type": "boolean"
                                                    }
                                                }
                                            },
                                            "description": "The group"
                                        },
                                        "role": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A group role response model",
                                                "properties": {
                                                    "name": {
                                                        "description": "The role name",
                                                        "type": "string"
                                                    },
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The role id",
                                                        "type": "integer"
                                                    },
                                                    "memberCount": {
                                                        "format": "int64",
                                                        "description": "The number of members in the role.",
                                                        "type": "integer"
                                                    },
                                                    "description": {
                                                        "description": "The role description",
                                                        "type": "string"
                                                    },
                                                    "rank": {
                                                        "format": "int32",
                                                        "description": "The role rank",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "The role"
                                        },
                                        "isPrimaryGroup": {
                                            "description": "Whether the group is the user's Primary Group",
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
            "description": "3: The user is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/social-links
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
            "name": "groupId",
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
            "description": "The {Roblox.Groups.Api.SocialLinkRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to configure this social link."
        },
        "400": {
            "description": "3: The social link title is too long.\r\n4: The social link title cannot be empty.\r\n5: The social link url cannot be empty.\r\n7: The request was null.\r\n9: The social link type is invalid.\r\n12: The social link title was moderated."
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
                        "id": {
                            "format": "int64",
                            "description": "The id of the social link",
                            "type": "integer"
                        },
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
                            "description": "What type of social media (including Roblox Group) this points to",
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
            }
        },
        "404": {
            "description": "8: The requested group or social link was not found."
        },
        "503": {
            "description": "11: Social links cannot be processed as this time."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get social link data associated with a group",
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
            "description": "The Id of the game"
        }
    },
    "Responses": {
        "403": {
            "description": "13: Only users who are over thirteen years of age may edit social links."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
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
                                    "description": "A social link response from a create request",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The id of the social link",
                                            "type": "integer"
                                        },
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
                                            "description": "What type of social media (including Roblox Group) this points to",
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
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "11: Social links cannot be processed as this time."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/relationships/{groupRelationshipType}/requests
```json
{
    "Method": "POST",
    "Description": "Batch accepts group affiliate requests",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The type of group relationship being made"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "GroupIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The group ids being either accepted or declined"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.RelationshipsRequest}."
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

```json
{
    "Method": "DELETE",
    "Description": "Batch declines group affiliate requests",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The type of group relationship being made"
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "GroupIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The group ids being either accepted or declined"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.RelationshipsRequest}."
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

```json
{
    "Method": "GET",
    "Description": "Gets a group's relationship requests",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type of the request, only allies are supported."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "model.startRowIndex",
            "format": "int32",
            "description": "The start index of the page request",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "name": "model.maxRows",
            "format": "int32",
            "description": "The maximum number of rows for the page request, should be at least 1.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group relationships response model",
                    "properties": {
                        "totalGroupCount": {
                            "format": "int64",
                            "description": "The total number of groups for this relationship type",
                            "type": "integer"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        },
                        "nextRowIndex": {
                            "format": "int64",
                            "description": "The index for the next page of related groups",
                            "type": "integer"
                        },
                        "relationshipType": {
                            "enum": {
                                "1": "Allies",
                                "2": "Enemies"
                            },
                            "description": "The group relationship type",
                            "type": "string"
                        },
                        "relatedGroups": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A detailed group response model",
                                    "properties": {
                                        "description": {
                                            "description": "The group description",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group id",
                                            "type": "integer"
                                        },
                                        "owner": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The owner of the group"
                                        },
                                        "memberCount": {
                                            "format": "int32",
                                            "description": "The number of members in the group",
                                            "type": "integer"
                                        },
                                        "isBuildersClubOnly": {
                                            "description": "Whether the group is Builders Club only",
                                            "type": "boolean"
                                        },
                                        "isLocked": {
                                            "description": "Whether the group is locked",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "The group name",
                                            "type": "string"
                                        },
                                        "shout": {
                                            "$ref": {
                                                "properties": {
                                                    "created": {
                                                        "format": "date-time",
                                                        "description": "The shout's created time",
                                                        "type": "string"
                                                    },
                                                    "updated": {
                                                        "format": "date-time",
                                                        "description": "The shout's last updated time",
                                                        "type": "string"
                                                    },
                                                    "poster": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The shout's poster"
                                                    },
                                                    "body": {
                                                        "description": "The shout's message",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The group shout/status"
                                        },
                                        "publicEntryAllowed": {
                                            "description": "Whether the group is public (no approval required)",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The related or requested groups"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "5: You don't have permission to manage this group's relationships."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n4: Group relationship type or request type is invalid.\r\n8: Invalid or missing pagination parameters"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/roles
```json
{
    "Method": "GET",
    "Description": "Gets a list of the rolesets in a group.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group roles response model",
                    "properties": {
                        "roles": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A group role response model",
                                    "properties": {
                                        "name": {
                                            "description": "The role name",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The role id",
                                            "type": "integer"
                                        },
                                        "memberCount": {
                                            "format": "int64",
                                            "description": "The number of members in the role.",
                                            "type": "integer"
                                        },
                                        "description": {
                                            "description": "The role description",
                                            "type": "string"
                                        },
                                        "rank": {
                                            "format": "int32",
                                            "description": "The role rank",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The roles in the group"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/rolesets/create
```json
{
    "Method": "POST",
    "Description": "Creates new group roleset.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "description": {
                            "description": "The description of the roleset.",
                            "type": "string"
                        },
                        "usingGroupFunds": {
                            "description": "Setting to use group funds or not.",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The name of the roleset.",
                            "type": "string"
                        },
                        "rank": {
                            "format": "int32",
                            "description": "The rank/positioning of the roleset.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.Models.Request.CreateRoleSetRequest}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group role response model",
                    "properties": {
                        "name": {
                            "description": "The role name",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The role id",
                            "type": "integer"
                        },
                        "memberCount": {
                            "format": "int64",
                            "description": "The number of members in the role.",
                            "type": "integer"
                        },
                        "description": {
                            "description": "The role description",
                            "type": "string"
                        },
                        "rank": {
                            "format": "int32",
                            "description": "The role rank",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n9: You do not have permissions to perform this action."
        },
        "400": {
            "description": "0: Something went wrong.\r\n3: You do not have enough funds to purchase this role.\r\n5: Role name already exists.\r\n6: Rank value is out of bounds.\r\n7: The role name is too long.\r\n8: The role description is too long.\r\n10: This group does not exist.\r\n11: Failed to process payment to purchase role.\r\n12: Limit for roles have been reached on this group.\r\n14: Role name can not be empty.\r\n15: This role does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/roles/guest/permissions
```json
{
    "Method": "GET",
    "Description": "Gets the permissions for a group's guest roleset. These can be viewed by all (members and guests) users.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group role's permissions response model",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "A model for group permissions/&gt;",
                                "properties": {
                                    "groupEconomyPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewGroupPayouts": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "manageGroupGames": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "createItems": {
                                                    "description": "Create items permission",
                                                    "type": "boolean"
                                                },
                                                "manageItems": {
                                                    "description": "Manage items permission",
                                                    "type": "boolean"
                                                },
                                                "advertiseGroup": {
                                                    "description": "Advertise group permission",
                                                    "type": "boolean"
                                                },
                                                "spendGroupFunds": {
                                                    "description": "Spend group funds permission",
                                                    "type": "boolean"
                                                },
                                                "addGroupPlaces": {
                                                    "description": "Add group places permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group economy permissions"
                                    },
                                    "groupMembershipPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "changeRank": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                },
                                                "removeMembers": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "inviteMembers": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group membership permissions"
                                    },
                                    "groupPostsPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing group posts permissions",
                                            "properties": {
                                                "postToStatus": {
                                                    "description": "Post to status permission",
                                                    "type": "boolean"
                                                },
                                                "viewStatus": {
                                                    "description": "View status permission",
                                                    "type": "boolean"
                                                },
                                                "postToWall": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                },
                                                "deleteFromWall": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "viewWall": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group posts permissions"
                                    },
                                    "groupManagementPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewAuditLogs": {
                                                    "description": "View audit logs permission",
                                                    "type": "boolean"
                                                },
                                                "manageClan": {
                                                    "description": "Manage clan permission",
                                                    "type": "boolean"
                                                },
                                                "manageRelationships": {
                                                    "description": "Manage group relationships permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group management permissions"
                                    }
                                }
                            },
                            "description": "The group role's permissions"
                        },
                        "role": {
                            "$ref": {
                                "type": "object",
                                "description": "A group role response model",
                                "properties": {
                                    "name": {
                                        "description": "The role name",
                                        "type": "string"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "The role id",
                                        "type": "integer"
                                    },
                                    "memberCount": {
                                        "format": "int64",
                                        "description": "The number of members in the role.",
                                        "type": "integer"
                                    },
                                    "description": {
                                        "description": "The role description",
                                        "type": "string"
                                    },
                                    "rank": {
                                        "format": "int32",
                                        "description": "The role rank",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The group role"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/wall/users/{userId}/posts
```json
{
    "Method": "DELETE",
    "Description": "Deletes all group wall posts made by a specific user.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user id."
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
            "description": "0: Token Validation Failed\r\n2: You do not have permission to access this group wall."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n6: The user specified is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/membership
```json
{
    "Method": "GET",
    "Description": "Gets group membership information in the context of the authenticated user",
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
            "description": "The group Id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A user's group membership metadata response model",
                    "properties": {
                        "canConfigure": {
                            "description": "If the user can configure the group",
                            "type": "boolean"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        },
                        "areGroupGamesVisible": {
                            "description": "Whether group games are visible",
                            "type": "boolean"
                        },
                        "userRole": {
                            "$ref": {
                                "type": "object",
                                "description": "A user group role response model",
                                "properties": {
                                    "role": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A group role response model",
                                            "properties": {
                                                "name": {
                                                    "description": "The role name",
                                                    "type": "string"
                                                },
                                                "id": {
                                                    "format": "int64",
                                                    "description": "The role id",
                                                    "type": "integer"
                                                },
                                                "memberCount": {
                                                    "format": "int64",
                                                    "description": "The number of members in the role.",
                                                    "type": "integer"
                                                },
                                                "description": {
                                                    "description": "The role description",
                                                    "type": "string"
                                                },
                                                "rank": {
                                                    "format": "int32",
                                                    "description": "The role rank",
                                                    "type": "integer"
                                                }
                                            }
                                        },
                                        "description": "The user's group role"
                                    },
                                    "user": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "username": {
                                                    "type": "string"
                                                },
                                                "buildersClubMembershipType": {
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC",
                                                        "5": "RobloxPremium"
                                                    },
                                                    "description": "The user's builders club membership type",
                                                    "type": "string"
                                                },
                                                "userId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "displayName": {
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "The user"
                                    }
                                }
                            },
                            "description": "User group role information"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "A model for group permissions/&gt;",
                                "properties": {
                                    "groupEconomyPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewGroupPayouts": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "manageGroupGames": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "createItems": {
                                                    "description": "Create items permission",
                                                    "type": "boolean"
                                                },
                                                "manageItems": {
                                                    "description": "Manage items permission",
                                                    "type": "boolean"
                                                },
                                                "advertiseGroup": {
                                                    "description": "Advertise group permission",
                                                    "type": "boolean"
                                                },
                                                "spendGroupFunds": {
                                                    "description": "Spend group funds permission",
                                                    "type": "boolean"
                                                },
                                                "addGroupPlaces": {
                                                    "description": "Add group places permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group economy permissions"
                                    },
                                    "groupMembershipPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "changeRank": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                },
                                                "removeMembers": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "inviteMembers": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group membership permissions"
                                    },
                                    "groupPostsPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing group posts permissions",
                                            "properties": {
                                                "postToStatus": {
                                                    "description": "Post to status permission",
                                                    "type": "boolean"
                                                },
                                                "viewStatus": {
                                                    "description": "View status permission",
                                                    "type": "boolean"
                                                },
                                                "postToWall": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                },
                                                "deleteFromWall": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "viewWall": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group posts permissions"
                                    },
                                    "groupManagementPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewAuditLogs": {
                                                    "description": "View audit logs permission",
                                                    "type": "boolean"
                                                },
                                                "manageClan": {
                                                    "description": "Manage clan permission",
                                                    "type": "boolean"
                                                },
                                                "manageRelationships": {
                                                    "description": "Manage group relationships permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group management permissions"
                                    }
                                }
                            },
                            "description": "The group role's permissions"
                        },
                        "isPendingJoin": {
                            "description": "Whether there has been a request to join this group",
                            "type": "boolean"
                        },
                        "isPrimary": {
                            "description": "Whether the group is primary",
                            "type": "boolean"
                        },
                        "areEnemiesAllowed": {
                            "description": "Whether enemies are allowed",
                            "type": "boolean"
                        },
                        "areGroupFundsVisible": {
                            "description": "Whether group funds are visible",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/payouts
```json
{
    "Method": "POST",
    "Description": "Pays out a user in Robux.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Multi-payout request information.",
                    "properties": {
                        "PayoutType": {
                            "enum": {
                                "1": "FixedAmount",
                                "2": "Percentage"
                            },
                            "description": "The {Roblox.Groups.Api.PayoutType}.",
                            "type": "string"
                        },
                        "Recipients": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A request model for paying out Robux.",
                                    "properties": {
                                        "amount": {
                                            "format": "int64",
                                            "description": "The amount to payout.",
                                            "type": "integer"
                                        },
                                        "recipientType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "description": "The recipient type.",
                                            "type": "string"
                                        },
                                        "recipientId": {
                                            "format": "int64",
                                            "description": "The recipient id.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The recipients of the payouts."
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.PayoutRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n23: Insufficient permissions to complete the request.\r\n28: Group has paid out too recently. Please wait and try again.\r\n35: 2-Step Verification is required to make further transactions. Go to Settings > Security to complete 2-Step Verification."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n12: Insufficient Robux funds.\r\n24: Invalid payout type.\r\n25: The amount is invalid.\r\n26: Too many recipients."
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
            "description": "22: The feature is disabled."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a list of the group payout percentages",
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
                                    "description": "A group payout response",
                                    "properties": {
                                        "percentage": {
                                            "format": "int32",
                                            "description": "The group payout percentage for the user",
                                            "type": "integer"
                                        },
                                        "user": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The group payout user"
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
            "description": "9: You don't have permission to view this group's payouts."
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/description
```json
{
    "Method": "PATCH",
    "Description": "Updates the groups description",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group the user is in."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for setting a description for the group",
                    "properties": {
                        "description": {
                            "description": "The group description being set.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.UpdateGroupDescriptionRequest}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "newDescription": {
                            "description": "The new description returned",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n18: The description is too long.\r\n23: Insufficient permissions to complete the request."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n29: Your group description was empty."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/payouts/recurring
```json
{
    "Method": "POST",
    "Description": "Updates recurring payouts.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Multi-payout request information.",
                    "properties": {
                        "PayoutType": {
                            "enum": {
                                "1": "FixedAmount",
                                "2": "Percentage"
                            },
                            "description": "The {Roblox.Groups.Api.PayoutType}.",
                            "type": "string"
                        },
                        "Recipients": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A request model for paying out Robux.",
                                    "properties": {
                                        "amount": {
                                            "format": "int64",
                                            "description": "The amount to payout.",
                                            "type": "integer"
                                        },
                                        "recipientType": {
                                            "enum": {
                                                "1": "User",
                                                "2": "Group"
                                            },
                                            "description": "The recipient type.",
                                            "type": "string"
                                        },
                                        "recipientId": {
                                            "format": "int64",
                                            "description": "The recipient id.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The recipients of the payouts."
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.PayoutRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n12: Insufficient Robux funds.\r\n28: Group has paid out too recently. Please wait and try again.\r\n35: 2-Step Verification is required to make further transactions. Go to Settings > Security to complete 2-Step Verification."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n24: Invalid payout type.\r\n25: The amount is invalid.\r\n26: Too many recipients.\r\n27: The recipients are invalid."
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
            "description": "22: The feature is disabled."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/relationships/{groupRelationshipType}/requests/{relatedGroupId}
```json
{
    "Method": "POST",
    "Description": "Accepts a group relationship request.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type, enemies or allies, only allies are supported."
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "relatedGroupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group you want to accept the relationship request with."
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
            "description": "0: Token Validation Failed\r\n9: Insufficient permissions."
        },
        "400": {
            "description": "1: Group relationship type or request type is invalid.\r\n2: Invalid group.\r\n3: Target group is invalid or does not exist.\r\n10: Relationship request does not exist."
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
    "Method": "DELETE",
    "Description": "Declines a group relationship request.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type, enemies or allies."
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "relatedGroupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group you want to accept the relationship request with."
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
            "description": "0: Token Validation Failed\r\n9: Insufficient permissions."
        },
        "400": {
            "description": "1: Group relationship type or request type is invalid.\r\n2: Invalid group.\r\n3: Target group is invalid or does not exist.\r\n10: Relationship request does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/wall/posts
```json
{
    "Method": "POST",
    "Description": "Creates a post on a group wall",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for creating a group wall post",
                    "properties": {
                        "captchaToken": {
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        },
                        "body": {
                            "description": "The wall post body",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.CreateWallPostRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to access this group wall.\r\n7: Captcha must be solved."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n5: Your post was empty, white space, or more than 500 characters."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for group wall post information",
                    "properties": {
                        "updated": {
                            "format": "date-time",
                            "description": "When the group wall post was last updated.",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The group wall post Id.",
                            "type": "integer"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "When the group wall post was posted.",
                            "type": "string"
                        },
                        "body": {
                            "description": "The group wall post body.",
                            "type": "string"
                        },
                        "poster": {
                            "$ref": {
                                "type": "object",
                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                "properties": {
                                    "username": {
                                        "type": "string"
                                    },
                                    "buildersClubMembershipType": {
                                        "enum": {
                                            "1": "None",
                                            "2": "BC",
                                            "3": "TBC",
                                            "4": "OBC",
                                            "5": "RobloxPremium"
                                        },
                                        "description": "The user's builders club membership type",
                                        "type": "string"
                                    },
                                    "userId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "The user that posted the group wall post."
                        }
                    }
                }
            }
        },
        "429": {
            "description": "4: You are posting too fast, please try again in a few minutes."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a list of group wall posts.",
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
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by group wall post Id",
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
                                    "description": "A response model for group wall post information",
                                    "properties": {
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the group wall post was last updated.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group wall post Id.",
                                            "type": "integer"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the group wall post was posted.",
                                            "type": "string"
                                        },
                                        "body": {
                                            "description": "The group wall post body.",
                                            "type": "string"
                                        },
                                        "poster": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "buildersClubMembershipType": {
                                                        "enum": {
                                                            "1": "None",
                                                            "2": "BC",
                                                            "3": "TBC",
                                                            "4": "OBC",
                                                            "5": "RobloxPremium"
                                                        },
                                                        "description": "The user's builders club membership type",
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The user that posted the group wall post."
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
            "description": "2: You do not have permission to access this group wall."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/users/{userId}
```json
{
    "Method": "PATCH",
    "Description": "Updates a users role in a group.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group the user is in."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The id of the user being updated."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for setting a users role in a group.",
                    "properties": {
                        "roleId": {
                            "format": "int64",
                            "description": "The role in the group the user should be put into.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.UpdateUserRoleRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: You do not have permission to manage this member."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n2: The roleset is invaid or does not exist.\r\n3: The user is invalid or does not exist.\r\n23: You cannot change your own role."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Removes a user from a group",
    "Consumes": "NONE",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The Id of the user being removed."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n4: You do not have permission to manage this member.\r\n24: You cannot perform this action with a locked pin.\r\n25: 2-Step Verification is required to make further transactions. Go to Settings > Security to complete 2-Step Verification."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n3: The user is invalid or does not exist."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}
```json
{
    "Method": "GET",
    "Description": "Gets group information",
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
            "description": "The group Id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A detailed group response model",
                    "properties": {
                        "description": {
                            "description": "The group description",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        },
                        "owner": {
                            "$ref": {
                                "type": "object",
                                "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                "properties": {
                                    "username": {
                                        "type": "string"
                                    },
                                    "buildersClubMembershipType": {
                                        "enum": {
                                            "1": "None",
                                            "2": "BC",
                                            "3": "TBC",
                                            "4": "OBC",
                                            "5": "RobloxPremium"
                                        },
                                        "description": "The user's builders club membership type",
                                        "type": "string"
                                    },
                                    "userId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                }
                            },
                            "description": "The owner of the group"
                        },
                        "memberCount": {
                            "format": "int32",
                            "description": "The number of members in the group",
                            "type": "integer"
                        },
                        "isBuildersClubOnly": {
                            "description": "Whether the group is Builders Club only",
                            "type": "boolean"
                        },
                        "isLocked": {
                            "description": "Whether the group is locked",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "The group name",
                            "type": "string"
                        },
                        "shout": {
                            "$ref": {
                                "properties": {
                                    "created": {
                                        "format": "date-time",
                                        "description": "The shout's created time",
                                        "type": "string"
                                    },
                                    "updated": {
                                        "format": "date-time",
                                        "description": "The shout's last updated time",
                                        "type": "string"
                                    },
                                    "poster": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "username": {
                                                    "type": "string"
                                                },
                                                "buildersClubMembershipType": {
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC",
                                                        "5": "RobloxPremium"
                                                    },
                                                    "description": "The user's builders club membership type",
                                                    "type": "string"
                                                },
                                                "userId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "displayName": {
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "The shout's poster"
                                    },
                                    "body": {
                                        "description": "The shout's message",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The group shout/status"
                        },
                        "publicEntryAllowed": {
                            "description": "Whether the group is public (no approval required)",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/join-requests/users/{userId}
```json
{
    "Method": "POST",
    "Description": "Accepts a group join request.",
    "Consumes": "NONE",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user Id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are already in the maximum number of groups.\r\n19: You have insufficient permissions for this request."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n3: The user is invalid or does not exist.\r\n20: The group join request is invalid."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Declines/cancels a group join request.",
    "Consumes": "NONE",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user Id."
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
            "description": "0: Token Validation Failed\r\n4: You do not have permission to manage this member."
        },
        "400": {
            "description": "3: The user is invalid or does not exist."
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
    "Description": "Gets a group join request by userId.",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user Id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for {Roblox.GroupJoinRequest}s",
                    "properties": {
                        "requester": {
                            "$ref": {
                                "properties": {
                                    "username": {
                                        "type": "string"
                                    },
                                    "userId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The requester"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "The DateTime the request was created",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "19: You have insufficient permissions for this request."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/configuration/metadata
```json
{
    "Method": "GET",
    "Description": "Gets Group configuration contextual information",
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
                    "description": "A response model for group configuration",
                    "properties": {
                        "groupConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "A response model for group configuration",
                                "properties": {
                                    "cost": {
                                        "format": "int64",
                                        "description": "The cost of purchasing a group",
                                        "type": "integer"
                                    },
                                    "iconMaxFileSizeMb": {
                                        "format": "int32",
                                        "description": "The maximum file size of the group icon in megabytes",
                                        "type": "integer"
                                    },
                                    "descriptionMaxLength": {
                                        "format": "int32",
                                        "description": "The maximum length of a group description",
                                        "type": "integer"
                                    },
                                    "nameMaxLength": {
                                        "format": "int32",
                                        "description": "The maximum length of a group name",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The group configuration response"
                        },
                        "recurringPayoutsConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "A response model for recurring payout configuration",
                                "properties": {
                                    "maxPayoutPartners": {
                                        "format": "int32",
                                        "description": "The maximum number of recurring payout partners",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The recurring payouts configuration response"
                        },
                        "isPremiumPayoutsEnabled": {
                            "description": "The configuration of premium payouts shows in Group Revenue Summary page",
                            "type": "boolean"
                        },
                        "isDefaultEmblemPolicyEnabled": {
                            "description": "If set to true, default group emblem policies handled by GUAC will be enabled\r\n            \r\nIf set to false, default group emblem policies will not be enabled",
                            "type": "boolean"
                        },
                        "roleConfiguration": {
                            "$ref": {
                                "type": "object",
                                "description": "A response model for role configuration",
                                "properties": {
                                    "limit": {
                                        "format": "int32",
                                        "description": "The maximum number of roles in a group",
                                        "type": "integer"
                                    },
                                    "cost": {
                                        "format": "int64",
                                        "description": "The cost of purchasing a role",
                                        "type": "integer"
                                    },
                                    "maxRank": {
                                        "format": "int32",
                                        "description": "The maximum rank a role can have",
                                        "type": "integer"
                                    },
                                    "minRank": {
                                        "format": "int32",
                                        "description": "The minimum rank a role can have",
                                        "type": "integer"
                                    },
                                    "descriptionMaxLength": {
                                        "format": "int32",
                                        "description": "The maximum length of a role description",
                                        "type": "integer"
                                    },
                                    "nameMaxLength": {
                                        "format": "int32",
                                        "description": "The maximum length of a role name",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The role configuration response"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/wall/subscribe
```json
{
    "Method": "POST",
    "Description": "Subscribes the authenticated user to notifications of group wall events.",
    "Consumes": "NONE",
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
            "description": "0: Token Validation Failed\r\n2: You do not have permission to access this group wall."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/roles
```json
{
    "Method": "GET",
    "Description": "Gets the Roles by their ids.",
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
            "description": "A list of role ids",
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
                                    "properties": {
                                        "description": {
                                            "description": "The role description",
                                            "type": "string"
                                        },
                                        "groupId": {
                                            "format": "int64",
                                            "description": "The id of the group the role belongs to",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The role id",
                                            "type": "integer"
                                        },
                                        "memberCount": {
                                            "format": "int64",
                                            "description": "The number of members in the role.",
                                            "type": "integer"
                                        },
                                        "name": {
                                            "description": "The role name",
                                            "type": "string"
                                        },
                                        "rank": {
                                            "format": "int32",
                                            "description": "The role rank",
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
        "400": {
            "description": "1: Ids could not be parsed from request.\r\n2: Too many ids in request."
        }
    },
}
```
<hr>


## /v1/groups/search
```json
{
    "Method": "GET",
    "Description": "Search for groups by keyword.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "keyword",
            "required": true,
            "description": "The keyword or phrase to use as the search parameter."
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "prioritizeExactMatch",
            "description": "Whether or not to prioritize the exact match for the keyword (optional, defaults to false.",
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
                    "type": "object",
                    "description": "ApiPageResponse for catalog search",
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
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
                                        "publicEntryAllowed": {
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "memberCount": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "keyword": {
                            "description": "Keyword used for search query",
                            "type": "string"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "2: Search term not appropriate for Roblox.\r\n3: Search term was left empty.\r\n4: Search terms can be 2 to 50 characters long."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/relationships/{groupRelationshipType}/{relatedGroupId}
```json
{
    "Method": "POST",
    "Description": "Create a group relationship.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type, enemies or allies."
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "relatedGroupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group you want to create a relationship with."
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
            "description": "0: Token Validation Failed\r\n5: Your group does not allow enemy declarations.\r\n6: Other group does not allow enemy declarations.\r\n7: Your group already has a relationship with the target group.\r\n8: You are blocked from communicating with this user.\r\n9: Insufficient permissions."
        },
        "400": {
            "description": "1: Group relationship type or request type is invalid.\r\n2: Invalid group.\r\n3: Target group is invalid or does not exist.\r\n4: Your group cannot establish a relationship with itself."
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
    "Method": "DELETE",
    "Description": "Deletes a group relationship.",
    "Consumes": "NONE",
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
            "in": "path",
            "type": "string",
            "name": "groupRelationshipType",
            "required": true,
            "description": "The group relationship type, enemies or allies."
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "relatedGroupId",
            "format": "int64",
            "required": true,
            "description": "The id of the group you want to delete the relationship with."
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
            "description": "0: Token Validation Failed\r\n8: You are blocked from communicating with this user."
        },
        "400": {
            "description": "2: Invalid group.\r\n3: Target group is invalid or does not exist.\r\n11: Relationship does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/policies
```json
{
    "Method": "POST",
    "Description": "Gets group policy info used for compliance.",
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
                        "groupIds": {
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
            "name": "groupPolicyRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "groups": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "canViewGroup": {
                                            "type": "boolean"
                                        },
                                        "groupId": {
                                            "type": "integer",
                                            "format": "int64"
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
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: Too many ids in request.\r\n2: Ids could not be parsed from request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/roles/{roleSetId}/permissions
```json
{
    "Method": "PATCH",
    "Description": "Updates the permissions for a group's roleset. The authorized user must be the group owner.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group's id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "roleSetId",
            "format": "int32",
            "required": true,
            "description": "The roleset's id."
        },
        "3": {
            "in": "body",
            "name": "updatePermissionsRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for updating a group's roleset's permissions.",
                    "properties": {
                        "permissions": {
                            "type": "object",
                            "description": "The permission-value pairs to be updated.",
                            "properties": {
                                "InviteMembers": {
                                    "type": "boolean"
                                },
                                "AddGroupPlaces": {
                                    "type": "boolean"
                                },
                                "PostToWall": {
                                    "type": "boolean"
                                },
                                "PostToStatus": {
                                    "type": "boolean"
                                },
                                "ChangeRank": {
                                    "type": "boolean"
                                },
                                "RemoveMembers": {
                                    "type": "boolean"
                                },
                                "ViewStatus": {
                                    "type": "boolean"
                                },
                                "AdvertiseGroup": {
                                    "type": "boolean"
                                },
                                "SpendGroupFunds": {
                                    "type": "boolean"
                                },
                                "ManageGroupGames": {
                                    "type": "boolean"
                                },
                                "ManageItems": {
                                    "type": "boolean"
                                },
                                "CreateItems": {
                                    "type": "boolean"
                                },
                                "ManageClan": {
                                    "type": "boolean"
                                },
                                "ViewAuditLogs": {
                                    "type": "boolean"
                                },
                                "DeleteFromWall": {
                                    "type": "boolean"
                                },
                                "ManageRelationships": {
                                    "type": "boolean"
                                },
                                "ViewWall": {
                                    "type": "boolean"
                                }
                            }
                        }
                    }
                }
            },
            "description": "The request."
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
            "description": "0: Token Validation Failed\r\n3: You are not authorized to view/edit permissions for this role.\r\n4: This role's permissions can not be modified."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n2: The roleset is invalid or does not exist."
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
    "Description": "Gets the permissions for a group's roleset. The authorized user must either be the group owner or the roleset being requested, except for guest roles, which can be viewed by all (members and guests).",
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
            "in": "path",
            "type": "integer",
            "name": "roleSetId",
            "format": "int32",
            "required": true,
            "description": "The group's role set id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group role's permissions response model",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "A model for group permissions/&gt;",
                                "properties": {
                                    "groupEconomyPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewGroupPayouts": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "manageGroupGames": {
                                                    "description": "Manage group games permission",
                                                    "type": "boolean"
                                                },
                                                "createItems": {
                                                    "description": "Create items permission",
                                                    "type": "boolean"
                                                },
                                                "manageItems": {
                                                    "description": "Manage items permission",
                                                    "type": "boolean"
                                                },
                                                "advertiseGroup": {
                                                    "description": "Advertise group permission",
                                                    "type": "boolean"
                                                },
                                                "spendGroupFunds": {
                                                    "description": "Spend group funds permission",
                                                    "type": "boolean"
                                                },
                                                "addGroupPlaces": {
                                                    "description": "Add group places permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group economy permissions"
                                    },
                                    "groupMembershipPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "changeRank": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                },
                                                "removeMembers": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "inviteMembers": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group membership permissions"
                                    },
                                    "groupPostsPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing group posts permissions",
                                            "properties": {
                                                "postToStatus": {
                                                    "description": "Post to status permission",
                                                    "type": "boolean"
                                                },
                                                "viewStatus": {
                                                    "description": "View status permission",
                                                    "type": "boolean"
                                                },
                                                "postToWall": {
                                                    "description": "Post to wall permission",
                                                    "type": "boolean"
                                                },
                                                "deleteFromWall": {
                                                    "description": "Delete from wall permission",
                                                    "type": "boolean"
                                                },
                                                "viewWall": {
                                                    "description": "View wall permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group posts permissions"
                                    },
                                    "groupManagementPermissions": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "viewAuditLogs": {
                                                    "description": "View audit logs permission",
                                                    "type": "boolean"
                                                },
                                                "manageClan": {
                                                    "description": "Manage clan permission",
                                                    "type": "boolean"
                                                },
                                                "manageRelationships": {
                                                    "description": "Manage group relationships permission",
                                                    "type": "boolean"
                                                }
                                            }
                                        },
                                        "description": "Group management permissions"
                                    }
                                }
                            },
                            "description": "The group role's permissions"
                        },
                        "role": {
                            "$ref": {
                                "type": "object",
                                "description": "A group role response model",
                                "properties": {
                                    "name": {
                                        "description": "The role name",
                                        "type": "string"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "The role id",
                                        "type": "integer"
                                    },
                                    "memberCount": {
                                        "format": "int64",
                                        "description": "The number of members in the role.",
                                        "type": "integer"
                                    },
                                    "description": {
                                        "description": "The role description",
                                        "type": "string"
                                    },
                                    "rank": {
                                        "format": "int32",
                                        "description": "The role rank",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The group role"
                        },
                        "groupId": {
                            "format": "int64",
                            "description": "The group id",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "3: You are not authorized to view/edit permissions for this role."
        },
        "400": {
            "description": "1: Group is invalid or does not exist.\r\n2: The roleset is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/metadata
```json
{
    "Method": "GET",
    "Description": "Gets Groups contextual information:
Max number of groups a user can be part of. 
Current number of groups a user is a member of. 
Whether to show/hide certain features based on device type.",
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
                    "description": "A group roles response model",
                    "properties": {
                        "isGroupWallNotificationsEnabled": {
                            "description": "If set to true, group details will subscribe and respond to wall notifications.",
                            "type": "boolean"
                        },
                        "groupPostMaxLength": {
                            "format": "int32",
                            "description": "The maximum length of a group wall post",
                            "type": "integer"
                        },
                        "groupWallNotificationsSubscribeIntervalInMilliseconds": {
                            "format": "int32",
                            "description": "Time in milliseconds between calls to subscribe to group wall notifications.",
                            "type": "integer"
                        },
                        "groupLimit": {
                            "format": "int32",
                            "description": "The user's builders club membership group limit",
                            "type": "integer"
                        },
                        "currentGroupCount": {
                            "format": "int32",
                            "description": "The user's current group membership count",
                            "type": "integer"
                        },
                        "areProfileGroupsHidden": {
                            "description": "If set to true, groups showcase will not show on users profiles.\r\n            \r\nIf set to false, group showcase will display on users profiles.",
                            "type": "boolean"
                        },
                        "isGroupDetailsPolicyEnabled": {
                            "description": "If set to true, group details will respect GUAC policies for group details\r\n            \r\nIf set to false, group details will not respect GUAC policies",
                            "type": "boolean"
                        },
                        "groupStatusMaxLength": {
                            "format": "int32",
                            "description": "The maximum length of a group status",
                            "type": "integer"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/join-requests
```json
{
    "Method": "POST",
    "Description": "Batch accepts group join requests",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "UserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The user ids being either accepted or declined"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.MembersRequest}."
        }
    },
    "Responses": {
        "500": {
            "description": "0: Something went wrong."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n3: The user is invalid or does not exist.\r\n20: The group join request is invalid."
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
            "description": "18: The operation is temporarily unavailable. Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n6: You are already in the maximum number of groups.\r\n19: You have insufficient permissions for this request."
        }
    },
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Batch declines group join requests",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "UserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The user ids being either accepted or declined"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.MembersRequest}."
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
            "description": "1: The group is invalid or does not exist.\r\n3: The user is invalid or does not exist."
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
    "Description": "Gets a page of Group Join Requests for a group.",
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
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by group join request creation date",
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
                                    "description": "Response model for {Roblox.GroupJoinRequest}s",
                                    "properties": {
                                        "requester": {
                                            "$ref": {
                                                "properties": {
                                                    "username": {
                                                        "type": "string"
                                                    },
                                                    "userId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The requester"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The DateTime the request was created",
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
            "description": "19: You have insufficient permissions for this request."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/create
```json
{
    "Method": "POST",
    "Description": "Creates a new group.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "formData",
            "type": "string",
            "name": "request.name",
            "description": "The name of the group.",
        },
        "2": {
            "in": "formData",
            "type": "string",
            "name": "request.description",
            "description": "The group description.",
        },
        "3": {
            "in": "formData",
            "type": "boolean",
            "name": "request.publicGroup",
            "description": "Whether or not the group is open for anyone to join.",
        },
        "4": {
            "in": "formData",
            "type": "boolean",
            "name": "request.buildersClubMembersOnly",
            "description": "Whether or not the group is only open to join for builders club members.",
        },
        "5": {
            "in": "formData",
            "type": "file",
            "name": "request.files",
        }
    },
    "Responses": {
        "413": {
            "description": "0: Unknown error."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n10: User must have builders club membership.\r\n11: User is in maximum number of groups.\r\n12: Insufficient Robux funds.\r\n14: The name is moderated."
        },
        "400": {
            "description": "13: The name is invalid.\r\n15: The group icon is invalid.\r\n16: The group icon is missing from the request.\r\n18: The description is too long.\r\n19: The name is too long.\r\n20: The name has been taken."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "created": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "name": {
                            "type": "string"
                        },
                        "description": {
                            "type": "string"
                        },
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "owner": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "format": "int64",
                                        "readOnly": true,
                                        "type": "integer"
                                    },
                                    "type": {
                                        "enum": {
                                            "1": "User"
                                        },
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "name": {
                                        "readOnly": true,
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "shout": {
                            "$ref": {
                                "properties": {
                                    "created": {
                                        "type": "string",
                                        "format": "date-time"
                                    },
                                    "poster": {
                                        "$ref": {
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "readOnly": true,
                                                    "type": "integer"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "User"
                                                    },
                                                    "readOnly": true,
                                                    "type": "string"
                                                },
                                                "name": {
                                                    "readOnly": true,
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        }
                                    },
                                    "body": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "memberCount": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "17: Too many requests."
        },
        "503": {
            "description": "21: Group creation is currently disabled."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/rolesets/{rolesetId}
```json
{
    "Method": "PATCH",
    "Description": "Updates existing group roleset.",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "rolesetId",
            "format": "int64",
            "required": true,
            "description": "The roleset Id."
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "description": {
                            "description": "The description of the roleset.",
                            "type": "string"
                        },
                        "name": {
                            "description": "The name of the roleset.",
                            "type": "string"
                        },
                        "rank": {
                            "format": "int32",
                            "description": "The rank/positioning of the roleset.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The {Roblox.Groups.Api.Models.Request.UpdateRoleSetRequest}."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A group role response model",
                    "properties": {
                        "name": {
                            "description": "The role name",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The role id",
                            "type": "integer"
                        },
                        "memberCount": {
                            "format": "int64",
                            "description": "The number of members in the role.",
                            "type": "integer"
                        },
                        "description": {
                            "description": "The role description",
                            "type": "string"
                        },
                        "rank": {
                            "format": "int32",
                            "description": "The role rank",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed\r\n9: You do not have permissions to perform this action."
        },
        "400": {
            "description": "5: Role name already exists.\r\n6: Rank value is out of bounds.\r\n7: The role name is too long.\r\n8: The role description is too long.\r\n10: This group does not exist.\r\n14: Role name can not be empty.\r\n15: This role does not exist.\r\n19: Cannot update Guest role.\r\n20: Cannot update Owner role rank."
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
    "Method": "DELETE",
    "Description": "Deletes existing group roleset.",
    "Consumes": "NONE",
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
            "description": "The group Id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "rolesetId",
            "format": "int64",
            "required": true,
            "description": "The roleset Id."
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
            "description": "0: Token Validation Failed\r\n9: You do not have permissions to perform this action.\r\n16: There are users in this role."
        },
        "400": {
            "description": "10: This group does not exist.\r\n15: This role does not exist.\r\n17: Cannot remove any more roles\r\n18: Cannot delete this role."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


# <b>Groups Api v2</b>

## /v2/groups/{groupId}/wall/posts
```json
{
    "Method": "POST",
    "Description": "Creates a post on a group wall",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for creating a group wall post",
                    "properties": {
                        "captchaToken": {
                            "type": "string"
                        },
                        "captchaProvider": {
                            "type": "string"
                        },
                        "body": {
                            "description": "The wall post body",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Roblox.Groups.Api.CreateWallPostRequest}."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You do not have permission to access this group wall.\r\n7: Captcha must be solved."
        },
        "400": {
            "description": "1: The group is invalid or does not exist.\r\n5: Your post was empty, white space, or more than 500 characters."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for group wall post information",
                    "properties": {
                        "updated": {
                            "format": "date-time",
                            "description": "When the group wall post was last updated.",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "The group wall post Id.",
                            "type": "integer"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "When the group wall post was posted.",
                            "type": "string"
                        },
                        "body": {
                            "description": "The group wall post body.",
                            "type": "string"
                        },
                        "poster": {
                            "$ref": {
                                "type": "object",
                                "description": "A user group role response model",
                                "properties": {
                                    "role": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A group role response model",
                                            "properties": {
                                                "name": {
                                                    "description": "The role name",
                                                    "type": "string"
                                                },
                                                "id": {
                                                    "format": "int64",
                                                    "description": "The role id",
                                                    "type": "integer"
                                                },
                                                "memberCount": {
                                                    "format": "int64",
                                                    "description": "The number of members in the role.",
                                                    "type": "integer"
                                                },
                                                "description": {
                                                    "description": "The role description",
                                                    "type": "string"
                                                },
                                                "rank": {
                                                    "format": "int32",
                                                    "description": "The role rank",
                                                    "type": "integer"
                                                }
                                            }
                                        },
                                        "description": "The user's group role"
                                    },
                                    "user": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                            "properties": {
                                                "username": {
                                                    "type": "string"
                                                },
                                                "buildersClubMembershipType": {
                                                    "enum": {
                                                        "1": "None",
                                                        "2": "BC",
                                                        "3": "TBC",
                                                        "4": "OBC",
                                                        "5": "RobloxPremium"
                                                    },
                                                    "description": "The user's builders club membership type",
                                                    "type": "string"
                                                },
                                                "userId": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "displayName": {
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "The user"
                                    }
                                }
                            },
                            "description": "The user that posted the group wall post."
                        }
                    }
                }
            }
        },
        "429": {
            "description": "4: You are posting too fast, please try again in a few minutes."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a list of group wall posts.",
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
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by group wall post Id",
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
                                    "description": "A response model for group wall post information",
                                    "properties": {
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the group wall post was last updated.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group wall post Id.",
                                            "type": "integer"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the group wall post was posted.",
                                            "type": "string"
                                        },
                                        "body": {
                                            "description": "The group wall post body.",
                                            "type": "string"
                                        },
                                        "poster": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A user group role response model",
                                                "properties": {
                                                    "role": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A group role response model",
                                                            "properties": {
                                                                "name": {
                                                                    "description": "The role name",
                                                                    "type": "string"
                                                                },
                                                                "id": {
                                                                    "format": "int64",
                                                                    "description": "The role id",
                                                                    "type": "integer"
                                                                },
                                                                "memberCount": {
                                                                    "format": "int64",
                                                                    "description": "The number of members in the role.",
                                                                    "type": "integer"
                                                                },
                                                                "description": {
                                                                    "description": "The role description",
                                                                    "type": "string"
                                                                },
                                                                "rank": {
                                                                    "format": "int32",
                                                                    "description": "The role rank",
                                                                    "type": "integer"
                                                                }
                                                            }
                                                        },
                                                        "description": "The user's group role"
                                                    },
                                                    "user": {
                                                        "$ref": {
                                                            "type": "object",
                                                            "description": "A model representing data about an {Roblox.Platform.Membership.IUser}",
                                                            "properties": {
                                                                "username": {
                                                                    "type": "string"
                                                                },
                                                                "buildersClubMembershipType": {
                                                                    "enum": {
                                                                        "1": "None",
                                                                        "2": "BC",
                                                                        "3": "TBC",
                                                                        "4": "OBC",
                                                                        "5": "RobloxPremium"
                                                                    },
                                                                    "description": "The user's builders club membership type",
                                                                    "type": "string"
                                                                },
                                                                "userId": {
                                                                    "type": "integer",
                                                                    "format": "int64"
                                                                },
                                                                "displayName": {
                                                                    "type": "string"
                                                                }
                                                            }
                                                        },
                                                        "description": "The user"
                                                    }
                                                }
                                            },
                                            "description": "The user that posted the group wall post."
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
            "description": "2: You do not have permission to access this group wall."
        },
        "400": {
            "description": "1: The group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v2/users/{userId}/groups/roles
```json
{
    "Method": "GET",
    "Description": "Gets a list of all group roles for groups the specified user is in.",
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
            "description": "The user id."
        }
    },
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
                                    "description": "A basic group membership response model",
                                    "properties": {
                                        "group": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "memberCount": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The group"
                                        },
                                        "role": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "rank": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The role"
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
            "description": "3: The user is invalid or does not exist."
        }
    },
}
```
<hr>


## /v2/groups
```json
{
    "Method": "GET",
    "Description": "Multi-get groups information by Ids.",
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
            "description": "The group Ids.",
            "name": "groupIds"
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
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "owner": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "shout": {
                                            "$ref": {
                                                "properties": {
                                                    "created": {
                                                        "type": "string",
                                                        "format": "date-time"
                                                    },
                                                    "poster": {
                                                        "$ref": {
                                                            "properties": {
                                                                "id": {
                                                                    "format": "int64",
                                                                    "readOnly": true,
                                                                    "type": "integer"
                                                                },
                                                                "type": {
                                                                    "enum": {
                                                                        "1": "User"
                                                                    },
                                                                    "readOnly": true,
                                                                    "type": "string"
                                                                },
                                                                "name": {
                                                                    "readOnly": true,
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "body": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "memberCount": {
                                            "type": "integer",
                                            "format": "int64"
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
            "description": "2: Too many ids in request.\r\n3: Ids could not be parsed from request."
        }
    },
}
```
<hr>


