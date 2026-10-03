#
# Env
#

fish_add_path "$HOME/.local/bin"

set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx FZF_DEFAULT_OPTS_FILE "$HOME/.config/fzf/rc"
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/rc"

if status is-interactive
  # Commands to run in interactive sessions can go here

  #
  # Theme
  #

  set -g fish_color_normal white
  set -g fish_color_command magenta
  set -g fish_color_builtin magenta
  set -g fish_color_function magenta
  set -g fish_color_keyword red
  set -g fish_color_quote cyan
  set -g fish_color_redirection white
  set -g fish_color_end red
  set -g fish_color_error red
  set -g fish_color_param white
  set -g fish_color_valid_path white
  set -g fish_color_option white
  set -g fish_color_comment brblack
  set -g fish_color_selection --reverse
  set -g fish_color_operator red
  set -g fish_color_escape green
  set -g fish_color_autosuggestion brblack
  set -g fish_color_cwd white
  set -g fish_color_cwd_root yellow
  set -g fish_color_user blue
  set -g fish_color_host cyan
  set -g fish_color_host_remote red
  set -g fish_color_status red
  set -g fish_color_cancel yellow
  set -g fish_color_search_match black --background=yellow
  set -g fish_color_history_current black --background=blue

  #
  # Greeter
  #

  function fish_greeting
    echo (set_color yellow)"There was a time when Einstein couldn't count to ten
A year from now you may wish you had started today
"
  end

  #
  # Keybind
  #

  bind \cy end-of-line

  #
  # Alias
  #

  # Simple Alias

  alias shis='history | fzf | wl-copy -n'
  alias rebuild='sudo nixos-rebuild switch'
  alias update='sudo nixos-rebuild switch --upgrade'
  alias vim='nvim'
  alias lazyvim='env NVIM_APPNAME=lazyvim nvim'

  # Complex Alias

  function sf
    set file (fd -H -t f -E '.git' | fzf)
    if test -n "$file"
      nvim "$file"
    end
  end

  function sd
    set dir (fd -H -t d -E '.git' | fzf)
    if test -n "$dir"
      cd "$dir"
    end
  end

  function fgu
    fd -H -t d -g '.git' -E '**/.*/**/.git' \
      -x echo '{//}' ';' \
      -x git -C '{//}' -c color.ui=always status -s
  end

  function mp4
    yt-dlp -S "vcodec:h264,res:1080" --remux mp4 --merge mp4 \
      --embed-metadata --embed-thumbnail \
      -o "%(channel)s - %(title)s.%(ext)s" $argv[1]
  end

  function mp3
    yt-dlp -f bestaudio --extract-audio --audio-quality 0 --audio-format mp3 \
      --embed-metadata --embed-thumbnail \
      --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'min(iw,ih)':'min(iw,ih)'\"" \
      -o "%(channel)s - %(title)s.%(ext)s" $argv[1]
  end

  function fcut
    ffmpeg -i $argv[1] -ss $argv[2] -to $argv[3] -c copy $argv[4]
  end

end
