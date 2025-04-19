{
  # build tools
  lib,
  symlinkJoin,
  makeWrapper,
  callPackage,
  runCommandLocal,
  writeText,
  # pkgs
  neovim-unwrapped,
  vimPlugins,
  # pass via this option plugins that use
  # options we don't have access, like Stylix colors
  extraPlugins ? [],
}: let
  packageName = "mypackage";

  foldPlugins = builtins.foldl' (acc: next: 
    acc
    ++ [ next ]
    ++ (foldPlugins (next.dependencies or []))
  ) [];

  plugins = callPackage ./plugins.nix {};

  startPlugins = with vimPlugins; [
    lz-n
  ] ++ extraPlugins ++ plugins.start;
  optPlugins = plugins.opt;

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);
  optPluginsWithDeps = lib.unique (foldPlugins optPlugins);

  packpath = let
    symlinkPlugin = dest: plugin:
      "ln -vsfT ${plugin} $out/pack/${packageName}/${dest}/${lib.getName plugin}";

    symlinkPlugins = dest: plugins:
      lib.concatMapStringsSep "\n"
      (plugin: symlinkPlugin dest plugin)
      plugins;
  in runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ln -vsfT ${./config} $out/pack/${packageName}/start/config

    ${symlinkPlugins "start" startPluginsWithDeps}
    ${symlinkPlugins "opt" optPluginsWithDeps}
  '';
in symlinkJoin {
  name = "neovim-custom";
  paths = [ neovim-unwrapped ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/nvim \
      --add-flags '-u' \
      --add-flags NORC \
      --add-flags '--cmd' \
      --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
      --set-default NVIM_APPNAME nvim-custom
  '';
  passthru = {
    inherit packpath;
  };
  meta = {
    mainProgram = "nvim";
  };
}

