local charactercreator = loadstring(game:GetService("HttpService"):GetAsync("https://codeberg.org/Wapplee/Lua-Sandbox-Scripts/raw/branch/main/Modules/CharacterCreator.lua"))()


local person = charactercreator:Make("R15")
person:SetPrimaryPartCFrame(CFrame.new(0,5,10))
person.Parent = script
local ReplayAnimator = {} do
    --[[
      _____  ______ _____  _           __     __
     |  __ \|  ____|  __ \| |        /\\ \   / /
     | |__) | |__  | |__) | |       /  \\ \_/ / 
     |  _  /|  __| |  ___/| |      / /\ \\   /  
     | | \ \| |____| |    | |____ / ____ \| |   
     |_|  \_\______|_|    |______/_/    \_\_|   
    ]]
    local LibDeflate = game:GetService("RunService"):IsServer() and loadstring(game:GetService("HttpService"):GetAsync("https://glot.io/snippets/gus5ksfzwy/raw/libdeflate.lua"))()
    -- HTTP REQUESTS DO NOT WORK IN LOCAL SCRIPTS!
    -- IF YOU ARE PLANNING TO USE COMPRESSED ANIMATIONS IN A LOCALSCRIPT, YOU NEED TO COPY THE ENTIRE LibDeflate MODULE, OR LOCALLY REQUIRE IT!

    ReplayAnimator.__index = ReplayAnimator

    local ReplayTrack = {} do
        ReplayTrack.__index = ReplayTrack

        local Signal = {} do
            local freeRunnerThread = nil

            local function acquireRunnerThreadAndCallEventHandler(fn, ...)
                local acquiredRunnerThread = freeRunnerThread
                freeRunnerThread = nil
                fn(...)
                freeRunnerThread = acquiredRunnerThread
            end

            local function runEventHandlerInFreeThread()
                while true do
                    acquireRunnerThreadAndCallEventHandler(coroutine.yield())
                end
            end

            local Connection = {}
            Connection.__index = Connection
            function Connection.new(signal, fn)
                return setmetatable({
                    _connected = true,
                    _signal = signal,
                    _fn = fn,
                    _next = false,
                }, Connection)
            end
            function Connection:Disconnect()
                self._connected = false
                if self._signal._handlerListHead == self then
                    self._signal._handlerListHead = self._next
                else
                    local prev = self._signal._handlerListHead
                    while prev and prev._next ~= self do
                        prev = prev._next
                    end
                    if prev then
                        prev._next = self._next
                    end
                end
            end
            setmetatable(Connection, {
                __index = function(tb, key)
                    error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(key)), 2)
                end,
                __newindex = function(tb, key, value)
                    error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(key)), 2)
                end
            })

            Signal.__index = Signal
            function Signal.new()
                return setmetatable({
                    _handlerListHead = false,
                }, Signal)
            end
            function Signal:Connect(fn)
                local connection = Connection.new(self, fn)
                if self._handlerListHead then
                    connection._next = self._handlerListHead
                    self._handlerListHead = connection
                else
                    self._handlerListHead = connection
                end
                return connection
            end
            function Signal:DisconnectAll()
                self._handlerListHead = false
            end
            function Signal:Fire(...)
                local item = self._handlerListHead
                while item do
                    if item._connected then
                        if not freeRunnerThread then
                            freeRunnerThread = coroutine.create(runEventHandlerInFreeThread)
                            -- Get the freeRunnerThread to the first yield
                            coroutine.resume(freeRunnerThread)
                        end
                        task.spawn(freeRunnerThread, item._fn, ...)
                    end
                    item = item._next
                end
            end
            function Signal:Wait()
                local waitingCoroutine = coroutine.running()
                local cn;
                cn = self:Connect(function(...)
                    cn:Disconnect()
                    task.spawn(waitingCoroutine, ...)
                end)
                return coroutine.yield()
            end
            function Signal:Once(fn)
                local cn;
                cn = self:Connect(function(...)
                    if cn._connected then
                        cn:Disconnect()
                    end
                    fn(...)
                end)
                return cn
            end
            setmetatable(Signal, {
                __index = function(tb, key)
                    error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(key)), 2)
                end,
                __newindex = function(tb, key, value)
                    error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(key)), 2)
                end
            })
        end

        function ReplayTrack.new(KeyframeData, Animator)
            local self = setmetatable({}, ReplayTrack)
            self.Speed = 1
            self.Length = KeyframeData.Length
            self.Weight = 1
            self.Looped = false
            self.TimePosition = 0
            self.IsPlaying = false
            self.Updating = true
            self.Structure = KeyframeData
            self.Animator = Animator
            self.Priority = KeyframeData.Priority
            self.MarkerSignals = {}
            self.DidLoop = Signal.new()
            self.Stopped = Signal.new()

            return self
        end

        function ReplayTrack:AdjustSpeed(Speed)
            self.Speed = Speed
        end

        function ReplayTrack:AdjustWeight(Weight)
            self.Weight = Weight
        end

        function ReplayTrack:GetMarkerReachedSignal(MarkerName)
            if self.MarkerSignals[MarkerName] then
                return self.MarkerSignals[MarkerName]
            else
                local NewSignal = Signal.new()
                self.MarkerSignals[MarkerName] = NewSignal
                return NewSignal
            end
        end

        local TWS = game:GetService("TweenService")

        function ReplayTrack:Stop(FadeOut)
            self.TimePosition = 0
            self.IsPlaying = false
            self.Stopped:Fire()
            if self._Update then
                self._Update:Disconnect()
            end
        end

        function ReplayTrack:Play(FadeIn)
            local FadeIn = FadeIn or 0.1
            local FinishedPoses = 0
            local Transform = {}
            local FadeInTime = 0
            local Weight = 0
            local LastIndex = 0

            self.IsPlaying = true
            self._Update = game:GetService("RunService").PreAnimation:Connect(function(DeltaTime)
                if Weight >= 1 then
                    FadeInTime = nil
                    Weight = 1
                else
                    FadeInTime = FadeInTime + DeltaTime
                    Weight = FadeInTime / FadeIn
                end
                local Increase = (DeltaTime * self.Speed)
                self.TimePosition = self.TimePosition + Increase

                local HighestPriority = -1
                local HighestTrack
                for _, Track in next, self.Animator:GetPlayingAnimationTracks() do
                    Track.Updating = false
                    if Track.Priority > HighestPriority then
                        HighestPriority = Track.Priority
                        HighestTrack = Track
                    end
                end
                if HighestTrack then
                    HighestTrack.Updating = true
                end

                local Index = 1
                while Index <= #self.Structure.Keyframes do
                    local Keyframe = self.Structure.Keyframes[Index]
                    if Keyframe.Time > self.TimePosition then
                        break
                    end
                    Index = Index + 1
                end
                local Keyframe = self.Structure.Keyframes[math.clamp(Index, 1, #self.Structure.Keyframes)]
                if not Keyframe then return end
                local WeightFactor = math.clamp(Weight * self.Weight, 0, 1)
                if LastIndex ~= Index then
                    LastIndex = Index
                    for Index, Data in next, Transform do
                        Transform[Index][1] = 0
                        Transform[Index][2] = Data[4]
                    end
                    for _, MarkerData in next, Keyframe.Markers do
                        if self.MarkerSignals[MarkerData[1]] then
                            self.MarkerSignals[MarkerData[1]]:Fire(MarkerData[2])
                        end
                    end
                end
                for Limb, Pose in next, Keyframe.Poses do
                    if not Transform[Limb] then
                        Transform[Limb] = {0, Pose.CFrame, Pose.CFrame, Pose.CFrame}
                    end
                    if Pose.Next then
                        local NextKeyframe = self.Structure.Keyframes[Pose.Next]
                        local NextCFrame = NextKeyframe.Poses[Limb].CFrame

                        Transform[Limb][1] = Transform[Limb][1] + Increase
                        local TimeToTake = (NextKeyframe.Time - Keyframe.Time)
                        local Alpha = math.clamp(Transform[Limb][1] / TimeToTake, 0, 1)
                        Transform[Limb][3] = Transform[Limb][2]:Lerp(NextCFrame, TWS:GetValue(Alpha, Pose.EasingStyle, Pose.EasingDirection))
                        Transform[Limb][4] = NextCFrame
                    else
                        local CF = Pose.CFrame
                        Transform[Limb][2] = CF
                        Transform[Limb][3] = CF
                        Transform[Limb][4] = CF
                    end 
                end
                for Limb, Data in next, Transform do
                    local Joint = self.Animator.Motors[Limb]
                    if Joint then
                        if self.Updating then
                            Joint[1].C0 = Joint[2] * Data[3]:Lerp(CFrame.identity, 1 - WeightFactor)
                        end
                    end
                end
                if self.TimePosition >= self.Length then
                    if self.Looped then
                        self.DidLoop:Fire()
                        self.TimePosition = 0
                    else
                        self:Stop()
                    end
                end
            end)
        end
    end

    function ReplayAnimator.new(Rig, JointType)
        local self = setmetatable({}, ReplayAnimator)
        self.Loaded = {}
        local Motors = {}	
        for _, Joint in next, Rig:GetDescendants() do
            if Joint:IsA(JointType or "Motor6D") then
                if Motors[Joint.Part1.Name] then
                    warn("Joint "..Joint:GetFullName().." cannot be registered as "..Joint.Part1.Name.." is already taken by " .. Motors[Joint.Part1.Name]:GetFullName())
                else
                    Motors[Joint.Part1.Name] = {Joint, Joint.C0}
                end
            end
        end
        self.Motors = Motors
        return self
    end

    function ReplayAnimator:GetPlayingAnimationTracks()
        local Tracks = {}
        for i, v in self.Loaded do
            if v.IsPlaying then
                table.insert(Tracks, v)
            end
        end
        return Tracks
    end

    local Alphabet = {}
    local Indexes = {}	
    for Index = 65, 90 do
        table.insert(Alphabet, Index)
    end
    for Index = 97, 122 do
        table.insert(Alphabet, Index)
    end
    for Index = 48, 57 do
        table.insert(Alphabet, Index)
    end
    table.insert(Alphabet, 43)
    table.insert(Alphabet, 47)
    for Index, Character in ipairs(Alphabet) do
        Indexes[Character] = Index
    end
    local bit32_rshift = bit32.rshift
    local bit32_lshift = bit32.lshift
    local bit32_band = bit32.band
    local function Base64Decode(Input)
        local Output = {}
        local Length = 0
        for Index = 1, #Input, 4 do
            local C1, C2, C3, C4 = string.byte(Input, Index, Index + 3)
            local I1 = Indexes[C1] - 1
            local I2 = Indexes[C2] - 1
            local I3 = (Indexes[C3] or 1) - 1
            local I4 = (Indexes[C4] or 1) - 1
            local A = bit32_lshift(I1, 2) + bit32_rshift(I2, 4)
            local B = bit32_lshift(bit32_band(I2, 15), 4) + bit32_rshift(I3, 2)
            local C = bit32_lshift(bit32_band(I3, 3), 6) + I4
            Length = Length + 1
            Output[Length] = A
            if C3 ~= 61 then
                Length = Length + 1
                Output[Length] = B
            end
            if C4 ~= 61 then
                Length = Length + 1
                Output[Length] = C
            end
        end
        local NewOutput = {}
        local NewLength = 0
        local IndexAdd4096Sub1
        for Index = 1, Length, 4096 do
            NewLength = NewLength + 1
            IndexAdd4096Sub1 = Index + 4096 - 1

            NewOutput[NewLength] = string.char(table.unpack(
                Output,
                Index,
                IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1
                ))
        end
        return table.concat(NewOutput)
    end
    local function Decode(Data, Compressed)
        -- im always changing the format and making it better so if you put in a new animation made with a later update it'll probably not work
        Data = Base64Decode(Data)
        if Compressed then
            Data = LibDeflate.Zlib.Decompress(Data)
        end
        local LimbIndexArray = {}
        local Buffer = buffer.fromstring(Data)
        local Limbs, Priority = buffer.readu8(Buffer, 0), buffer.readu16(Buffer, 1)
        local Offset = 3
        local Struct = {Priority = Priority, Keyframes = {}}
        for i = 1, Limbs do
            local Length = buffer.readu8(Buffer, Offset)
            local Name = buffer.readstring(Buffer, Offset + 1, Length)
            LimbIndexArray[i] = Name
            Offset = Offset + Length + 2
        end
        local Keyframes = buffer.readu16(Buffer, Offset)
        Offset = Offset + 2
        for i = 1, Keyframes do
            local Time, Markers = buffer.readf32(Buffer, Offset), buffer.readu8(Buffer, Offset + 4)
            local Keyframe = {Time = Time, Poses = {}, Markers = {}}
            Offset = Offset + 5
            for i = 1, Markers do
                local Type, NameLength = buffer.readu8(Buffer, Offset), buffer.readu8(Buffer, Offset + 1)
                local Name = buffer.readstring(Buffer, Offset + 2, NameLength)
                Offset = Offset + NameLength + 3
                if Type == 0 then
                    local StringLength = buffer.readu8(Buffer, Offset)
                    local StringValue = buffer.readstring(Buffer, Offset + 1, StringLength)
                    table.insert(Keyframe.Markers, {Name, StringValue})
                    Offset = Offset + StringLength + 2
                elseif Type == 1 then
                    local Number = buffer.readi16(Buffer, Offset)
                    table.insert(Keyframe.Markers, {Name, Number})
                    Offset = Offset + 2
                elseif Type == 2 then
                    --it's nil lol
                    table.insert(Keyframe.Markers, {Name})
                end
            end
            local Keyframes = buffer.readu8(Buffer, Offset)
            Offset = Offset + 1
            for i = 1, Keyframes do
                local PoseSize, LimbIndex = buffer.readu8(Buffer, Offset), buffer.readu8(Buffer, Offset + 1)
                local Weight, EasingDirection, EasingStyle = buffer.readu8(Buffer, Offset + 2), buffer.readu8(Buffer, Offset + 3), buffer.readu8(Buffer, Offset + 4)
                local X, Y, Z = buffer.readf32(Buffer, Offset + 5), buffer.readf32(Buffer, Offset + 9), buffer.readf32(Buffer, Offset + 13)
                local RX, RY, RZ = buffer.readi16(Buffer, Offset + 17), buffer.readi16(Buffer, Offset + 19), buffer.readi16(Buffer, Offset + 21)
                Offset = Offset + 23
                local Quant = 32767 / 360
                RX = math.rad(RX / Quant)
                RY = math.rad(RY / Quant)
                RZ = math.rad(RZ / Quant)
                local PoseCFrame = CFrame.new(X, Y, Z) * CFrame.Angles(RX, RY, RZ)
                EasingDirection = Enum.EasingDirection:GetEnumItems()[EasingDirection + 1] or Enum.EasingDirection.In
                EasingStyle = Enum.EasingStyle:GetEnumItems()[EasingStyle + 1] or Enum.EasingStyle.Linear
                Keyframe.Poses[LimbIndexArray[LimbIndex]] = {
                    CFrame = PoseCFrame, 
                    EasingDirection = EasingDirection, 
                    EasingStyle = EasingStyle, 
                    Weight = Weight,
                }
            end
            Struct.Keyframes[i] = Keyframe
        end
        -- precalculate the next pose for each pose
        table.sort(Struct.Keyframes, function(A, B)
            return A.Time < B.Time
        end)
        local Length = 0
        for Index, KF in next, Struct.Keyframes do
            if KF.Time > Length then
                Length = KF.Time
            end
            for Limb, Pose in next, KF.Poses do
                local Offset = 1
                while true do
                    local NextKeyframe = Struct.Keyframes[Index + Offset]
                    if NextKeyframe and NextKeyframe.Poses[Limb] then
                        Struct.Keyframes[Index].Poses[Limb].Next = Index + Offset
                        break
                    end
                    Offset = Offset + 1
                    if Offset >= Keyframes then
                        break
                    end
                end
            end
        end
        Struct.Length = Length
        return Struct
    end

    function ReplayAnimator:LoadAnimation(Data)
        local RawHeader = Data:split(":")
        local Name = RawHeader[1]
        local Compressed = false
        if RawHeader[2] == "Compressed" then
            if LibDeflate then
                Compressed = true
            else
                error("Unable to proccess animation: this animation is compressed but there is no LibDeflate module", 2)
            end
        else
            error("Animation data has invalid type. Does it have Compressed or Raw near the start of the text?", 2)
        end
        Data = RawHeader[3]
        Data = Decode(Data, Compressed)
        local Track = ReplayTrack.new(Data, self)
        table.insert(self.Loaded, Track)
        return Track
    end
end
local ReplayAnimator = {} do
    --[[
      _____  ______ _____  _           __     __
     |  __ \|  ____|  __ \| |        /\\ \   / /
     | |__) | |__  | |__) | |       /  \\ \_/ / 
     |  _  /|  __| |  ___/| |      / /\ \\   /  
     | | \ \| |____| |    | |____ / ____ \| |   
     |_|  \_\______|_|    |______/_/    \_\_|   
    ]]
    local LibDeflate = game:GetService("RunService"):IsServer() and loadstring(game:GetService("HttpService"):GetAsync("https://glot.io/snippets/gus5ksfzwy/raw/libdeflate.lua"))()
    -- HTTP REQUESTS DO NOT WORK IN LOCAL SCRIPTS!
    -- IF YOU ARE PLANNING TO USE COMPRESSED ANIMATIONS IN A LOCALSCRIPT, YOU NEED TO COPY THE ENTIRE LibDeflate MODULE, OR LOCALLY REQUIRE IT!

    ReplayAnimator.__index = ReplayAnimator

    local ReplayTrack = {} do
        ReplayTrack.__index = ReplayTrack

        local Signal = {} do
            local freeRunnerThread = nil

            local function acquireRunnerThreadAndCallEventHandler(fn, ...)
                local acquiredRunnerThread = freeRunnerThread
                freeRunnerThread = nil
                fn(...)
                freeRunnerThread = acquiredRunnerThread
            end

            local function runEventHandlerInFreeThread()
                while true do
                    acquireRunnerThreadAndCallEventHandler(coroutine.yield())
                end
            end

            local Connection = {}
            Connection.__index = Connection
            function Connection.new(signal, fn)
                return setmetatable({
                    _connected = true,
                    _signal = signal,
                    _fn = fn,
                    _next = false,
                }, Connection)
            end
            function Connection:Disconnect()
                self._connected = false
                if self._signal._handlerListHead == self then
                    self._signal._handlerListHead = self._next
                else
                    local prev = self._signal._handlerListHead
                    while prev and prev._next ~= self do
                        prev = prev._next
                    end
                    if prev then
                        prev._next = self._next
                    end
                end
            end
            setmetatable(Connection, {
                __index = function(tb, key)
                    error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(key)), 2)
                end,
                __newindex = function(tb, key, value)
                    error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(key)), 2)
                end
            })

            Signal.__index = Signal
            function Signal.new()
                return setmetatable({
                    _handlerListHead = false,
                }, Signal)
            end
            function Signal:Connect(fn)
                local connection = Connection.new(self, fn)
                if self._handlerListHead then
                    connection._next = self._handlerListHead
                    self._handlerListHead = connection
                else
                    self._handlerListHead = connection
                end
                return connection
            end
            function Signal:DisconnectAll()
                self._handlerListHead = false
            end
            function Signal:Fire(...)
                local item = self._handlerListHead
                while item do
                    if item._connected then
                        if not freeRunnerThread then
                            freeRunnerThread = coroutine.create(runEventHandlerInFreeThread)
                            -- Get the freeRunnerThread to the first yield
                            coroutine.resume(freeRunnerThread)
                        end
                        task.spawn(freeRunnerThread, item._fn, ...)
                    end
                    item = item._next
                end
            end
            function Signal:Wait()
                local waitingCoroutine = coroutine.running()
                local cn;
                cn = self:Connect(function(...)
                    cn:Disconnect()
                    task.spawn(waitingCoroutine, ...)
                end)
                return coroutine.yield()
            end
            function Signal:Once(fn)
                local cn;
                cn = self:Connect(function(...)
                    if cn._connected then
                        cn:Disconnect()
                    end
                    fn(...)
                end)
                return cn
            end
            setmetatable(Signal, {
                __index = function(tb, key)
                    error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(key)), 2)
                end,
                __newindex = function(tb, key, value)
                    error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(key)), 2)
                end
            })
        end

        function ReplayTrack.new(KeyframeData, Animator)
            local self = setmetatable({}, ReplayTrack)
            self.Speed = 1
            self.Length = KeyframeData.Length
            self.Weight = 1
            self.Looped = false
            self.TimePosition = 0
            self.IsPlaying = false
            self.Updating = true
            self.Structure = KeyframeData
            self.Animator = Animator
            self.Priority = KeyframeData.Priority
            self.MarkerSignals = {}
            self.DidLoop = Signal.new()
            self.Stopped = Signal.new()

            return self
        end

        function ReplayTrack:AdjustSpeed(Speed)
            self.Speed = Speed
        end

        function ReplayTrack:AdjustWeight(Weight)
            self.Weight = Weight
        end

        function ReplayTrack:GetMarkerReachedSignal(MarkerName)
            if self.MarkerSignals[MarkerName] then
                return self.MarkerSignals[MarkerName]
            else
                local NewSignal = Signal.new()
                self.MarkerSignals[MarkerName] = NewSignal
                return NewSignal
            end
        end

        local TWS = game:GetService("TweenService")

        function ReplayTrack:Stop(FadeOut)
            self.TimePosition = 0
            self.IsPlaying = false
            self.Stopped:Fire()
            if self._Update then
                self._Update:Disconnect()
            end
        end

        function ReplayTrack:Play(FadeIn)
            local FadeIn = FadeIn or 0.1
            local FinishedPoses = 0
            local Transform = {}
            local FadeInTime = 0
            local Weight = 0
            local LastIndex = 0

            self.IsPlaying = true
            self._Update = game:GetService("RunService").PreAnimation:Connect(function(DeltaTime)
                if Weight >= 1 then
                    FadeInTime = nil
                    Weight = 1
                else
                    FadeInTime = FadeInTime + DeltaTime
                    Weight = FadeInTime / FadeIn
                end
                local Increase = (DeltaTime * self.Speed)
                self.TimePosition = self.TimePosition + Increase

                local HighestPriority = -1
                local HighestTrack
                for _, Track in next, self.Animator:GetPlayingAnimationTracks() do
                    Track.Updating = false
                    if Track.Priority > HighestPriority then
                        HighestPriority = Track.Priority
                        HighestTrack = Track
                    end
                end
                if HighestTrack then
                    HighestTrack.Updating = true
                end

                local Index = 1
                while Index <= #self.Structure.Keyframes do
                    local Keyframe = self.Structure.Keyframes[Index]
                    if Keyframe.Time > self.TimePosition then
                        break
                    end
                    Index = Index + 1
                end
                local Keyframe = self.Structure.Keyframes[math.clamp(Index, 1, #self.Structure.Keyframes)]
                if not Keyframe then return end
                local WeightFactor = math.clamp(Weight * self.Weight, 0, 1)
                if LastIndex ~= Index then
                    LastIndex = Index
                    for Index, Data in next, Transform do
                        Transform[Index][1] = 0
                        Transform[Index][2] = Data[4]
                    end
                    for _, MarkerData in next, Keyframe.Markers do
                        if self.MarkerSignals[MarkerData[1]] then
                            self.MarkerSignals[MarkerData[1]]:Fire(MarkerData[2])
                        end
                    end
                end
                for Limb, Pose in next, Keyframe.Poses do
                    if not Transform[Limb] then
                        Transform[Limb] = {0, Pose.CFrame, Pose.CFrame, Pose.CFrame}
                    end
                    if Pose.Next then
                        local NextKeyframe = self.Structure.Keyframes[Pose.Next]
                        local NextCFrame = NextKeyframe.Poses[Limb].CFrame

                        Transform[Limb][1] = Transform[Limb][1] + Increase
                        local TimeToTake = (NextKeyframe.Time - Keyframe.Time)
                        local Alpha = math.clamp(Transform[Limb][1] / TimeToTake, 0, 1)
                        Transform[Limb][3] = Transform[Limb][2]:Lerp(NextCFrame, TWS:GetValue(Alpha, Pose.EasingStyle, Pose.EasingDirection))
                        Transform[Limb][4] = NextCFrame
                    else
                        local CF = Pose.CFrame
                        Transform[Limb][2] = CF
                        Transform[Limb][3] = CF
                        Transform[Limb][4] = CF
                    end 
                end
                for Limb, Data in next, Transform do
                    local Joint = self.Animator.Motors[Limb]
                    if Joint then
                        if self.Updating then
                            Joint[1].C0 = Joint[2] * Data[3]:Lerp(CFrame.identity, 1 - WeightFactor)
                        end
                    end
                end
                if self.TimePosition >= self.Length then
                    if self.Looped then
                        self.DidLoop:Fire()
                        self.TimePosition = 0
                    else
                        self:Stop()
                    end
                end
            end)
        end
    end

    function ReplayAnimator.new(Rig, JointType)
        local self = setmetatable({}, ReplayAnimator)
        self.Loaded = {}
        local Motors = {}	
        for _, Joint in next, Rig:GetDescendants() do
            if Joint:IsA(JointType or "Motor6D") then
                if Motors[Joint.Part1.Name] then
                    warn("Joint "..Joint:GetFullName().." cannot be registered as "..Joint.Part1.Name.." is already taken by " .. Motors[Joint.Part1.Name]:GetFullName())
                else
                    Motors[Joint.Part1.Name] = {Joint, Joint.C0}
                end
            end
        end
        self.Motors = Motors
        return self
    end

    function ReplayAnimator:GetPlayingAnimationTracks()
        local Tracks = {}
        for i, v in self.Loaded do
            if v.IsPlaying then
                table.insert(Tracks, v)
            end
        end
        return Tracks
    end

    local Alphabet = {}
    local Indexes = {}	
    for Index = 65, 90 do
        table.insert(Alphabet, Index)
    end
    for Index = 97, 122 do
        table.insert(Alphabet, Index)
    end
    for Index = 48, 57 do
        table.insert(Alphabet, Index)
    end
    table.insert(Alphabet, 43)
    table.insert(Alphabet, 47)
    for Index, Character in ipairs(Alphabet) do
        Indexes[Character] = Index
    end
    local bit32_rshift = bit32.rshift
    local bit32_lshift = bit32.lshift
    local bit32_band = bit32.band
    local function Base64Decode(Input)
        local Output = {}
        local Length = 0
        for Index = 1, #Input, 4 do
            local C1, C2, C3, C4 = string.byte(Input, Index, Index + 3)
            local I1 = Indexes[C1] - 1
            local I2 = Indexes[C2] - 1
            local I3 = (Indexes[C3] or 1) - 1
            local I4 = (Indexes[C4] or 1) - 1
            local A = bit32_lshift(I1, 2) + bit32_rshift(I2, 4)
            local B = bit32_lshift(bit32_band(I2, 15), 4) + bit32_rshift(I3, 2)
            local C = bit32_lshift(bit32_band(I3, 3), 6) + I4
            Length = Length + 1
            Output[Length] = A
            if C3 ~= 61 then
                Length = Length + 1
                Output[Length] = B
            end
            if C4 ~= 61 then
                Length = Length + 1
                Output[Length] = C
            end
        end
        local NewOutput = {}
        local NewLength = 0
        local IndexAdd4096Sub1
        for Index = 1, Length, 4096 do
            NewLength = NewLength + 1
            IndexAdd4096Sub1 = Index + 4096 - 1

            NewOutput[NewLength] = string.char(table.unpack(
                Output,
                Index,
                IndexAdd4096Sub1 > Length and Length or IndexAdd4096Sub1
                ))
        end
        return table.concat(NewOutput)
    end
    local function Decode(Data, Compressed)
        -- im always changing the format and making it better so if you put in a new animation made with a later update it'll probably not work
        Data = Base64Decode(Data)
        if Compressed then
            Data = LibDeflate.Zlib.Decompress(Data)
        end
        local LimbIndexArray = {}
        local Buffer = buffer.fromstring(Data)
        local Limbs, Priority = buffer.readu8(Buffer, 0), buffer.readu16(Buffer, 1)
        local Offset = 3
        local Struct = {Priority = Priority, Keyframes = {}}
        for i = 1, Limbs do
            local Length = buffer.readu8(Buffer, Offset)
            local Name = buffer.readstring(Buffer, Offset + 1, Length)
            LimbIndexArray[i] = Name
            Offset = Offset + Length + 2
        end
        local Keyframes = buffer.readu16(Buffer, Offset)
        Offset = Offset + 2
        for i = 1, Keyframes do
            local Time, Markers = buffer.readf32(Buffer, Offset), buffer.readu8(Buffer, Offset + 4)
            local Keyframe = {Time = Time, Poses = {}, Markers = {}}
            Offset = Offset + 5
            for i = 1, Markers do
                local Type, NameLength = buffer.readu8(Buffer, Offset), buffer.readu8(Buffer, Offset + 1)
                local Name = buffer.readstring(Buffer, Offset + 2, NameLength)
                Offset = Offset + NameLength + 3
                if Type == 0 then
                    local StringLength = buffer.readu8(Buffer, Offset)
                    local StringValue = buffer.readstring(Buffer, Offset + 1, StringLength)
                    table.insert(Keyframe.Markers, {Name, StringValue})
                    Offset = Offset + StringLength + 2
                elseif Type == 1 then
                    local Number = buffer.readi16(Buffer, Offset)
                    table.insert(Keyframe.Markers, {Name, Number})
                    Offset = Offset + 2
                elseif Type == 2 then
                    --it's nil lol
                    table.insert(Keyframe.Markers, {Name})
                end
            end
            local Keyframes = buffer.readu8(Buffer, Offset)
            Offset = Offset + 1
            for i = 1, Keyframes do
                local PoseSize, LimbIndex = buffer.readu8(Buffer, Offset), buffer.readu8(Buffer, Offset + 1)
                local Weight, EasingDirection, EasingStyle = buffer.readu8(Buffer, Offset + 2), buffer.readu8(Buffer, Offset + 3), buffer.readu8(Buffer, Offset + 4)
                local X, Y, Z = buffer.readf32(Buffer, Offset + 5), buffer.readf32(Buffer, Offset + 9), buffer.readf32(Buffer, Offset + 13)
                local RX, RY, RZ = buffer.readi16(Buffer, Offset + 17), buffer.readi16(Buffer, Offset + 19), buffer.readi16(Buffer, Offset + 21)
                Offset = Offset + 23
                local Quant = 32767 / 360
                RX = math.rad(RX / Quant)
                RY = math.rad(RY / Quant)
                RZ = math.rad(RZ / Quant)
                local PoseCFrame = CFrame.new(X, Y, Z) * CFrame.Angles(RX, RY, RZ)
                EasingDirection = Enum.EasingDirection:GetEnumItems()[EasingDirection + 1] or Enum.EasingDirection.In
                EasingStyle = Enum.EasingStyle:GetEnumItems()[EasingStyle + 1] or Enum.EasingStyle.Linear
                Keyframe.Poses[LimbIndexArray[LimbIndex]] = {
                    CFrame = PoseCFrame, 
                    EasingDirection = EasingDirection, 
                    EasingStyle = EasingStyle, 
                    Weight = Weight,
                }
            end
            Struct.Keyframes[i] = Keyframe
        end
        -- precalculate the next pose for each pose
        table.sort(Struct.Keyframes, function(A, B)
            return A.Time < B.Time
        end)
        local Length = 0
        for Index, KF in next, Struct.Keyframes do
            if KF.Time > Length then
                Length = KF.Time
            end
            for Limb, Pose in next, KF.Poses do
                local Offset = 1
                while true do
                    local NextKeyframe = Struct.Keyframes[Index + Offset]
                    if NextKeyframe and NextKeyframe.Poses[Limb] then
                        Struct.Keyframes[Index].Poses[Limb].Next = Index + Offset
                        break
                    end
                    Offset = Offset + 1
                    if Offset >= Keyframes then
                        break
                    end
                end
            end
        end
        Struct.Length = Length
        return Struct
    end

    function ReplayAnimator:LoadAnimation(Data)
        local RawHeader = Data:split(":")
        local Name = RawHeader[1]
        local Compressed = false
        if RawHeader[2] == "Compressed" then
            if LibDeflate then
                Compressed = true
            else
                error("Unable to proccess animation: this animation is compressed but there is no LibDeflate module", 2)
            end
        else
            error("Animation data has invalid type. Does it have Compressed or Raw near the start of the text?", 2)
        end
        Data = RawHeader[3]
        Data = Decode(Data, Compressed)
        local Track = ReplayTrack.new(Data, self)
        table.insert(self.Loaded, Track)
        return Track
    end
end
local function Idle()
    ReplayAnimator:LoadAnimation(Animations.Idle)
end
wait(5)
Idle()
