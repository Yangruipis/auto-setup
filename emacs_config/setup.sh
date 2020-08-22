set -e

echo "SETUP_REPO_DIR:" ${SETUP_REPO_DIR}

sudo apt-get update &&\
    apt-get install emacs jo jq


mkdir -p ~/.emacs.d
[ ! -f ~/.emacs.d/init.el ] && cp ${SETUP_REPO_DIR}/emacs_config/init.el ~/.emacs.d/

elisp_code="
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '(\"melpa\" . \"http://elpa.emacs-china.org/melpa/\") t)
(add-to-list 'package-archives
	     '(\"org\" . \"http://elpa.emacs-china.org/gnu/\") t)
(setq url-http-attempt-keepalives nil)
(package-refresh-contents)
(package-install-selected-packages)"

elisp_script_name=$(mktemp /tmp/emacs-pkg-install-el.XXXXXX)
echo "$elisp_code" > $elisp_script_name

emacs -nw -q --batch -l $elisp_script_name

rm "$elisp_script_name"
