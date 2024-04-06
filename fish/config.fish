if status is-interactive
    # Commands to run in interactive sessions can go here
    # Got to subman if already at home, else ignore
    pwd | read path_to_test; test $path_to_test = ~ && cd ~/Projects/internal/subscriptionmanagement/
    # [ -z "$VIM_TERMINAL" ] && vim -c ":term ++curwin" -u /home/daniel.winther.petersen/Projects/vimconfig/vimrc_terminal
end

# pnpm
set -gx PNPM_HOME "/home/daniel.winther.petersen/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
