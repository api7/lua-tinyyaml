package = "api7-lua-tinyyaml"
version = "0.1.0-0"
source = {
   url = "git://github.com/api7/lua-tinyyaml",
   tag = "v0.1.0"
}

description = {
   summary = "a tiny yaml (subset) parser for pure lua",
   homepage = "https://github.com/api7/lua-tinyyaml",
   license = "MIT License",
   maintainer = "Yuansheng Wang <membphis@gmail.com>"
}

build = {
   type = "builtin",
   modules = {
      ["tinyyaml"] = "tinyyaml.lua"
   }
}
