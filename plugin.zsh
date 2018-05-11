TURTLE="🐢"

geometry_prompt_ros_master_setup() {}
geometry_prompt_ros_master_check() {
  [ ${+ROS_MASTER_URI} ] || return 1
}
geometry_prompt_ros_master_render() {
  if test "${ROS_MASTER_URI#*localhost}" != "$ROS_MASTER_URI"; then
    echo ":: %F{blue}$TURTLE%f"
  else
    # see https://stackoverflow.com/a/2506635/7232773
    foreign="$(echo $ROS_MASTER_URI | sed -e "s/[^/]*\/\/\([^@]*@\)\?\([^:/]*\).*/\2/")"
    echo ":: %F{red}$TURTLE  $foreign%f"
  fi
}

geometry_plugin_register ros_master
