#!/usr/bin/env python3

import os
import os.path
import sys


if len(sys.argv) < 3:
    sys.stderr.write("Usage: ediff file1 file2")
else:
    file1 = os.path.abspath(sys.argv[1])
    file2 = os.path.abspath(sys.argv[2])
    if os.sep == "/":  # windows
        file1 = file1.replace("\\", "/")
        file2 = file2.replace("\\", "/")
        # cmd = """emacsclient -c -nw --eval "(progn (setq ediff-split-window-function 'split-window-horizontally) (set-face-attribute 'diff-refine-added nil :foreground \\"white\\" :background \\"darkgreen\\") (set-face-attribute 'diff-refine-removed nil :foreground \\"white\\" :background \\"darkred\\") (set-face-attribute 'diff-refine-changed nil :foreground \\"white\\" :background \\"darkblue\\") (ediff-files \\"%s\\" \\"%s\\"))" """ % (file1, file2)
        cmd = """emacs -nw -q --eval "(progn (setq make-backup-files nil) (setq auto-save-default nil) (setq ediff-split-window-function 'split-window-horizontally) (custom-set-faces '(ediff-current-diff-A ((t (:foreground \\"Black\\" :background \\"#7fd4b1\\")))) '(ediff-current-diff-B ((t (:foreground \\"Black\\" :background \\"#99d4b2\\")))) '(ediff-fine-diff-B ((t (:foreground \\"Black\\" :background \\"#f4b2b1\\")))) '(ediff-even-diff-A ((t (:foreground \\"White\\" :background \\"#434154\\")))) '(ediff-even-diff-B ((t (:foreground \\"White\\" :background \\"#434154\\")))) '(ediff-odd-diff-A ((t (:foreground \\"White\\" :background \\"#434154\\")))) '(ediff-odd-diff-B ((t (:foreground \\"White\\" :background \\"#434154\\"))))) (ediff-files \\"%s\\" \\"%s\\"))" """ % (file1, file2)
        os.system(cmd)
