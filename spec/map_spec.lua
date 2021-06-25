-- .vscode/settings.json <<
--   "Lua.workspace.library": {
--     "C:\\ProgramData\\chocolatey\\lib\\luarocks\\luarocks-2.4.4-win32\\systree\\share\\lua\\5.1": true
--   },
local busted = require 'busted'
local assert = require 'luassert'
local yaml = require 'tinyyaml'

busted.describe("map", function()

  busted.it("map with colon for item", function()

    assert.same(
        {
          value = {"a:1"}
        },
        yaml.parse([[
          value:
            - a:1
        ]])
      )

    assert.same(
        {
          value = {"a:1"}
        },
        yaml.parse([[
          value:
            - "a:1"
        ]])
      )

      assert.same(
        {
          value = {{a = 1}}
        },
        yaml.parse([[
          value:
            - a: 1
        ]])
      )

      assert.same(
        {
          a = {{b = {c = 1}}}
        },
        yaml.parse([[
          a:
          - b:
              c: 1
          ]])
        )
  end)

  busted.it("map with slash for item", function()

    assert.same(
        {
          value = {"a/1"}
        },
        yaml.parse([[
          value:
            - a/1
        ]])
      )

    assert.same(
        {
          value = {"/1"}
        },
        yaml.parse([[
          value:
            - /1
        ]])
      )
  end)

  busted.it("map with underscore for item", function()

    assert.same(
        {
          value = {"a_1"}
        },
        yaml.parse([[
          value:
            - a_1
        ]])
      )
  end)

  busted.it("map with dash for item", function()

    assert.same(
        {
          value = {"a-1"}
        },
        yaml.parse([[
          value:
            - a-1
        ]])
      )
  end)

  busted.it("map with space for item", function()

    assert.same(
        {
          value = {"a 1"}
        },
        yaml.parse([[
          value:
            - a 1
        ]])
      )
  end)
end)
