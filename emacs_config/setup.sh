set -e

echo "SETUP_REPO_DIR:" ${SETUP_REPO_DIR}

sudo apt-get update &&\
    apt-get install emacs jo jq


mkdir -p ~/.emacs.d
cp ${SETUP_REPO_DIR}/emacs_config/init.el ~/.emacs.d/
package_names=`cat ${SETUP_REPO_DIR}/emacs_config/packages.list | xargs echo`
sed -i s@%PACKAGES%@"${package_names}"@g ~/.emacs.d/init.el

elisp_code="
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '(\"melpa\" . \"http://elpa.emacs-china.org/melpa/\") t)
(add-to-list 'package-archives
	     '(\"org\" . \"http://elpa.emacs-china.org/gnu/\") t)
(setq url-http-attempt-keepalives nil)
(setq package-check-signature nil)
(custom-set-variables
 '(package-selected-packages
   (quote
    (${package_names})
   )
  )
)
(package-refresh-contents)
(package-install-selected-packages)"

elisp_script_name=$(mktemp /tmp/emacs-pkg-install-el.XXXXXX)
echo "$elisp_code" > $elisp_script_name

emacs -nw -q --batch -l $elisp_script_name <<EOF
y
EOF

rm "$elisp_script_name"

echo "SUCCESS"
