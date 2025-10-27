Feature: vimplug script
  Installs vim-plug for Vim or Neovim and runs plugin management commands.

  Scenario: Install vim-plug for Neovim
    Given nvim is installed and plug.vim is missing
    When I run "vimplug"
    Then the script downloads plug.vim into the Neovim autoload directory and runs PlugInstall, PlugUpgrade, PlugUpdate, and PlugClean!

  Scenario: Install vim-plug for Vim
    Given nvim is not installed but vim is available and plug.vim is missing
    When I run "vimplug"
    Then the script downloads plug.vim into the Neovim autoload directory and runs the same maintenance commands with vim

  Scenario: Do nothing when editors are absent
    Given neither nvim nor vim is installed
    When I run "vimplug"
    Then the script exits with status 1
