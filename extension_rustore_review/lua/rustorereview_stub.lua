-- Stub for Defold Editor (autocomplete + diagnostics).
-- Runtime module is provided by native extension via luaL_register(MODULE_NAME, Module_methods).
-- Do not require this file.

---@class rustorereview
local M = {}

--- Инициализация review SDK.
function M.init() end

--- Запросить Review Flow.
function M.request_review_flow() end

--- Запустить Review Flow (показать экран оценки).
function M.launch_review_flow() end

---@type rustorereview
rustorereview = rustorereview
