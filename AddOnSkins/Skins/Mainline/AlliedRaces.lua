local AS, L, S, R = unpack(AddOnSkins)

local _G = _G
local select = select

function S:Blizzard_AlliedRacesUI()
	if not AS:IsSkinEnabled('Blizzard_AlliedRacesUI', 'alliedRaces') then return end

	local AlliedRacesFrame = _G.AlliedRacesFrame
	if AS:CheckOptions('Parchment') then
		AlliedRacesFrame.NineSlice:SetAlpha(0)
		_G.AlliedRacesFramePortrait:SetAlpha(0)
		_G.AlliedRacesFrameBg:SetAlpha(0)
		AlliedRacesFrame.ModelFrame:StripTextures()
		AlliedRacesFrame:SetTemplate('Transparent')

		local scrollFrame = AlliedRacesFrame.RaceInfoFrame.ScrollFrame
		scrollFrame.ScrollBar.Border:Hide()
		scrollFrame.ScrollBar.ScrollUpBorder:Hide()
		scrollFrame.ScrollBar.ScrollDownBorder:Hide()
		S:HandleScrollBar(scrollFrame.ScrollBar)

		S:HandleCloseButton(_G.AlliedRacesFrameCloseButton)
	else
		S:HandlePortraitFrame(AlliedRacesFrame)
		select(2, AlliedRacesFrame.ModelFrame:GetRegions()):Hide()

		local scrollFrame = AlliedRacesFrame.RaceInfoFrame.ScrollFrame
		scrollFrame.ScrollBar.Border:Hide()
		scrollFrame.ScrollBar.ScrollUpBorder:Hide()
		scrollFrame.ScrollBar.ScrollDownBorder:Hide()
		S:HandleScrollBar(scrollFrame.ScrollBar)

		S:HandleFrame(scrollFrame.Child.ObjectivesFrame)

		AlliedRacesFrame.RaceInfoFrame.AlliedRacesRaceName:SetTextColor(1, .8, 0)
		scrollFrame.Child.RaceDescriptionText:SetTextColor(1, 1, 1)
		scrollFrame.Child.RacialTraitsLabel:SetTextColor(1, .8, 0)
	end

	AlliedRacesFrame:HookScript('OnShow', function(s)
		for button in s.abilityPool:EnumerateActive() do
			select(3, button:GetRegions()):Hide()
			S:HandleIcon(button.Icon, true)

			if not AS:CheckOptions('Parchment') then
				button.Text:SetTextColor(1, 1, 1)
			end
		end
	end)
end

S:AddCallbackForAddon('Blizzard_AlliedRacesUI')
