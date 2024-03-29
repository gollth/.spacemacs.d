;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; FRAMEWORKS
     asciidoc
     multiple-cursors
     helm
     debug
     docker
     ranger
     (org :variables org-want-todo-bindings t)
     search-engine
     (shell :variables
            shell-default-height 30
            shell-default-term-shell "/usr/bin/zsh"
            shell-default-position 'bottom)
     react
     git
     (lsp :variables
          lsp-auto-guess-root t
          lsp-before-save-edits nil
          lsp-enable-file-watchers t
          lsp-enable-indentation nil
          lsp-enable-on-type-formatting nil
          lsp-enable-symbol-highlighting nil
          lsp-file-watch-threshold nil
          lsp-headerline-breadcrumb-enable t
          lsp-prefer-flymake nil
          lsp-ui-doc-border (face-foreground 'default)
          lsp-ui-doc-delay 0
          lsp-ui-doc-enable nil
          lsp-ui-doc-header t
          lsp-ui-doc-include-signature t
          lsp-ui-sideline-enable nil
          lsp-ui-sideline-ignore-duplicate t
          lsp-ui-sideline-show-code-actions t)
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets")
     (syntax-checking :variables syntax-checking-enable-by-default t)

     ;; LANGUAGES
     (haskell :variables
              haskell-enable-hindent t)
     javascript
     (typescript :variables
                 typescript-fmt-tool 'prettier)
     python
     (c-c++ :variables
            c-c++-backend 'lsp-ccls
            c-c++-adopt-subprojects t
            c-c++-lsp-enable-semantic-highlight t
            c-c++-enable-clang-format-on-save t
            c-c++-default-mode-for-headers 'c++-mode)
     html
     protobuf
     csv
     go
     lua
     rust
     markdown
     groovy
     yaml
     emacs-lisp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     cmake-mode
     helm-ros
     helm-catkin
     helm-evil-markers
     evil-visual-mark-mode
     exec-path-from-shell
     eslint-fix
     el-mock
     xclip
     prettier-js
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(vi-tilde-fringe)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((projects . 25))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; Default indentation for Java/C/C++
   c-basic-offset 2
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq-default
   ;; themes
   dotspacemacs-themes '(planet
                         monokai
                         subatomic256)

   ;; Git Status Buffer always in Fullscreen
   git-magit-status-fullscreen t

   ;; Ignore any ROS environment variables since they might change depending
   ;; on which catkin workspace is used. When a new catkin workspace is chosen
   ;; call `spacemacs/update-ros-envs' to update theses envs accordingly
   spacemacs-ignored-environment-variables '("ROS_IP"
                                             "PYTHONPATH"
                                             "CMAKE_PREFIX_PATH"
                                             "ROS_MASTER_URI"
                                             "ROS_PACKAGE_PATH"
                                             "ROSLISP_PACKAGE_DIRECTORIES"
                                             "PKG_CONFIG_PATH"
                                             "LD_LIBRARY_PATH"))

  ;; Disalbe "package cl is depreciated" warning until better solution exists
  (setq byte-compile-warnings '(cl-functions))

  ;; Use GNU ls instead of normal ls on OSX because emacs requires --dired option
  (when (string= system-type "darwin")
    (setq insert-directory-program "/usr/local/bin/gls")))


(defun spacemacs/update-ros-envs ()
  "Update all environment variables in `spacemacs-ignored-environment-variables'
from their values currently sourced in the shell environment (e.g. .bashrc)"
  (interactive)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-copy-envs spacemacs-ignored-environment-variables)
  (message "ROS environment copied successfully from shell"))

(defun set-marker-a () "Saves current POS to marker a" (interactive) (evil-set-marker ?a) (message "Set Marker A to line %s" (line-number-at-pos)))
(defun set-marker-b () "Saves current POS to marker b" (interactive) (evil-set-marker ?b) (message "Set Marker A to line %s" (line-number-at-pos)))
(defun set-marker-d () "Saves current POS to marker c" (interactive) (evil-set-marker ?c) (message "Set Marker A to line %s" (line-number-at-pos)))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Roslaunch-Jump Package
  (load-file "~/.emacs.d/private/roslaunch-jump/roslaunch-jump.el")

  ;; Ligatures in Fira Font
  (load-file "~/.spacemacs.d/fira-code.el")

  ;; Lingua Franka Mode
  (load-file "~/.emacs.d/private/lingua-franka/lf-mode.el")
  (add-to-list 'auto-mode-alist '("\\.lf$" . lf-mode))
  (setq lsp-lf-executable (file-truename "~/.bin/lfls"))
  (add-hook 'lf-mode-hook #'(lambda () (lsp 1)))

  ;; Set google as default search engine
  (spacemacs/set-leader-keys "ag" 'engine/search-google)
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")

  ;; General Appearance
  (spacemacs/toggle-indent-guide-globally-on)
  (spacemacs/toggle-auto-fill-mode-off)
  (setq find-file-visit-truename t)             ;; follow symlinks
  (setq helm-completion-style 'helm-fuzzy)      ;; set Helm searches to match fuzzily
  (spacemacs/set-leader-keys "zz" 'spacemacs/scale-font-transient-state/body)   ;; Zoom by scaling font size
  (spacemacs/set-leader-keys "xx" 'query-replace)

  ;; for nice programming ligatures (only in GUI)
  (when (display-graphic-p) (add-hook 'prog-mode-hook 'fira-code-mode))

  ;; Multi-Cursor
  (global-set-key (kbd "C-k") 'evil-mc-undo-all-cursors)

  (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t)))
  (global-set-key (kbd "C-+") 'spacemacs/scale-up-font)
  (global-set-key (kbd "C--") 'spacemacs/scale-down-font)
  (spacemacs/set-leader-keys "ic" 'insert-char)
  (global-set-key (kbd "C-c C-z") 'suspend-frame)   ;; useful for cli mode

  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-modified-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-point-position-off)
  (spaceline-toggle-which-function-off)
  (spaceline-toggle-purpose-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-line-column-off)

  (xclip-mode t) ;; enable copy/paste

  ;; Evil Mode
  (evil-define-key 'normal global-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (evil-define-key 'normal global-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (spacemacs/set-leader-keys "gg" 'goto-line)
  (spacemacs/set-leader-keys "na" 'set-marker-a)
  (spacemacs/set-leader-keys "nn" 'helm-evil-markers)
  (spacemacs/set-leader-keys "nb" 'set-marker-b)
  (spacemacs/set-leader-keys "nc" 'set-marker-c)
  (spacemacs/set-leader-keys "nl" 'evil-show-marks)
  (spacemacs/set-leader-keys "nt" 'evil-visual-mark-mode)
  (spacemacs/set-leader-keys "nx" 'evil-delete-marks)

  ;; define some characters to be part of a sympbol depending on the mode
  (add-hook 'emacs-lisp-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))  ; will treat foo-bar as one symbol
  ;; for all other programming modes
  (add-hook 'prog-mode-hook       #'(lambda () (modify-syntax-entry ?_ "w")))  ; will treat foo_bar as one symbol

  ;; The "Silver Searcher" (ag)
  (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
  (setq helm-swoop-use-fuzzy-match t)
  (setq helm-swoop-use-line-number-face nil)

  ;; Ranger
  (spacemacs/set-leader-keys "ar" 'ranger)

  ;; ROS shortcut
  (spacemacs/update-ros-envs)  ;; do this once initially
  (spacemacs/set-leader-keys "ye" 'spacemacs/update-ros-envs)
  (spacemacs/declare-prefix "y" "ROS")
  (spacemacs/set-leader-keys "yy" 'helm-ros)

  (spacemacs/declare-prefix "yt" "ROS topics")
  (spacemacs/set-leader-keys "ytt" 'helm-ros-topics)
  (spacemacs/set-leader-keys "ytz" 'helm-ros-rostopic-hz)
  (spacemacs/set-leader-keys "yti" 'helm-ros-rostopic-info)

  (spacemacs/declare-prefix "yn" "ROS nodes")
  (spacemacs/set-leader-keys "yni" 'helm-ros-rosnode-info)
  (spacemacs/set-leader-keys "ynn" 'helm-ros-rosnode-list)
  (spacemacs/set-leader-keys "ynd" 'helm-ros-kill-node)
  (spacemacs/set-leader-keys "ynr" 'helm-ros-run-node)

  (spacemacs/set-leader-keys "ym" 'helm-ros-set-master-uri)
  (spacemacs/set-leader-keys "yM" 'helm-ros-roscore)

  ;; Catkin shortcut
  (spacemacs/declare-prefix "yc" "Catkin")
  (spacemacs/set-leader-keys "ycc" 'helm-catkin)
  (spacemacs/set-leader-keys "ycb" 'helm-catkin-build)
  (spacemacs/set-leader-keys "ycW" 'helm-catkin-no-workspace)
  (spacemacs/set-leader-keys "ycw" 'helm-catkin-set-workspace)
  (spacemacs/set-leader-keys "ycr" 'helm-catkin-get-workspace-root)
  (spacemacs/set-leader-keys "ycx" 'helm-catkin-clean)
  (spacemacs/set-leader-keys "yci" 'helm-catkin-init)
  (spacemacs/set-leader-keys "yco" 'helm-catkin-config-open)
  (add-hook 'helm-catkin-build-done-hook #'evil-force-normal-state)

  ;; C/C++ Mode
  (require 'ccls)
  (with-eval-after-load 'ccls
    (setq ccls-root-files (add-to-list 'ccls-root-files "build/compile_commands.json" t))
    (setq ccls-sem-highlight-method 'font-lock)
    (setq ccls-initialization-options
          (list :cache (list :directory (file-truename (concat (file-name-as-directory spacemacs-cache-directory) ".ccls-cache")))
                :compilationDatabaseDirectory "build"))
    (setq ccls-executable (file-truename "~/.spacemacs.d/ccls/Release/ccls")))

  ;; Python interpreter
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--classic --no-banner --pprint")

  ;; Semantic helm
  (spacemacs/set-leader-keys-for-major-mode 'c-mode "?" 'helm-semantic-or-imenu)
  (spacemacs/set-leader-keys-for-major-mode 'c++-mode "?" 'helm-semantic-or-imenu)
  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode "?" 'helm-semantic-or-imenu)
  (spacemacs/set-leader-keys-for-major-mode 'go-mode "?" 'helm-semantic-or-imenu)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "?" 'helm-semantic-or-imenu)

  ;; Haskell
  (setq haskell-hoogle-command "hoogle -i")

  ;; Rust
  (setq rust-format-on-save t)
  (setq racer-rust-src-path (getenv "RUST_SRC_PATH"))

  ;; Associate modes to file extensions
  (add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.urdf$"   . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.xacro$"  . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.test$"   . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx$"    . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.js$"     . rjsx-mode))

  ;; Autocompletion configuration
  (global-company-mode)
  (use-package company
    :ensure t
    :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 2))

  (define-key global-map (kbd "C-SPC") 'company-complete)


  (add-hook 'rjsx-mode-hook
            (lambda()
              (spacemacs/set-leader-keys "ef"
                'eslint-fix)))
  (add-hook 'rjsx-mode-hook
            (lambda()
              (spacemacs/set-leader-keys "dd"
                'js-doc-insert-function-doc)))
  (add-hook 'rjsx-mode-hook
            (lambda()
              (spacemacs/set-leader-keys "da"
                'js-doc-insert-tag)))
  (add-hook 'markdown-mode-hook 'spacemacs/toggle-truncate-lines-off)

  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

  ;; Bind clang-format to C-` in all modes:
  (global-set-key (kbd "C-`") 'spacemacs/clang-format-region-or-buffer)
  )

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
 '(package-selected-packages
   (quote
    (magit-section dap-mode bui format-all helm-gtags ggtags counsel-gtags company-lua lua-mode cmake-project xclip yasnippet-snippets yapfify yaml-mode ws-butler winum which-key web-mode web-beautify volatile-highlights uuidgen use-package unfill toc-org tagedit symon subatomic256-theme string-inflection spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode rjsx-mode restart-emacs realgud ranger rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin planet-theme pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omnisharp neotree nameless mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc intero indent-guide importmagic impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-ros helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate google-c-style golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy font-lock+ flycheck-ycmd flycheck-rtags flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eslint-fix eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav el-mock editorconfig dumb-jump dotenv-mode doom-modeline disaster diminish diff-hl define-word cython-mode counsel-projectile company-ycmd company-web company-tern company-statistics company-rtags company-cabal company-c-headers company-anaconda column-enforce-mode cmm-mode clean-aindent-mode clang-format centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
