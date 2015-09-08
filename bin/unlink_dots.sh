#! /usr/bin/env bash
#****************** unlink_dots.sh *******************
# created: 2014/12/01
# Last Change:2015-Sep-08.
#
# --- abst ---
# unlink dotfiles
#************************************************************

# dotfiles dir
DOTSDIR="${HOME}/.dotfiles"
DOTFILES="${DOTSDIR}/.*"

for dots in ${DOTFILES}
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
