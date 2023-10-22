local function FC_Screenshot_Delay(duration, fn)
    local frame = CreateFrame("Frame")

    local ag = frame:CreateAnimationGroup()
    ag:SetLooping("NONE")

    local ani = ag:CreateAnimation("Animation");
    ani:SetOrder(1);
    ani:SetDuration(duration)

    ag:SetScript("OnFinished", function(self)
        fn()
    end)

    ag:Play()
end

FC_RegisterCommand("screenshot", "Take screenshot on events", function(args)
    local delay = args["delay"]

    if delay then
        FC_Screenshot_Delay(delay, Screenshot)
    else
        Screenshot()
    end
end)
