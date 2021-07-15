-- .vscode/settings.json <<
--   "Lua.workspace.library": {
--     "C:\\ProgramData\\chocolatey\\lib\\luarocks\\luarocks-2.4.4-win32\\systree\\share\\lua\\5.1": true
--   },
local busted = require 'busted'
local assert = require 'luassert'
local yaml = require 'tinyyaml'

busted.describe("empty", function()

  busted.it("empty:", function()
    assert.same(
      nil,
      yaml.parse([[]])
    )
    assert.same(
      nil,
      yaml.parse([[
        #END
      ]])
    )
  end)
end)
