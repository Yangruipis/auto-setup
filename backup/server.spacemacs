;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(typescript
     nginx
     asciidoc
     rust
     sql
     javascript
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-complete-with-key-sequence 3
                      auto-completion-complete-with-key-sequence-delay 0.5
                      spacemacs-default-company-backends '(company-files company-capf))
     ;; better-defaults
     emacs-lisp
     ;; (python :variables python-backend 'lsp)
     (python :variables python-backend 'lsp python-lsp-server 'mspyls)
     git
     helm
     lsp
     (markdown :variables
               markdown-live-preview-engine 'vmd
               markdown-mmm-auto-modes '("c" "c++" "python" "scala" ("elisp" "emacs-lisp"))
               )
     multiple-cursors
     org
     html
     yaml
     (json :variables json-backend 'json-mode)
     (cmake :variables cmake-backend 'company-cmake)
     (c-c++ :variables
            c-c++-adopt-subprojects t
            c-c++-backend 'lsp-ccls
            lsp-clients-clangd-args '("-j=6" "--background-index=true" "-log=info" "--compile-commands-dir=build" "--pch-storage=memory")
            ;; c-c++-lsp-enable-semantic-highlight 'rainbow
            )
     (go :variables go-backend 'lsp go-format-before-save t gofmt-command "gofmt")
     protobuf
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     treemacs
     (docker :variablesdocker-dockerfile-backend 'lsp)
     restclient
     (vue :variables vue-backend 'lsp)
     (sql :variables
          sql-backend 'lsp
          sql-capitalize-keywords t
          sql-lsp-sqls-workspace-config-path 'workspace)
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      all-the-icons
                                      nyan-mode
                                      figlet
                                      ace-jump-mode
                                      posframe
                                      yasnippet-snippets
                                      ivy
                                      counsel
                                      swiper
                                      sphinx-doc
                                      find-file-in-project
                                      htmlize
                                      ;; autopair
                                      plantuml-mode
                                      counsel-etags
                                      edit-indirect
                                      company-tabnine
                                      goto-chg
                                      sqlformat
                                      go-mode
                                      go-tag
                                      go-eldoc
                                      go-guru
                                      go-impl
                                      go-rename
                                      godoctor
                                      dracula-theme
                                      ob-go
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company-go)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(dracula
                         )
   ;; dotspacemacs-themes '(spacemacs-dark
   ;;                       spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq configuration-layer-elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq display-time-24hr-format t)
(display-time)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)
;; (setq lsp-diagnostic-package :none) ; 禁用 lsp flycheck checker
(setq-default flycheck-disabled-checkers '(sh-posix-dash sh-posix-bash sh-bash sh-zsh)) ;; bash use sh-shellcheck as default checker
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (global-company-mode)
  (set-foreground-color "white")
  (auto-fill-mode -1)

  (nyan-mode)
  (nyan-start-animation)

  ;; (autopair-global-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; drop duplicate helm history
  (setq history-delete-duplicates t)
  (delete-dups extended-command-history)

  (global-set-key (kbd "M-m f f") 'company-files)
  (global-set-key (kbd "C-c r") 'replace-string)
  (global-set-key (kbd "C-c M-r") 'emr-show-refactor-menu)

  ;; window layout
  (global-set-key (kbd "C-x p") 'winner-undo)
  (global-set-key (kbd "C-x j") 'winner-redo)

  ;; ace jump
  (global-set-key (kbd "M-p") 'ace-jump-mode)
  ;; switch window
  (global-set-key [C-tab] (quote other-window))

  ;; Ibuffer
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key [remap list-buffers] 'ibuffer)
  ;; delete backward
  (global-set-key [C-backspace] 'delete-horizontal-space)

  ;; python
  ;; sphinx-doc
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))
  (setq blacken-line-length 100)
  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c i") 'blacken-buffer)))
  (add-hook 'python-mode-hook
            (lambda ()
              ;; (setq flycheck-python-pylint-executable "/Users/r.yang/miniconda3/envs/py37/bin/pylint"
              ;;       flycheck-pylintrc "/Users/r.yang/.pylintrc"
              ;;       flycheck-checker 'python-pylint)
              ;; (flycheck-select-checker 'python-pylint)
              ))
  (add-hook 'lsp-mode-hook
            (lambda ()
              (lsp-register-custom-settings
               `(("python.pythonPath" "/home/r.yang/miniconda3/envs/py37/bin/python")
                 ("python.venvPath" "/home/r.yang/miniconda3/envs/py37/")))
              ))
  (add-hook 'lsp-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c M-r") 'lsp-rename)))
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

  ;; company mode
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-p") 'company-select-previous))
  (with-eval-after-load 'company
    (setq company-idle-delay 0.2 ;; 菜单延迟
          company-minimum-prefix-length 2 ;; 开始补全字数
          company-show-numbers t ;; 显示序号
          ))
  ;; swiper
  (require 'swiper)
  (require 'find-file-in-project)
  (global-set-key "\C-s" 'swiper-isearch)
  (global-set-key "\C-r" 'swiper-isearch-backward)
  (global-set-key (kbd "\C-c s") 'swiper-all)          ;; 'S'wiper all
  (global-set-key (kbd "\C-c o") 'swiper-isearch-thing-at-point) ;; search at P'o'int
  ;; use rgrep 如果指定文件后缀
  (global-set-key (kbd "\C-c a") 'helm-do-grep-ag) ;; 'A'g
  (global-set-key (kbd "\C-c f") 'ffip)            ;; find 'F'ile

  (global-set-key (kbd "\C-c m") 'helm-imenu)
  (global-set-key (kbd "\C-c \C-m") 'helm-imenu-in-all-buffers)

  (add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

  (use-package org
    :config
    (setq org-startup-indented t))
  (add-hook 'org-mode-hook 'toggle-truncate-lines)

  ;; org to html
  (setq org-html-head-include-default-style nil)
  (setq org-html-htmlize-output-type 'inline-css)
  (setq org-link-file-path-type 'relative)

  ;; org code block
  (defun org-insert-src-block (src-code-type)
    "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
    (interactive
     (let ((src-code-types
            '("emacs-lisp" "python :results output" "C" "sh" "java" "js" "clojure" "C++" "css"
              "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
              "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
              "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
              "scheme" "sqlite")))
       (list (ido-completing-read "Source code type: " src-code-types))))
    (progn
      (newline-and-indent)
      (insert (format "#+BEGIN_SRC %s\n" src-code-type))
      (newline-and-indent)
      (insert "#+END_SRC\n")
      (previous-line 2)
      (org-edit-src-code)))
  (setq org-src-fontify-natively t)

  ;; ;; golang
  ;; ;; GO-LANG LSP
  ;; (use-package lsp-mode
  ;;   :ensure t
  ;;   :commands (lsp lsp-deferred)
  ;;   :hook (go-mode . lsp-deferred))

  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  ;; (defun lsp-go-install-save-hooks ()
  ;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
  ;;   ;; (add-hook 'before-save-hook #'lsp-organize-imports t t)
  ;;   )
  ;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  ;; (add-hook 'go-mode-hook #'lsp)

  ;; (add-hook 'sh-mode-hook #'lsp-go-install-save-hooks)
  ;; (add-hook 'sh-mode-hook #'lsp)

  (add-hook 'go-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c i") 'lsp-format-buffer)
              (setq tab-width 4)
              (setq standard-indent 4)
              ))
  (add-hook 'go-mode-hook
            (lambda ()
              (local-set-key (kbd "M-.") 'lsp-find-definition)))
  (add-hook 'go-mode-hook
            (lambda ()
              (local-set-key (kbd "M-?") 'lsp-ui-peek-find-references)))
  (add-hook 'go-mode-hook
            (lambda ()
              (local-set-key (kbd "M-=") 'lsp-find-definition)))
  (add-hook 'go-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c m") 'lsp-ui-imenu)))
  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c m") #'imenu-list-smart-toggle)))
  (add-hook 'python-mode-hook
            (lambda ()
              (local-set-key (kbd "M-?") 'lsp-ui-peek-find-references)))

  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "M-.") 'lsp-find-definition)))

  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "M-?") 'lsp-ui-peek-find-references)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "M-=") 'lsp-find-declaration)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c m") 'lsp-ui-imenu)))

  ;; Optional - provides fancier overlays.
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :init
    (setq lsp-ui-doc-border "orange"))

  ;; proto indent
  (require 'protobuf-mode)
  (defconst my-protobuf-style
    '((c-basic-offset . 4)
      (indent-tabs-mode . nil)))
  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t)))

  (lsp-treemacs-sync-mode 1)

  (add-hook 'c++-mode-hook (lambda () (company-mode t)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c i") 'clang-format-buffer)))
  (require 'company-tabnine)
  (add-hook 'c++-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           'company-tabnine)))
  ;; (add-to-list 'company-backends #'company-tabnine)

  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

  (setq x-select-enable-clipboard t)

  (defun copy-to-clipboard ()
    "Copies selection to x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (message "Yanked region to x-clipboard!")
          (call-interactively 'clipboard-kill-ring-save)
          )
      (if (region-active-p)
          (progn
            ;; (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
            (shell-command-on-region (region-beginning) (region-end) "nc -q0 localhost 5556")
            (message "Yanked region to clipboard!")
            (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))
    )

  (defun paste-from-clipboard ()
    "Pastes from x-clipboard."
    (interactive)
    (if (display-graphic-p)
        (progn
          (clipboard-yank)
          (message "graphics active")
          )
      (insert (shell-command-to-string "xsel -o -b"))
      )
    )
  (global-set-key (kbd "C-M-w") 'copy-to-clipboard)

  (defun show-file-name ()
    "Put the current file name on the clipboard"
    (interactive)
    (let ((filename (if (equal major-mode 'dired-mode)
                        default-directory
                      (buffer-file-name))))
      (when filename
        (with-temp-buffer
          (insert filename)
          (clipboard-kill-region (point-min) (point-max))
          )
        ;; to xsel
        (with-temp-buffer
          (insert filename)
          ;; (shell-command-on-region (point-min) (point-max) "xsel -i -b")
          (shell-command-on-region (point-min) (point-max) "nc -q0 localhost 5556")
          )
        (message filename))))

  (global-set-key (kbd "M-n") 'show-file-name)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  ;; sql-format
  (setq sqlformat-command 'sqlformat)
  (setq sqlformat-args '("-k" "upper"))
  ;; (setq sqlformat-command 'sqlfluff)
  ;; ;; see config in ~/.sqlfluff
  ;; (setq sqlformat-args '("--FIX-EVEN-UNPARSABLE" "--ignore" "parsing,templating"))

  ;; disable mouse
  (xterm-mouse-mode -1)

  (defun update-diff-refine-colors ()
    "update the colors for diff faces"
    (set-face-attribute 'diff-refine-added nil
                        :foreground "white" :background "darkgreen")
    (set-face-attribute 'diff-refine-removed nil
                        :foreground "blue" :background "darkred")
    (set-face-attribute 'diff-refine-changed nil
                        :foreground "white" :background "darkblue"))
  (eval-after-load "diff-mode"
    '(update-diff-refine-colors))

  (defun duplicate-line()
    (interactive)
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)
    )
  (global-set-key (kbd "C-M-y") 'duplicate-line)

  (add-to-list 'load-path "/home/r.yang/.emacs.d/private/local/autopair/") ;; comment if autopair.el is in standard load path 
  (require 'autopair)
  (autopair-global-mode) ;; enable autopair in all buffers

  (setq org-agenda-files '("~/.gtd/files"))
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "project")
            (tags-todo "daily")
            (tags-todo "weekly")
            (tags-todo "school")
            (tags-todo "code")
            (tags-todo "theory")
            ))
          ))

  (global-set-key (kbd "\C-c \C-a") 'org-agenda)

  (setq org-todo-keywords
        '((sequence "BUG(b!)" "|" "FIXED(f!)")
          (sequence "TODO(t!)" "SOMEDAY(s)" "|" "DONE(d!)" "CANCELED(c @/!)")
          ))

  ;; 自定义capture的模板
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/.gtd/files/")
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
  (setq org-agenda-file-calendar (expand-file-name "calendar.org" org-agenda-dir))
  (setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
  (setq org-agenda-file-canceled (expand-file-name "canceled.org" org-agenda-dir))

  ;; org agenda clock table 显示 7 层，以及时间占比
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 7 :fileskip0 t :compact t :narrow 80 :formula %)))

  (global-set-key (kbd "\C-c \C-c") 'org-capture)

  (setq org-capture-templates
        '(
          ("a" "Todo P0" entry (file+headline org-agenda-file-task "Work P0")
           "* TODO [#A] %?\n  %i\n"
           :empty-lines 1)
          ("b" "Todo P1" entry (file+headline org-agenda-file-task "Work P1")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("c" "Todo P2" entry (file+headline org-agenda-file-task "Work P2")
           "* TODO [#C] %?\n  %i\n"
           :empty-lines 1)
          ("l" "Tolearn" entry (file+headline org-agenda-file-task "Learning")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("d" "Todebug" entry (file+headline org-agenda-file-task "Bugs")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("h" "Toplay" entry (file+headline org-agenda-file-task "Hobbies")
           "* TODO [#C] %?\n  %i\n"
           :empty-lines 1)
          ("o" "Todo_others" entry (file+headline org-agenda-file-task "Others")
           "* TODO [#C] %?\n  %i\n"
           :empty-lines 1)
          ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          ("i" "ideas" entry (file+headline org-agenda-file-note "Quick ideas")
           "* %?\n  %i\n %U"
           :empty-lines 1)
          )
        )

  (global-set-key (kbd "C-c C-r") 'org-refile)
  (setq org-refile-targets  '((org-agenda-file-finished :maxlevel . 1)
                              (org-agenda-file-canceled :maxlevel . 1)
                              ))

  (require 'ob-go)
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["unspecified-bg" "#ff8787" "#5fff87" "#ffff87" "#5f5faf" "#af87ff" "#87d7ff" "#ffffff"])
 '(custom-safe-themes
   '("7e44382edb397efb81467d1612b58fb041743e264de140fdc0e0829694dc9c36" "903c954bd56d5edc5e8f93916781304b78f031b3bf8f5813e3d46fcf899986aa" "c5de667735c6be6ef2f9d9757df3fcee621e87ed235c841660e5b8efae138ec6" "6548046bfae6f4d691b614712bd08f965d83948fbf77dc4027f5c920270bf586" "484f0a5fb6cf7332a68272f143257e9136d7954b53bb6b88908d664e5444eb68" "82690df462e96b0f2cca202e084039aca518021fd1dade2e85834c2946a561b8" "1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style 'helm)
 '(package-selected-packages
   '(ob-go company-go typescript-mode import-js grizzl add-node-modules-path restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well nginx-mode adoc-mode markup-faces toml-mode ron-mode racer rust-mode helm-gtags ggtags flycheck-rust counsel-gtags cargo sqlformat goto-chg go-add-tags dockerfile-mode yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toc-org terminal-here tagedit symon symbol-overlay string-inflection string-edit sphinx-doc spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters quickrun pytest pyenv-mode pydoc py-isort pug-mode protobuf-mode prettier-js popwin poetry plantuml-mode pippel pipenv pip-requirements pcre2el password-generator paradox overseer orgit-forge org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-cliplink open-junk-file nyan-mode npm-mode nose nodejs-repl nameless multi-term multi-line mmm-mode markdown-toc macrostep lsp-ui lsp-python-ms lsp-pyright lsp-origami lsp-ivy lorem-ipsum livid-mode live-py-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-rtags ivy-purpose inspector info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-flx helm-descbinds helm-ctest helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate google-c-style golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link gh-md gendoxy fuzzy font-lock+ flyspell-correct-helm flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-package flycheck-elsa flx-ido find-file-in-project fill-column-indicator figlet fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav editorconfig edit-indirect dumb-jump drag-stuff dracula-theme dotenv-mode disaster dired-quick-sort diminish define-word dap-mode cython-mode csv-mode cpp-auto-include counsel-projectile counsel-etags counsel-css company-ycmd company-web company-rtags company-c-headers company-anaconda column-enforce-mode cmake-mode clean-aindent-mode centered-cursor-mode ccls blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-mode ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
