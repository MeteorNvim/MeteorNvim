vim.cmd([[aunmenu PopUp]])

-- Normal - Insert
vim.cmd([[:amenu 90.100 Meteor.Go\ to\ Definition <cmd>:lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 90.100 Meteor.Go\ to\ Type\ Definition <cmd>:lua vim.lsp.buf.type_definition()<CR>]])
vim.cmd([[:amenu 90.100 Meteor.Go\ to\ Implementations <cmd>:Telescope lsp_implementations<CR>]])
vim.cmd([[:amenu 90.100 Meteor.Go\ to\ References <cmd>:Telescope lsp_references<CR>]])
vim.cmd([[:amenu 90.100 Meteor.-1- *]])
vim.cmd([[:amenu 90.100 Meteor.Rename\ Definition <cmd>:lua require('renamer').rename()<CR>]])
vim.cmd([[:amenu 90.100 Meteor.Code\ Actions <cmd>:lua require('telescope').extensions.code_actions.code_actions()<CR>]])
vim.cmd([[:amenu 90.100 Meteor.-2- *]])

-- Colorpicker
vim.cmd([[:amenu 90.100 Meteor.Color\ Picker <cmd>:CccPick<CR>]])
vim.cmd([[:amenu 90.100 Meteor.Change\ Color\ Format <cmd>:CccConvert<CR>]])
vim.cmd([[:amenu 90.100 Meteor.-3- *]])

-- Copy/Cut/Paste
vim.cmd([[:imenu 90.100 Meteor.Copy <C-C>]])
vim.cmd([[:nmenu 90.100 Meteor.Copy <C-C>]])
vim.cmd([[:imenu 90.100 Meteor.Cut <C-X>]])
vim.cmd([[:nmenu 90.100 Meteor.Cut <C-X>]])
vim.cmd([[:imenu 90.100 Meteor.Paste <C-V>]])
vim.cmd([[:nmenu 90.100 Meteor.Paste <C-V>]])

vim.cmd([[:amenu 90.100 Meteor.-4- *]])
-- Format Document
vim.cmd([[:amenu 90.100 Meteor.Format\ Document <cmd>:Neoformat<CR>]])

-- Visual
vim.cmd([[:vmenu 90.110 VMeteor.Copy "+y]])
vim.cmd([[:vmenu 90.110 VMeteor.Cut "+x]])
vim.cmd([[:vmenu 90.110 VMeteor.Paste <C-V>]])
vim.cmd([[:amenu 90.110 VMeteor.-1- *]])
vim.cmd([[:vmenu 90.110 VMeteor.Delete "_d]])

vim.cmd([[:imenu 90.110 VMeteor.Copy "+y]])
vim.cmd([[:imenu 90.110 VMeteor.Cut "+x]])
vim.cmd([[:imenu 90.110 VMeteor.Paste <C-V>]])
vim.cmd([[:imenu 90.110 VMeteor.Delete "_dd]])