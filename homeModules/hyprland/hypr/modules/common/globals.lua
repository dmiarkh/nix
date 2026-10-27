local M = {}

M.exec_prefix = "uwsm app -- "

M.programs = {}
M.programs.launcher_menu = "rofi -show drun -run-command '" .. M.exec_prefix .. "{cmd}'"
M.programs.terminal = "ghostty"
M.programs.browser = "vivaldi"
M.programs.file_manager = "nemo"
M.programs.swayosd =
	"swayosd-client --duration 1500 --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\""

return M
