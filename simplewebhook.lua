-- Script will execute when a donation is received
donator = getgenv().donator
amount = getgenv().amount
local bt = amount
local at = amount * 0.6
local Players = game:GetService("Players")
local name= Players.LocalPlayer.DisplayName
local total = Players.LocalPlayer.leaderstats.Raised.Value
local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"

local url =
   "https://discord.com/api/webhooks/urwebhook"
local data = {
   ["content"] = "",
   ["embeds"] = {
       {
           ["title"] = "New Donation!\n",
           ["description"] = "<:person:866043291316781087> Account\n```"..name.."```\n<:robux:1078310114655748206> Before Tax\n```"..bt.."```\n<:Money:833290714422181928> After Tax\n```"..math.floor(at).."```",
           ["color"]= 4585472
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
