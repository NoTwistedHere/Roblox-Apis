![](https://github.com/NoTwistedHere/Storage/blob/main/Images/Roblox_Logo.png)

<hr/>

Roblox's VoiceChatService

* Functions
    | Name | Description |
    | -: | :- |
    | GetMicDevices([(void)]) | Returns a list of all microphone drives |
    | SetMicDevice([Drive?], [?]) | Uses the parsed mic drive for VoiceChat (Requires 2 arguments) |
    | GetParticipants() | Returns a list of all users that are connected (talk/hear) |
    | Leave([(void)]) | Leaves the current voice channel (if in any) |
    | JoinByGroupId([(string)]) | Joins a group's voice channel |
    | GetGroupId([(void)]) | ? |
    | JoinByGroupIdToken([(string) Type e.g. "default"], [(boolean) ShouldJoinMuted (Defined by the fflag DebugDefaultChannelStartMuted)]) | Joins a voice channel? |
    | VoiceChatSetMuteAllState([(boolean)]) | ? |
    | GetVoiceChatApiVersion([(void)]) | Current Version: 8 |

* Events
    | Name | Description |
    | -: | :- |
    | ParticipantsChanged | Fires when a participant leaves/joins |
    | StateChanged | Fires when the local user connects/disconnects (maybe with a reason why, like connection issues?) |

* Properties
    | Name | Description |
    | -: | :- |
    | VoiceChatState | Returns an enum value for the current state (Enum.VoiceChatState) |

Not everything here is correct, there may be somethings missing
