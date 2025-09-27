{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.zsh.you-should-use;
  zsh-you-should-use = pkgs.callPackage ../../../packages/zsh-you-should-use { };
  
in {
  options.programs.zsh.you-should-use = {
    enable = mkEnableOption "zsh-you-should-use plugin";
    
    package = mkOption {
      type = types.package;
      default = zsh-you-should-use;
      description = "Package to use for zsh-you-should-use plugin";
    };

    messagePosition = mkOption {
      type = types.enum [ "before" "after" ];
      default = "before";
      description = "Where to display the reminder message (before or after command execution)";
    };

    hardcoreMode = mkOption {
      type = types.bool;
      default = false;
      description = "Enable hardcore mode (prevents command execution if alias exists)";
    };

    checkAliasType = mkOption {
      type = types.enum [ "alias" "global_alias" "all" ];
      default = "all";
      description = "What type of aliases to check for";
    };

    checkGlobalAliases = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to check global aliases";
    };

    reminderMessage = mkOption {
      type = types.str;
      default = "Found existing %alias_type for \"%command\". You should use: \"%alias\"";
      description = "Custom reminder message template";
    };

    displayTime = mkOption {
      type = types.nullOr types.float;
      default = null;
      description = "Time in seconds to display the reminder message";
    };

    persistentHistory = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to check persistent history for aliases";
    };

    ignoredAliases = mkOption {
      type = types.listOf types.str;
      default = [ ];
      example = [ "g" "ll" "la" ];
      description = "List of aliases to ignore when showing reminders";
    };

    disableHints = mkOption {
      type = types.bool;
      default = false;
      description = "Disable all hints from the plugin";
    };
  };

  config = mkIf (config.programs.zsh.enable && cfg.enable) {
    home.packages = [ cfg.package ];
    programs.zsh = {
      plugins = [
        {
          name = "you-should-use";
          src = "${cfg.package}/share/zsh/plugins/zsh-you-should-use";
          file = "you-should-use.plugin.zsh";
        }
      ];

      initContent = ''
        # zsh-you-should-use configuration
        export YSU_MESSAGE_POSITION="${cfg.messagePosition}"
        ${optionalString cfg.hardcoreMode ''export YSU_HARDCORE=1''}
        ${optionalString (cfg.checkAliasType != "all") ''export YSU_MODE="${cfg.checkAliasType}"''}
        ${optionalString (!cfg.checkGlobalAliases) ''export YSU_IGNORE_GLOBALALIAS=1''}
        ${optionalString (cfg.reminderMessage != "Found existing %alias_type for \"%command\". You should use: \"%alias\"") ''
          export YSU_MESSAGE_FORMAT="${cfg.reminderMessage}"
        ''}
        ${optionalString (cfg.displayTime != null) ''export YSU_DISPLAY_TIME=${toString cfg.displayTime}''}
        ${optionalString (!cfg.persistentHistory) ''export YSU_IGNORE_HISTORY=1''}
        ${optionalString (cfg.ignoredAliases != [ ]) ''
          export YSU_IGNORED_ALIASES=(${concatStringsSep " " (map (alias: ''"${alias}"'') cfg.ignoredAliases)})
        ''}
        ${optionalString cfg.disableHints ''export YSU_HINT_DISABLE=1''}
      '';
    };
  };
}
