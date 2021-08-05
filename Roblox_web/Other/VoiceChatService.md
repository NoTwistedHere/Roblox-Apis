![](https://github.com/NoTwistedHere/Storage/blob/main/Images/Roblox_Logo.png)

<hr/>

* Functions
    | Name | Description |
    | -: | :- |
    | GetMicDevices() | Returns a list of all microphone drives |
    | SetMicDevice([Drive]) | Uses the parsed mic drive for VoiceChat |
    | GetParticipants([GroupId?]) | Returns a list of all users that are connected (talk/hear) |
    | Leave() | Leaves the current voice channel (errors if null?) |
    | JoinByGroupId() | Joins a group's voice channel |
    | GetGroupId() | ? |
    | JoinByGroupIdToken([<<string>> Type e.g. "default"], [<<boolean>> ShouldJoinMuted (Defined by the fflag DebugDefaultChannelStartMuted)]) | Joins a voice channel? |
    | VoiceChatSetMuteAllState([<<boolean>>]) | ? |

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
