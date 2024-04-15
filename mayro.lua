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

    function ReplayAnimator:LoadAnimation(Data,self)
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
	["Idle"]="Idle:Compressed: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",
}
local function Idle()
    local dud = ReplayAnimator.new(person,"Motor6D")
    local IdleAnim = ReplayAnimator:LoadAnimation(Animations.Idle,dud)
    IdleAnim.Looped = true
    IdleAnim:Play(1)
end
wait(5)
Idle()
