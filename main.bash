#!/bin/bash -e
# Author : Quatrecentquatre-404
# Date : 29/06/2020
# GitHub link https://github.com/quatrecentquatre-404/mac-changer.git
# Required dependence: net-tools

function change_mac_address {
    local interface="${1}"
    local new_address="${2}"

    local down=$(ifconfig "${interface}" down)
    if [[ -z "${down}" ]]; then
        local change_hw_ether=$(ifconfig "${interface}" hw ether "${new_address}")
        if [[ -z "${change_hw_ether}" ]]; then
            local up=$(ifconfig "${interface}" up)
            if [[ -z "${up}" ]]; then
                echo 0
            fi
        fi
    fi
    echo 1
}

function main {
    local script_name="${0}"
    local interface="${1}"
    local new_address="${2}"
    if [[ -z "${interface}" || -z "${new_address}" ]]; then
        echo "Usage: ${script_name} <INTERFACE> <NEW_ADDRESS>"
        exit 1
    fi

    local change_mac_address_status=$(change_mac_address "${interface}" "${new_address}")
    if ! [[ -z change_mac_address_status ]]; then
        echo "An error occured while changing your MAC address. Please, verify the <INTERFACE> and the <NEW_ADDRESS>."
        exit 1
    fi

    local network_restart_status=$(/etc/init.d/networking restart)
    if [[ -z "${network_restart_status}" ]]; then
        echo "MAC address changed. If you want to get back Internet, you'll have to reboot your computer."
        exit 0
    else
        echo "An unknowed error occured while changing your configuration."
        exit 1
    fi
}

main "${@}"