module("luci.controller.eqos", package.seeall)

local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"

function index()
        if not nixio.fs.access("/etc/config/eqos") then
                return
        end
        local e = entry({"admin", "network", "eqos"}, cbi("eqos"), _("Client QoS"), 100)
        e.acl_depends = { "luci-app-eqos" }
        e.dependent = true
end
