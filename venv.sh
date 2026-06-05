#! /usr/bin/env false
# Use a false shebang since it won't work if run as executable.
VENV_PATH=.venv
if test -d "${VENV_PATH}"/bin
then
    # Linux / macOS
    . "${VENV_PATH}"/bin/activate
elif test -d "${VENV_PATH}"/Scripts
then
    # Windows
    . "${VENV_PATH}"/Scripts/activate
else
    printf "Error: cannot find virtual environment: '%s'.\n" "${VENV_PATH}" >&2
fi
