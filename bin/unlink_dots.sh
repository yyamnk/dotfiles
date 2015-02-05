#! /usr/bin/env bash
#****************** unlink_dots.sh *******************
# created: 2014/12/01
# Last Change:2015-Feb-03.
#
# --- abst ---
# unlink dotfiles
#************************************************************

# dotfiles dir
DOTSDIR="${HOME}/Dropbox/dotfiles/"
dotfiles="${DOTSDIR}.*"

for dots in ${dotfiles}
do
    case "${dots}" in
        *.DS_Store ) ;;
        *.         ) ;;
        *..        ) ;;
        *.git      ) ;;
        *          )
            echo "unlink ~/`basename $dots`"
            unlink ~/`basename $dots`
    esac
done
