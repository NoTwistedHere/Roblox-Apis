# Chat Moderation

## /v1/users/{userId}/conversations

Method: **GET**
Description: Retrieve all the conversations for a user
Produces: **application/json**, **text/json**
Parameters:
    userId [integer/int64] (the user's id) **REQUIRED**
    limit [integer/int32] (the amount of results per request) **OPTIONAL QUERY**
    cursor [string] (The paging cursor for the previous or next page) **OPTIONAL QUERY**
Responses:
    **200**: "OK"
    **400**: "1: Invalid user id"
    **401**: "3: The User has insufficient permissions to perform this action"
<hr>

## /v1/users/{userId}/conversations/{conversationId}/export

Method: **GET**
Description: Exports chat conversation messages to csv file
Produces: **application/json**, **text/json**
Parameters:
    userId [integer/int64] (The target user id) **REQUIRED**
    conversationId [integer/int64] (The conversation id) **REQUIRED**
    inclusiveStartDate [string] **OPTIONAL QUERY**
    exclusiveEndDate [string] **OPTIONAL QUERY**
Responses:
    **200**: "OK"
    **400**: "0: Conversation is not valid.\r\n1: User is not valid."
    **401**: "2: User is not authorized to export user platform chat."
    **500**: "3: Processing error has occured."
<hr>

## /v1/users/{userId}/conversations/{conversationId}/messages

Method: **GET**
Description: Exports chat conversation messages to csv file
Produces: **application/json**, **text/json**
Parameters:
    userId [integer/int64] (the user id) **REQUIRED**
    conversationId [integer/int64] (the conversation id) **REQUIRED**
    limit [integer/int32] (The amount of results per request.) **OPTIONAL QUERY**
    cursor [string] (The paging cursor for the previous or next page.) **OPTIONAL QUERY**
    sortOrder [string/enum] (The order the results are sorted in.) **OPTIONAL QUERY**
        Asc
        Desc

Responses:
    **200**: "OK"
    **400**: "1: Invalid user id\r\n2: Invalid conversation id"
    **401**: "3: The User has insufficient permissions to perform this action"
<hr>