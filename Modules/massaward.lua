local addonName, bepgp = ...
local moduleName = addonName.."_massaward"
local bepgp_massaward = bepgp:NewModule(moduleName)
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local GUI = LibStub("AceGUI-3.0")
local LW = LibStub("LibWindow-1.1")

local add_ep = false
local add_gp = false
local epgp_value = 0
local memberlist = {}
local input_box_string = ""

function bepgp_massaward:OnEnable()
  local container = GUI:Create("Window")
  container:SetTitle(L["BastionEPGP Mass Award"])
  container:SetWidth(445)
  container:SetHeight(360)
  container:EnableResize(false)
  container:SetLayout("List")
  container:Hide()

  self._container = container

  local input_box = GUI:Create("MultiLineEditBox")
  input_box:SetLabel("Members")
  input_box:SetMaxLetters(0)
  input_box:DisableButton(true)
  input_box:SetWidth(420)
  input_box:SetHeight(200)
  input_box:SetCallback("OnTextChanged", function(text)
    input_box_string = input_box:GetText()
  end)
  container:AddChild(input_box)

  local ep_checkbox = GUI:Create("CheckBox")
  ep_checkbox:SetLabel("EP")
  ep_checkbox:SetValue(add_ep)
  ep_checkbox:SetCallback("OnValueChanged", function(value)
    if ep_checkbox:GetValue() then
      add_ep = true
      --gp_checkbox:ToggleChecked()
    else
      add_ep = false
    end
  end)
  container:AddChild(ep_checkbox)

  local gp_checkbox = GUI:Create("CheckBox")
  gp_checkbox:SetLabel("GP")
  gp_checkbox:SetValue(add_gp)
  gp_checkbox:SetCallback("OnValueChanged", function(value)
    if gp_checkbox:GetValue() then
      add_gp = true
      --ep_checkbox:ToggleChecked()
    else
      add_gp = false
    end
  end)
  container:AddChild(gp_checkbox)

  local value_box = GUI:Create("EditBox")
  value_box:SetLabel("Value")
  value_box:SetText(tostring(epgp_value))
  value_box:DisableButton(true)
  value_box:SetWidth(100)
  value_box:SetCallback("OnTextChanged", function(text)
    epgp_value = value_box:GetText()
  end)
  container:AddChild(value_box)

  local execute_button = GUI:Create("Button")
  execute_button:SetAutoWidth(true)
  execute_button:SetText("Execute")
  execute_button:SetWidth(100)
  execute_button:SetCallback("OnClick",function()
    bepgp_massaward:multiadd()
  end)
  container:AddChild(execute_button)
end

function bepgp_massaward:Toggle()
  if self._container.frame:IsShown() then
    self._container:Hide()
  else
    self._container:Show()
  end
end

function bepgp_massaward:multiadd()
  memberlist = {}
  --multi-line input into table
  for line in input_box_string:gmatch("[^\r\n,]+") do
    table.insert(memberlist, line)
  end
  --output
  for k, v in ipairs(memberlist) do
    if add_ep and add_gp then
      bepgp:Print("Both Add EP and Add GP Checked!")
      return false;
    elseif epgp_value ~= 0 and add_ep then
      bepgp:givename_ep(v, tonumber(epgp_value))
    elseif epgp_value ~= 0 and add_gp then
      bepgp:givename_gp(v, tonumber(epgp_value))
    end
  end
end
