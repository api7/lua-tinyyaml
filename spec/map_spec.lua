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

      -- trailing whitespace after colon
      assert.same(
        {
          a = {{b = {c = 1}}}
        },
        yaml.parse([[
          a:
          - b:  
              c:  1
          ]])
        )
  end)

  busted.it("map with slash for item", function()

    assert.same(
        {
          value = "/a"
        },
        yaml.parse([[
          value: /a
        ]])
      )

    assert.same(
        {
          value = {"/a"}
        },
        yaml.parse([[
          value:
            - /a
        ]])
      )
  end)

  busted.it("map with underscore for item", function()

    assert.same(
        {
          value = "_a"
        },
        yaml.parse([[
          value: _a
        ]])
      )

    assert.same(
        {
          value = {"_a"}
        },
        yaml.parse([[
          value:
            - _a
        ]])
      )
  end)

  busted.it("map with dash for item", function()

    assert.same(
        {
          value = "-a"
        },
        yaml.parse([[
          value: -a
        ]])
      )

    assert.same(
        {
          value = {"-a"}
        },
        yaml.parse([[
          value:
            - -a
        ]])
      )
  end)

  busted.it("map with space for item", function()

    assert.same(
        {
          value = "a 1"
        },
        yaml.parse([[
          value: a 1
        ]])
      )

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
