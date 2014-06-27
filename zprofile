# Use on a Mac to keep OS X from munging the paths when using tmux or screen
# Alias to ~/.zprofile

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi
