#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

main()
{
  datafile=/tmp/.tmux-data

  # set configuration option variables
  show_fahrenheit=$(get_tmux_option "@show-fahrenheit" true)
  show_location=$(get_tmux_option "@show-location" true)
  show_powerline=$(get_tmux_option "@show-powerline" false)
  show_flags=$(get_tmux_option "@show-flags" false)
  show_left_icon=$(get_tmux_option "@show-left-icon" pill)
  show_left_icon_padding=$(get_tmux_option "@show-left-icon-padding" 1)
  show_military=$(get_tmux_option "@show-military-time" true)
  show_timezone=$(get_tmux_option "@show-timezone" true)
  show_left_sep=$(get_tmux_option "@show-left-sep" \|)
  show_right_sep=$(get_tmux_option "@show-right-sep" \|)
  show_border_contrast=$(get_tmux_option "@show-border-contrast" false)
  show_day_month=$(get_tmux_option "@show-day-month" false)
  show_refresh=$(get_tmux_option "@show-refresh-rate" 5)
  IFS=' ' read -r -a plugins <<< $(get_tmux_option "@info-list" "battery network weather")

  # Tokyonight Moon Color Pallette
  white='#c8d3f5'
  grey='#222436'
  dark_grey='#1e2030'
  light_purple='#fca7ea'
  dark_purple='#c099ff'
  blue='#82aaff'
  cyan='#86e1fc'
  green='#c3e88d'
  orange='#ff966c'
  red='#ff757f'
  pink='#c099ff'
  yellow='#ffc777'
  terminal_black='#444a73'

  # Handle left icon configuration
  case $show_left_icon in
    smiley)
      left_icon="☺";;
    session)
      left_icon="#S";;
    window)
      left_icon="#W";;
    pill)
      left_icon="";;
    *)
      left_icon=$show_left_icon;;
  esac

  # Handle left icon padding
  padding=""
  if [ "$show_left_icon_padding" -gt "0" ]; then
    padding="$(printf '%*s' $show_left_icon_padding)"
  fi
  left_icon="$left_icon$padding"

  # Handle separators
  right_sep="$show_right_sep"
  left_sep="$show_left_sep"

  # start weather script in background
  if [[ "${plugins[@]}" =~ "weather" ]]; then
    $current_dir/sleep_weather.sh $show_fahrenheit $show_location &
  fi

  # Set timezone unless hidden by configuration
  case $show_timezone in
    false)
      timezone="";;
    true)
      timezone="#(date +%Z)";;
  esac

  case $show_flags in
    false)
      flags=""
      current_flags="";;
    true)
      flags="#{?window_flags,#[fg=${dark_purple}]#{window_flags},}"
      current_flags="#{?window_flags,#[fg=${light_purple}]#{window_flags},}"
  esac

  # sets refresh interval to every 5 seconds
  tmux set-option -g status-interval $show_refresh

  # set the prefix + t time format
  if $show_military; then
    tmux set-option -g clock-mode-style 24
  else
    tmux set-option -g clock-mode-style 12
  fi

  # set length
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100

  # pane border styling
  tmux set-option -g pane-active-border-style "fg=${terminal_black}"
  tmux set-option -g pane-border-style "fg=${grey}"

  # message styling
  tmux set-option -g message-style "bg=${grey},fg=${white}"

  # status bar
  tmux set-option -g status-style bg=default

  # status left
  tmux set-option -g status-left "#[bg=default,fg=${blue}]#{?client_prefix,#[fg=${dark_purple}],}"
  tmux set-option -ga status-left "#[bg=${blue},fg=${dark_grey}]#{?client_prefix,#[bg=${dark_purple}],} ${left_icon}"

  # status right
  tmux set-option -g status-right "#[bg=default,fg=${terminal_black}]"

  for plugin in "${plugins[@]}"; do

    if [ $plugin = "git" ]; then
      IFS=' ' read -r -a colors  <<< $(get_tmux_option "@git-colors" "terminal_black blue")
        script="#($current_dir/git.sh)"
    fi

    if [ $plugin = "battery" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@battery-colors" "terminal_black blue")
      script="#($current_dir/battery.sh)"
    fi

    if [ $plugin = "cpu-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@cpu-usage-colors" "terminal_black blue")
      script="#($current_dir/cpu_info.sh)"
    fi

    if [ $plugin = "ram-usage" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@ram-usage-colors" "terminal_black blue")
      script="#($current_dir/ram_info.sh)"
    fi

    if [ $plugin = "network" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@network-colors" "terminal_black blue")
      script="#($current_dir/network.sh)"
    fi

    if [ $plugin = "network-bandwith" ]; then
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@network-bandwith-colors" "terminal_black blue")
      tmux set-option -g status-right-length 250
      script="#($current_dir/network_bandwith.sh)"
    fi

    if [ $plugin = "weather" ]; then
      # wait unit $datafile exists just to avoid errors
      # this should almost never need to wait unless something unexpected occurs
      while [ ! -f $datafile ]; do
        sleep 0.01
      done

      IFS=' ' read -r -a colors <<< $(get_tmux_option "@weather-colors" "terminal_black blue")
      script="#(cat $datafile)"
    fi

    if [ $plugin = "time" ]; then
      tmux set-option -g status-right-length 250
      IFS=' ' read -r -a colors <<< $(get_tmux_option "@time-colors" "blue dark_grey")
      if $show_day_month && $show_military ; then # military time and dd/mm
        script="%a %d/%m %R ${timezone}"
      elif $show_military; then # only military time
        script="%a %m/%d %R ${timezone}"
      elif $show_day_month; then # only dd/mm
        script="%a %d/%m %I:%M %p ${timezone}"
      else
        script="%a %m/%d %I:%M %p ${timezone}"
      fi
    fi

    if [ $plugin = "time" ] || [ $plugin = "network" ]; then
      tmux set-option -ga status-right "#[fg=${!colors[1]},bg=${!colors[0]}] $script "
    else
      tmux set-option -ga status-right "#[fg=${!colors[1]},bg=${!colors[0]}] $script ${right_sep} "
    fi
  done

  tmux set-option -ga status-right "#[fg=${blue},bg=default]"

  # Window option
  tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_grey}] #I #W${current_flags} "
  tmux set-window-option -g window-status-activity-style "bold"
  tmux set-window-option -g window-status-format "#[fg=${terminal_black}]#[bg=default] #I #W${flags} "
  tmux set-window-option -g window-status-bell-style "bold"
}

# run main function
main
