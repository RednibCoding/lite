local syntax = require "core.syntax"

syntax.add {
  files = { "%.reg$" },
  comment = ";",
  patterns = {
    { pattern = ";[^\n]*",                 type = "comment"  }, -- Comments
    { pattern = { '"', '"', '\\' },        type = "string"   }, -- Double-quoted strings
    { pattern = "[%a_][%w_]*",             type = "keyword2" }, -- Registry value types
    { pattern = "[%w_]+",                  type = "number"   }, -- Hexadecimal and DWORD values
    { pattern = "[%[%]]",                  type = "keyword"  }, -- Registry key brackets
  },
  symbols = {
    -- Common registry value types
    ["dword"]    = "keyword2",
    ["hex"]      = "keyword2",
    ["hex(b)"]   = "keyword2", -- Binary data
    ["hex(7)"]   = "keyword2", -- Multi-string
    ["hex(2)"]   = "keyword2", -- Expandable string value

    -- Special keywords
    ["HKEY_LOCAL_MACHINE"] = "keyword",
    ["HKEY_USERS"]         = "keyword",
    ["HKEY_CURRENT_USER"]  = "keyword",
    ["HKEY_CLASSES_ROOT"]  = "keyword",
    ["HKEY_CURRENT_CONFIG"]= "keyword",
  },
}
