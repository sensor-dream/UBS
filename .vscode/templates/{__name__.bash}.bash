#!/bin/env bash
# -*- coding: utf-8 -*-
#
## @Author: {__author__}
## @Email: {__email__}
## @Copyright © {__author__}. All rights reserved. Contacts: {__email__}
## @Copyright © sensor-dream. All rights reserved. Contacts: {__email__}
## @Copyright © Sensor-Dream Boxed System (SDBS). Contacts: {__email__}
## @License: http://www.apache.org/licenses/LICENSE-2.0
## @Site: {__link__}
## @File: {__name__}.bash
## @Creation date file: {__date__}

[[ -z "${{__name__}_script_source}" ]] && declare -rx {__name__}_script_source="$BASH_SOURCE"

if [[ -z "${{__name__}_script_source_path}" ]]; then
  temp_one="$(dirname ${{__name__}_script_source})"
  if [[ "${temp_one}" == '.' ]]; then
    declare -rx {__name__}_script_source_path="$(pwd)"
  else
    declare -rx {__name__}_script_source_path="${temp_one}"
  fi
fi

if [[ -z "${main_run_script_path}" ]]; then
  declare -rx main_run_script_path="$(pwd)";
  printf "Script runs from path: %s\n" "${main_run_script_path}\n";
fi

if [[ -z "${main_cfg_script_source}" ]]; then
  check=1;
  while [[ ${check} -eq 1 ]]; do
    if [[ ! -f 'main.cfg' ]]; then
      if [[ "$(pwd)" != "/" ]]; then
        cd ../;
      else
        cd ${main_run_script_path};
        check=0;
        echo -e '\e[31m'"!!! Not found configuration shared file !!!\033[0m";
        tput sgr0;
        exit 1;
      fi
    else
      check=0;
      declare -rx main_project_path="$(pwd)";
      . "${main_project_path}/main.cfg" "$@";
      cd "${main_run_script_path}";
    fi
  done
fi

printf "Loading: %s\n" $(readlink -m ${BASH_SOURCE})";

function install_{__name__}(){

  local install_pkg=(\

);


  printf '%s\n' $(unset_dupes_in_array "${install_pkg[@]}") | sort -o "${main_project_path}/package-list/{__name__}.txt"
  pm  "$@" -- "${install_pkg[@]}"

}

function main_{__name__}_script_source(){

  # printtf "Initialise main function of {__name__} script source\n";

  install_{__name__} "$@"

}

main_{__name__}_script_source "$@";
