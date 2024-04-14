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
local Animations = {
	["Idle"]="Idle:Raw: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",
}
local function Idle()
    ReplayAnimator:LoadAnimation(Animations.Idle)
end
wait(5)
Idle()
