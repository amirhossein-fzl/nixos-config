{ config, lib, pkgs, ... }:

{
  # Timezone
  time.timeZone = "Asia/Tehran";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # Console configuration
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };
}

