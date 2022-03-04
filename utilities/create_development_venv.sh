#!/bin/bash
## ---------------------------------------------------------------------
##
## PartExa - A Particle Library for the Exa-Scale
##
## Copyright (C) 2022 by the PartExa authors
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <https://www.gnu.org/licenses/>.
##
## ---------------------------------------------------------------------

PARTEXA_DIR="$(readlink -f $(dirname $0)/..)"
VENV_NAME="venv/"
VENV_DIR="${PARTEXA_DIR}/${VENV_NAME}"

# Option to override default virtual environment location by user
if [ - n "$1" ]; then
  VENV_DIR="$1"
fi

if [[ -d "$VENV_DIR" ]]; then
  echo "Removing existing virtual environment."
  rm -r "$VENV_DIR"
  echo "$VENV_DIR"
fi

echo "Creating virtual environment $VENV_DIR"
python3 -m venv "$VENV_DIR"
source "$VENV_DIR"/bin/activate
pip install -r "$PARTEXA_DIR/requirements.txt"

echo "Activate venv with: source "$VENV_DIR"/bin/activate"
